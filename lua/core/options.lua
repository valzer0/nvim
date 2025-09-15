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
vim.api.nvim_set_keymap("n", "x", "\"_x", { noremap = true, silent = true })
-- ビジュアルモードで選択範囲削除（クリップボードにコピーしない）
vim.api.nvim_set_keymap("v", "x", "\"_d", { noremap = true, silent = true })



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
