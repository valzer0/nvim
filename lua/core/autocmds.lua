--[[
  自動コマンド設定: 外部変更されたファイルの自動チェック

  この設定は、Neovim にフォーカスが戻ったときやバッファを切り替えたときに
  外部でファイルが更新されていないかを自動的に確認します。

  - FocusGained: Neovim ウィンドウにフォーカスが戻ったとき
  - BufEnter: 別のバッファに切り替わったとき

  `:checktime` は、ファイルが外部で変更されていた場合に再読み込みを促す
  もしくは自動的に読み直す仕組みです（オプション設定による）。

  この設定は、複数のエディタを併用する場合や、
  Git や他のツールでファイルを更新した際の反映漏れを防ぎます。
]]
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })

-- -- Neovim起動時にファイルが開かれていない場合、空のバッファを編集・保存不可にする
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--
--     -- (任意) 何かメッセージを表示したい場合
--     vim.notify("Welcome!", vim.log.levels.INFO)
--     -- 無視したいファイルタイプ（主にファイラーなど）
--     local ignore_filetypes = {
--       netrw = true,    -- Neovim標準のファイラー
--       NvimTree = true, -- NvimTreeプラグイン
--       -- 他に使っているファイラーがあればここに追加
--       -- oil = true,
--     }
--     -- メッセージを格納するためのテーブル（Luaの配列のようなもの）
--     local messages = {}
--     local is_
--
--     -- vim.api.nvim_list_bufs() で現在有効なすべてのバッファ番号のリストを取得し、ループ処理する
--     for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--       -- バッファ名を取得
--       local bufname = vim.api.nvim_buf_get_name(bufnr)
--       if bufname == "" then
--         bufname = "[No Name]" -- バッファ名がない場合は代替テキストを表示
--       end
--
--       -- バッファのファイルタイプを取得
--       local filetype = vim.bo[bufnr].filetype
--       if filetype == "" then
--         filetype = "[no filetype]" -- ファイルタイプが設定されていない場合は代替テキストを表示
--       end
--
--       -- 表示する文字列をフォーマットして作成
--       local line = string.format("Buffer %d: %s (filetype: %s)", bufnr, bufname, filetype)
--       -- 作成した文字列を messages テーブルに追加
--       table.insert(messages, line)
--     end
--
--     -- messages テーブル内のすべての文字列を改行文字("\n")で連結し、一つのメッセージにする
--     local final_message = table.concat(messages, "\n")
--
--     -- vim.notifyで最終的なメッセージを通知として表示する
--     vim.notify(final_message, vim.log.levels.INFO, { title = "Buffer Filetypes" })
--
--     local current_buf_name = vim.api.nvim_buf_get_name(0)
--     local current_filetype = vim.bo[0].filetype
--
--
--     -- 条件:
--     -- 1. 現在のバッファにファイル名がない
--     -- 2. 現在のファイルタイプが、無視リストに含まれていない
--     if current_buf_name == "" and not ignore_filetypes[current_filetype] then
--       -- バッファの種類を 'nofile' に設定し、保存不可にする
--       vim.bo.buftype = "nofile"
--
--       -- バッファを編集不可に設定する
--       vim.bo.modifiable = false
--
--       -- (任意) 何かメッセージを表示したい場合
--       -- vim.notify("Welcome!", vim.log.levels.INFO)
--     end
--   end,
--   desc = "起動時にファイルが開かれていない場合、空のバッファを編集・保存不可にする",
-- })
--
---@return '"none"'|'"dir"'|'"file"'
local function startup_arg_type()
	local argc = vim.fn.argc() -- 引数の数

	-- 引数なし
	if argc == 0 then
		return "none"
	end

	-- -- argv(0) が 1 つ目の “編集対象” 引数
	local path = vim.fn.argv(0)

	if path == "NvimTree_1" then
		return "dir"
	end

	---@cast path string   -- ← 型キャストで警告解消
	path = vim.fn.fnamemodify(path, ":p")

	if vim.fn.isdirectory(path) == 1 then
		-- ディレクトリー指定
		return "dir"
	else
		-- ファイル指定（存在しなくても OK）
		return "file"
	end
