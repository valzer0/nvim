local function vimKeymapSet(mode, command, callback, desc)
  vim.keymap.set(mode, command, callback, { noremap = true, silent = true, desc = desc })
end

-- テキストの折り返しのON/OFF
local function ToggleWrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    print("Wrap OFF")
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    print("Wrap ON")
  end
end

vimKeymapSet("n", "<leader>w", ToggleWrap, "テキストの折り返しON/OFF")

-- 診断メッセージの表示
vimKeymapSet("n", "<leader>d", vim.diagnostic.open_float, "カーソル位置の診断表示")
vimKeymapSet("n", "<leader>ld", "<Cmd>Telescope diagnostics<CR>", "全バッファの診断一覧 (Telescope)")

-- 型の定義ジャンプ
-- vimKeymapSet("n", "gd", vim.lsp.buf.definition, '定義へジャンプ')

-- ファイラー表示（nvim-tree）
-- vimKeymapSet("n", "<C-n>", ":NvimTreeToggle<CR>", "ファイラーの表示/非表示")

-- Telescope（ファイル検索など）
vimKeymapSet("n", "<leader>ff", "<Cmd>Telescope find_files<cr>", "ファイルを検索 (Telescope)")
vimKeymapSet("n", "<leader>fg", "<Cmd>Telescope live_grep<cr>", "文字列を検索 (Telescope)")

-- バッファ移動
vimKeymapSet("n", "L", "<cmd>BufferLineCycleNext<CR>", "次のバッファへ移動")
vimKeymapSet("n", "H", "<cmd>BufferLineCyclePrev<CR>", "前のバッファへ移動")

-- ターミナルモードからノーマルモードへ
-- vimKeymapSet("t", "<Esc>", [[<C-\><C-n>]], "ターミナルを抜けてノーマルモードへ")

-- ウィンドウ移動
vimKeymapSet("n", "<C-h>", "<C-w>h", "左のウィンドウへ移動")
vimKeymapSet("n", "<C-j>", "<C-w>j", "下のウィンドウへ移動")
vimKeymapSet("n", "<C-k>", "<C-w>k", "上のウィンドウへ移動")
vimKeymapSet("n", "<C-l>", "<C-w>l", "右のウィンドウへ移動")

-- 実装箇所へジャンプ
-- vimKeymapSet("n", "go", vim.lsp.buf.implementation, "実装箇所へジャンプ")

-- 保存ショートカット
vimKeymapSet("n", "<leader>s", "<Cmd>w<CR>", "ファイル保存")
