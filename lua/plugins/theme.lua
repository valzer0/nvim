return {
	{
		"folke/tokyonight.nvim",
		-- opts = {
		--   transparent = false
		-- },
		config = function()
			-- require("tokyonight").setup({ transparent = false })
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{
		"rcarriga/nvim-notify", -- 通知を装飾する
		lazy = false, --  ← 起動時に必ずロード
		priority = 9999, --  ← 数字が大きいほど先に読まれる（デフォルトは 50）
		config = function()
			local notify = require("notify")
			notify.setup({
				level = vim.log.levels.TRACE,
				-- 最大横幅を制限（文字数ベース）
				-- max_width = 72,

				-- その他のおすすめ設定（任意）
				render = "default", -- 表示スタイル
				-- render    = "wrapped-default",   -- ★折り返し対応レンダラ
				stages = "fade_in_slide_out", -- アニメーション
				timeout = 800, -- 表示時間（ms）
			})

			-- Neovim の notify を上書き
			vim.notify = notify
		end,
	},
	{
		"folke/noice.nvim", -- バッファーに装飾
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- hover = {
				--   enabled = true,
				-- },
				-- signature = {
				--   enabled = true,
				-- },
				-- progress = {
				--   enabled = true,
				-- },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- notify = {
			--   enabled = true,
			-- },
			-- messages = {
			--   enabled = true,
			-- },
			-- redirect = false,
			presets = {
				bottom_search = false, -- `:/` の検索を下部に表示
				command_palette = true, -- `:` と `?` をコマンドパレット風に
				long_message_to_split = true, -- 長文メッセージを分割ウィンドウへ
				inc_rename = false,
				lsp_doc_border = true, -- Hover にボーダーを追加
			},
		},
	},
}
