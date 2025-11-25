--[[
===========================================================================
📘 Neovim autocmd イベント一覧（よく使われる & 覚えておくと便利なもの）
===========================================================================
🔹 基本（ファイル・バッファ操作）
---------------------------------------------------------------------------
BufNewFile     : 新しいファイルを開いたとき（まだ存在しないファイル）
BufReadPre     : ファイルを読み込む直前
BufReadPost    : ファイルを読み込んだ直後
BufWritePre    : バッファを書き込む直前（保存直前にフック）
BufWritePost   : 書き込み完了直後（保存後の処理に便利）
BufEnter       : バッファに入ったとき（アクティブになった瞬間）
BufLeave       : バッファを離れる直前
BufUnload      : バッファをアンロードする直前（:bdeleteなど）
BufDelete      : バッファを削除するとき
BufWinEnter    : バッファがウィンドウに表示されたとき
BufWinLeave    : バッファがウィンドウから外れたとき
FileType       : 'filetype' が設定されたとき（例：vim.bo.filetype = "lua"）
Syntax          : シンタックスハイライトが設定されたとき

🔹 編集・入力関連
---------------------------------------------------------------------------
InsertEnter    : 挿入モードに入ったとき
InsertLeave    : 挿入モードを抜けたとき
TextChanged    : テキストが変更されたとき（ノーマルモード）
TextChangedI   : 挿入モードでテキストが変更されたとき
TextYankPost   : テキストをヤンク（コピー）した直後（ハイライトなどに便利）
CmdlineEnter   : コマンドラインモードに入ったとき（:開始）
CmdlineLeave   : コマンドラインモードを抜けたとき

🔹 ウィンドウ・タブ・UI関連
---------------------------------------------------------------------------
WinEnter       : ウィンドウに入ったとき
WinLeave       : ウィンドウを離れる直前
WinNew         : 新しいウィンドウが作成されたとき
TabEnter       : タブページに入ったとき
TabLeave       : タブページを離れたとき
FocusGained    : Neovimウィンドウがフォーカスを得たとき（他アプリから戻る）
FocusLost      : Neovimウィンドウがフォーカスを失ったとき（他アプリに移動）
CursorHold     : 一定時間カーソルを動かさなかったとき（updatetimeで調整）
CursorMoved    : カーソルが動いたとき
CursorMovedI   : 挿入モードでカーソルが動いたとき

🔹 起動・終了関連
---------------------------------------------------------------------------
VimEnter       : Neovimの起動完了直後（プラグイン初期化など）
VimLeavePre    : 終了直前（保存処理やクリーンアップなどに便利）
VimLeave       : 終了処理の最後に呼ばれる
UIEnter        : UIアタッチ後（NeovimのUI層が起動完了した時）
UILeave        : UIがデタッチされたとき

🔹 ファイル検知・自動リロード関連
---------------------------------------------------------------------------
FocusGained    : フォーカスが戻ったとき（他アプリから戻った瞬間）
BufEnter       : バッファを開いたとき
→ 組み合わせ例: 自動で外部変更をチェック
   vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
     command = "checktime"
   })

🔹 その他・特殊イベント
---------------------------------------------------------------------------
ColorScheme    : カラースキームが変更されたとき
DirChanged     : カレントディレクトリが変わったとき（:cd など）
OptionSet      : オプション値が変更されたとき
DiagnosticChanged : LSPの診断結果が変化したとき
LspAttach      : LSPクライアントがバッファにアタッチされたとき
LspDetach      : LSPクライアントがバッファからデタッチされたとき
TermOpen       : ターミナルバッファが開かれたとき
TermClose      : ターミナルバッファが閉じられたとき
RecordingEnter : マクロ記録が開始されたとき
RecordingLeave : マクロ記録が終了したとき

===========================================================================
💡 ヒント:
 :help autocmd-events
 :help nvim_create_autocmd
 で全イベントの完全リストと詳細説明を確認できます。
===========================================================================
--]]

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

-- -- 3) HTML/JSX/PHP/テンプレ系での自動適用（他の filetype も足せる）
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = {
-- 		"html",
-- 		"xml",
-- 		"javascript",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"tsx",
-- 		"vue",
-- 		"svelte",
-- 		"php",
-- 		"twig",
-- 		"astro",
-- 	},
-- 	callback = function()
-- 		vim.opt_local.foldmethod = "expr"
-- 		vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
-- 		vim.opt_local.foldlevel = 99 -- 初期表示は展開
-- 		vim.opt_local.foldlevelstart = 99
-- 		vim.opt_local.foldenable = true
-- 	end,
-- })
-- 超巨大ファイルで重いときのフォールバック
-- vim.api.nvim_create_autocmd("BufReadPre", {
-- 	pattern = { "*.min.*", "*.prod.*" },
-- 	callback = function(args)
-- 		if vim.fn.getfsize(args.file) > 800 * 1024 then -- 800KB以上なら簡易化
-- 			vim.opt.foldmethod = "syntax" -- あるいは "manual"
-- 			vim.opt.foldexpr = nil -- 新API
-- 		end
-- 	end,
-- })

-- 親ディレクトリを辿って "nginx.d" があれば nginx filetype にする
-- autocmd（自動コマンド）を登録
-- 対象イベント: ファイルを開いたとき (BufRead) または新規作成したとき (BufNewFile)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	-- パターン: 拡張子が .conf のファイルに限定
	-- pattern = "*.conf",
	pattern = { "*.conf", "*.conf.template" },

	-- コールバック関数: 条件に応じて filetype を設定する
	callback = function(args)
		local path = vim.fn.expand(args.file)
		local dirPath = vim.fn.fnamemodify(path, ":h")
		local targets = { "nginx.inc.d", "nginx.template.d", "nginx.dist" }
		local parts = vim.split(dirPath, "/")
		local has_nginxd = false
		for _, value in ipairs(targets) do
			if vim.tbl_contains(parts, value) then
				has_nginxd = true
				break
			end
		end

		if args.file:match("%.template$") then
			has_nginxd = true
		end

		if has_nginxd then
			vim.bo.filetype = "nginx"
			vim.opt_local.expandtab = true -- タブをスペースに変換
			vim.opt_local.shiftwidth = 4 -- 自動インデントの幅
			vim.opt_local.tabstop = 4 -- タブキーの幅
			vim.opt_local.softtabstop = 4 -- バックスペースなどの幅も4に
		end
	end,
})

-- *.shの場合は、bashファイルとして認識させる（LSP対策）
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	-- パターン: 拡張子が .conf のファイルに限定
	pattern = { "*.sh", ".zshrc" },

	-- コールバック関数: 条件に応じて filetype を設定する
	callback = function(args)
		vim.bo.filetype = "bash"
		vim.opt_local.expandtab = true -- タブをスペースに変換
		vim.opt_local.shiftwidth = 4 -- 自動インデントの幅
		vim.opt_local.tabstop = 4 -- タブキーの幅
		vim.opt_local.softtabstop = 4 -- バックスペースなどの幅も4に
	end,
})

-- *.envの場合は、envファイルとして認識させる（LSP対策）
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	-- パターン: 拡張子が .env のファイルに限定
	pattern = "*.env",

	-- コールバック関数: 条件に応じて filetype を設定する
	callback = function(args)
		vim.bo.filetype = "env"
	end,
})
