-- lua/plugins/minimap.lua
return {
	{
		"echasnovski/mini.map",
		version = false,
		event = "VeryLazy",
		config = function()
			local map = require("mini.map")
			map.setup({
				-- ▼表示まわり
				symbols = {
					-- ✅ 幅 1 の点字エンコード（4x2 解像度）
					encode = map.gen_encode_symbols.dot("4x2"), -- または "3x2"
					scroll_line = "│",
					scroll_view = "█",
				},
				window = {
					side = "right", -- ミニマップを画面の右側に固定表示（"left" にすると左側）
					width = 10, -- ミニマップの横幅を 14 文字に設定
					winblend = 20, -- 透過率 20%（0 = 不透明 / 100 = 透明）
				},
				-- ▼ハイライト統合：必要に応じて追加／削除
				integrations = {
					map.gen_integration.builtin_search(), -- `/` 検索結果
					map.gen_integration.diagnostic(), -- LSP 診断
					map.gen_integration.gitsigns(), -- git diff (gitsigns.nvim 必須)
				},
			})
			-- ▼キー割り当て（お好みで変更）
			vim.keymap.set("n", "<leader>mm", map.toggle, { desc = "Minimap ON/OFF" })
			vim.keymap.set("n", "<leader>ms", map.toggle_side, { desc = "Minimap 左右切替" })
			vim.keymap.set("n", "<leader>mf", map.toggle_focus, { desc = "Minimap フォーカス" })
		end,
	},
}
