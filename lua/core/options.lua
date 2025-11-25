-- マウス操作を全モードで有効にする
vim.opt.mouse = "a"
-- 行の折り返し true: 折り返しあり
vim.opt.wrap = false
-- 行番号を表示する
vim.opt.number = true
-- 現在行以外の行番号を相対表示する
vim.opt.relativenumber = true
-- システムクリップボードと連携する
vim.opt.clipboard = "unnamedplus"
-- タブ入力をスペースに変換する
vim.opt.expandtab = true
-- インデント幅を2に設定する
vim.opt.shiftwidth = 2
-- タブ文字の幅を2に設定する
vim.opt.tabstop = 2
-- 不可視文字を表示する
vim.opt.list = true
-- 不可視文字の表示内容を設定する
vim.opt.listchars:append({
	leadmultispace = "·", -- 行頭のスペースを「·」で表示
	tab = "▸ ", -- タブを「▸ 」で表示
	trail = "·", -- 行末のスペースを「·」で表示
	eol = "↲", -- 行末記号を「↲」で表示
})
-- ファイルが外部で変更されたら自動で再読み込みする
vim.opt.autoread = true
-- vim.opt.spell = true                             -- スペルチェックを有効にする
-- vim.opt.spelllang = { "en" }                     -- スペルチェックの言語を英語に設定する

-- 通常モードで1文字削除（クリップボードにコピーしない）
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
-- ビジュアルモードで選択範囲削除（クリップボードにコピーしない）
vim.api.nvim_set_keymap("v", "x", '"_d', { noremap = true, silent = true })

-- .ixx を C++ として扱う
vim.filetype.add({
	extension = {
		ixx = "cpp",
	},
})

-- （任意）Treesitter にも「ixx は cpp パーサを使う」と教える
pcall(function()
	vim.treesitter.language.register("cpp", "ixx")
end)

-- <tag>の折りたたみを Treesitter に切り替え（共通）
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- 新API
vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true

-- -- a) 罫線や折りたたみマーカーの表示を少し見やすく
-- vim.opt.fillchars = {
-- 	fold = " ", -- 折りたたみ領域の埋め文字
-- 	foldopen = "", -- 開いているとき（Nerd Fonts なければ "v" などに）
-- 	foldclose = "", -- 閉じているとき（なければ ">"）
-- 	foldsep = " ", -- 仕切り
-- }
--
-- -- b) foldtext を Lua 関数で定義
-- local function foldinfo()
-- 	-- v:foldstart, v:foldend は Vimscript 変数なので vim.v から取る
-- 	local fs, fe = vim.v.foldstart, vim.v.foldend
-- 	local first = vim.fn.getline(fs) or ""
-- 	-- 先頭行から空白を詰めて、コメント記号など軽くトリム
-- 	first = first:gsub("^%s*", ""):gsub("%s*{%s*$", ""):gsub("%s*<!--%s*", ""):gsub("%s*-->%s*$", "")
--
-- 	local folded_lines = fe - fs + 1
-- 	-- 幅に合わせてテキストを切る
-- 	local target_width = vim.api.nvim_win_get_width(0) - 10
-- 	if #first > target_width then
-- 		first = first:sub(1, math.max(1, target_width - 1)) .. "…"
-- 	end
--
-- 	-- 例: 「▶ <div class=...>   …   23 lines」
-- 	local icon = "▶" -- Nerd Fonts ありなら "" など
-- 	return string.format("%s %s  …  %d lines", icon, first, folded_lines)
-- end
--
-- _G.MyFoldText = foldinfo
-- vim.opt.foldtext = "v:lua.MyFoldText()"
--
-- -- c) すべて展開/折りたたみを素早く
-- vim.keymap.set("n", "zR", function()
-- 	vim.cmd.foldopen()
-- 	vim.cmd("normal! zR")
-- end, { desc = "Open all folds" })
-- vim.keymap.set("n", "zM", function()
-- 	vim.cmd.foldclose()
-- 	vim.cmd("normal! zM")
-- end, { desc = "Close all folds" })
--
--

-- 監視除外パターン（Neovim 0.10 以降）
vim.opt.wildignore:append({
	"*/node_modules/*",
	"*/vendor/*",
	"*/wp-includes/*",
	"*/wp-admin/*",
	"*/wp-content/*",
	"*.png",
	"*.jpg",
	"*.jpeg",
	"*.gif",
	"*.webp",
})
