---@return string
local function tree_current_dir()
	local api = require("nvim-tree.api")
	local node = api.tree.get_node_under_cursor()
	local path = node.absolute_path
	local dirname = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h")
	return dirname .. "/"
end

-- Create File カスタム（実ファイルを作成→保存→編集バッファへ）
local function custom_create()
	local current_dirname = tree_current_dir()

	vim.ui.input({ prompt = "Create File" }, function(input)
		if not input then
			vim.notify("入力がキャンセルされました", vim.log.levels.INFO)
			return
		end
		input = vim.trim(input)
		if input == "" then
			return
		end

		-- 禁止・不正チェック
		if input:find("%.%.") then
			vim.notify("❌ '..' は使えません", vim.log.levels.ERROR)
			return
		end
		if input:sub(1, 1) == "/" then
			vim.notify("❌ 入力の先頭に '/' は使えません", vim.log.levels.ERROR)
			return
		end

		local is_directory = input:sub(-1) == "/"
		local filename = current_dirname .. input -- 生パス（存在チェック/作成はこちらで）
		local dirname = vim.fn.fnamemodify(filename, ":h")

		-- 既存チェック
		if vim.fn.isdirectory(filename) == 1 then
			vim.notify(Get_home_path(filename), vim.log.levels.WARN, { title = "Duplicate directories" })
			return
		end
		if vim.fn.filereadable(filename) == 1 then
			vim.notify(Get_home_path(filename), vim.log.levels.WARN, { title = "Duplicate files" })
			return
		end

		-- ディレクトリ作成
		if is_directory then
			vim.fn.mkdir(filename, "p")
			vim.notify(Get_home_path(filename), vim.log.levels.INFO, { title = "Success Create Directory" })
			-- ツリーを即更新（任意）
			local ok, err = pcall(require("nvim-tree.api").tree.reload)
			if not ok then
				vim.notify(("ツリー更新に失敗: %s"):format(err or "unknown error"), vim.log.levels.ERROR)
			end
			return
		end

		-- 親ディレクトリ確保
		if vim.fn.isdirectory(dirname) == 0 then
			vim.fn.mkdir(dirname, "p")
		end

		-- 空ファイルを **ディスクに作成**（ここで既に保存状態）
		do
			local ok, err = pcall(vim.fn.writefile, {}, filename)
			if not ok then
				vim.notify(("ファイル作成に失敗: %s"):format(err or "unknown error"), vim.log.levels.ERROR)
				return
			end
		end

		-- いったん作った実ファイルを開く（編集画面へ移動）
		local esc = vim.fn.fnameescape(filename)
		vim.cmd("edit " .. esc)

		-- 念のため即保存（既に存在するが、バッファと同期させる意味で）
		do
			local ok, err = pcall(function()
				vim.cmd("silent write")
			end)
			if not ok then
				vim.notify(("即保存に失敗: %s"):format(err or "unknown error"), vim.log.levels.ERROR)
			end
		end

		vim.notify(Get_home_path(filename), vim.log.levels.INFO, { title = "Success Create & Open File" })

		-- ツリーを即更新（任意）
		do
			local ok, err = pcall(require("nvim-tree.api").tree.reload)
			if not ok then
				vim.notify(("ツリー更新に失敗: %s"):format(err or "unknown error"), vim.log.levels.ERROR)
			end
		end
	end)
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- nvim-tree 設定
		require("nvim-tree").setup({
			hijack_netrw = true,
			view = {
				width = 60,
				side = "right",
			},
			renderer = {
				root_folder_label = ":t",
				highlight_opened_files = "all", -- ← 開いているファイルを強調表示
			},
			update_focused_file = {
				enable = true, -- ← フォーカスしているファイルに自動で移動
				update_root = true, -- ← ルートディレクトリはそのまま
				ignore_list = {}, -- ← 無視するファイルタイプ（あれば指定）
			},
			git = {
				enable = true,
				ignore = true, -- ← .gitignore に従って dist などは非表示のまま
			},
			filters = {
				-- dotfiles = true, -- ← .git .env などのドットファイルを除外。custom で個別に除外
				custom = {
					"^.git$",
					-- "^.gitignore$",
				},
			},
			-- -- Live Filter オプション（任意）
			-- live_filter = {
			--   prefix = "🔍 ", -- プロンプト前に付く文字列
			--   always_show_folders = true, -- true にするとフォルダは常に表示
			-- },
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr)
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))

				vim.keymap.set("n", "v", api.node.open.vertical, opts("Vertical Split"))
				vim.keymap.set("n", "s", api.node.open.horizontal, opts("Horizontal Split"))

				-- ▼ 追加：ドットファイルの表示／非表示トグル
				--   デフォルトでは 'H' に割り当てられていますが、好みで変更できます。
				vim.keymap.set("n", "h", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))

				-- -- 使いやすいキーに上書きしても OK
				-- vim.keymap.set("n", "/", api.live_filter.start, opts("Live Filter: Start"))
				-- vim.keymap.set("n", "<Esc>", api.live_filter.clear, opts("Live Filter: Clear"))

				-- ■.gitignore トグル
				vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git-ignored"))

				vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
				-- vim.keymap.set("n", "n", ":NvimTreeToggle<CR>", opts("ファイラーの表示/非表示"))
				-- vim.keymap.set(
				-- 	"n",
				-- 	"<C-n>",
				-- 	":NvimTreeToggle<CR>",
				-- 	{ noremap = true, silent = true, desc = "ファイラーの表示/非表示" }
				-- )
				-- vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", opts("Prev buffer"))
				-- vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", opts("Next buffer"))

				-- デフォルトの a キーを無効化して上書き
				vim.keymap.set("n", "a", custom_create, opts("Custom Create File"))
			end,
		})
	end,
}
