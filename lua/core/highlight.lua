-- 全角スペースにハイライトをかける
vim.cmd [[
  highlight ZenkakuSpace cterm=underline ctermfg=red guibg=#ffdddd
  match ZenkakuSpace /　/
]]