end

-- 例: VimEnter で自動実行して確認
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("luasnip.loaders.from_lua").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
		})
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		-- HTML のタグ一覧（最低限、必要に応じて増やせます）
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true,
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- 行内に表示される仮想テキストのプレフィックス（記号やアイコンなど）
		spacing = 2, -- 仮想テキストとコードの間隔（デフォルトは1）

		-- format = function(diagnostic)
		--   return string.format("%s: %s", diagnostic.source, diagnostic.message)
		-- end,               -- 表示フォーマットをカスタマイズする関数
	},

	float = {
		border = "rounded", -- フロートウィンドウの枠線のスタイル（"single", "double", "rounded", "shadow", "none" など）
		source = "if_many", -- エラーの出所（LSP名）を表示（"if_many" | false）
		header = "Diagnostics", -- ウィンドウ上部のヘッダー文字列（任意）

		prefix = function(diagnostic, i, total)
			local icons = {
				[vim.diagnostic.severity.ERROR] = "", -- エラー
				[vim.diagnostic.severity.WARN] = "", -- 警告
				[vim.diagnostic.severity.INFO] = "", -- 情報
				[vim.diagnostic.severity.HINT] = "", -- ヒント
			}
			return string.format(" %s ", icons[diagnostic.severity])
		end,

		-- format = function(diagnostic)
		--   return diagnostic.message
		-- end,             -- フロートに表示される内容のカスタムフォーマッタ
	},

	signs = true, -- サインカラム（行番号の左）にアイコンや記号を表示する

	underline = true, -- エラー箇所を下線で強調表示

	update_in_insert = true, -- インサートモード中も診断を更新して表示（falseにすると入力中は非表示）

	severity_sort = true, -- 表示順を重要度（severity）でソート（Error→Hintの順）

	-- severity = {
	--   min = vim.diagnostic.severity.WARN, -- 最小表示レベル（例：WARN以上のみ表示）
	--   max = vim.diagnostic.severity.ERROR -- 最大表示レベル
	-- },

	-- underline = {
	--   severity = { min = vim.diagnostic.severity.WARN } -- アンダーラインを表示する最小のseverity
	-- },

	-- signs = {
	--   severity = { min = vim.diagnostic.severity.HINT } -- サイン表示する最小のseverity
	-- },

	-- virtual_lines = false, -- 仮想テキストの代わりに「行全体を使って」診断を表示（experimental）

	-- spacing = 4, -- 全体の診断表示に関する間隔（仮想テキストやサインなどのスペース）

	-- display_by_lsp = false, -- LSPから提供される診断のみに絞る（trueにするとpluginからの診断は非表示）
})

-- 入力ソースの保存用変数
local last_input_source = ""

-- 入力ソース取得関数
local function get_current_input_source()
	return vim.fn.system("im-select"):gsub("%s+", "")
end

-- ノーマルモードに入るとき：入力ソースを保存して、ABC でなければ英数に切り替える
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		local current = get_current_input_source()
		last_input_source = current

		-- すでにABCでない場合のみ、ABCに切り替える
		if current ~= "com.apple.keylayout.ABC" then
			vim.fn.system("im-select com.apple.keylayout.ABC")
		end
	end,
})

-- 挿入モードに戻るとき：保存した入力ソースがABCでなければ復元する
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		if last_input_source ~= "" and last_input_source ~= "com.apple.keylayout.ABC" then
			vim.fn.system("im-select " .. last_input_source)
		end
	end,
})

-- Neovim にフォーカスが戻ったとき：現在がABCでない場合のみ切り替える
vim.api.nvim_create_autocmd("FocusGained", {
	pattern = "*",
	callback = function()
		local current = get_current_input_source()
		if current ~= "com.apple.keylayout.ABC" then
			vim.fn.system("im-select com.apple.keylayout.ABC")
		end
	end,
})
