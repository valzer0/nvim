-- -- 全角スペースにハイライトをかける
-- vim.cmd [[
--   highlight ZenkakuSpace cterm=underline ctermfg=red guibg=#ffdddd
--   match ZenkakuSpace /　/
-- ]]

-- listcharsの基本設定
vim.opt.list = true
-- vim.opt.listchars = { tab = "»·", trail = "·", space = "·" }
vim.opt.listchars = {
	tab = "▸ ", -- タブの見た目
	trail = "·", -- 行末スペース
	extends = "⟩",
	precedes = "⟨",
	space = "·", -- 半角スペースも点で表示
}

-- 全角スペースを視覚的に強調
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufReadPost" }, {
	callback = function()
		vim.fn.matchadd("ZenkakuSpace", "　")
	end,
})

-- ハイライト定義
vim.api.nvim_set_hl(0, "ZenkakuSpace", { bg = "#553333" })
