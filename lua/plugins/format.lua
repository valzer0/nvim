-- lua/plugins/format.lua
return {
	-- バイナリ管理
	{
		"williamboman/mason.nvim",
		opts = { ui = { border = "rounded" } },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"clang-format", -- C/C++ 用
				"prettierd", -- Prettier のデーモン版（高速）
				"prettier", -- fallback 用
				"stylua", -- ★ Lua フォーマッタ
				"taplo", -- TOML
			},
			auto_update = false,
			run_on_start = true,
		},
	},

	-- 保存時フォーマット
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local util = require("conform.util")
			return {
				-- 拡張子ごとに使うフォーマッタ
				formatters_by_ft = {
					c = { "clang_format" },
					cpp = { "clang_format" },
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					javascriptreact = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					vue = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					jsonc = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					scss = { "prettierd", "prettier" },
					less = { "prettierd", "prettier" },
					html = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
					yaml = { "prettierd", "prettier" },
					rust = { "rustfmt" },
					-- （任意）TOML も整えるなら:
					toml = { "taplo" },
					lua = { "stylua" },
				},

				-- 保存時に自動整形
				format_on_save = function(bufnr)
					-- 超巨大ファイル等はスキップしたい場合の例
					local max = 200 * 1024 -- 200 KB

					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
					if ok and stats and stats.size > max then
						return nil
					end
					local filepath = vim.api.nvim_buf_get_name(bufnr)

					-- 除外したいディレクトリパス（絶対パスまたは部分一致）
					if string.match(filepath, "/nvim/lua/snippets/") then
						return false -- フォーマット無効
					end
					return { timeout_ms = 2000, lsp_fallback = true }
				end,

				-- 任意: .prettierignore / .prettierrc, .clang-format をプロジェクトルートから自動検出
				notify_on_error = true,
				-- prettierd がなければ自動で prettier 実行ディレクトリをプロジェクトルートに
				formatters = {
					prettierd = {
						cwd = util.root_file({
							".prettierrc",
							".prettierrc.json",
							".prettierrc.js",
							".prettierrc.cjs",
							".prettierrc.yaml",
							".prettierrc.yml",
							"prettier.config.js",
							"prettier.config.cjs",
							".prettierignore",
							"package.json",
						}),
					},
					clang_format = {
						-- ルート探索（.clang-format があればそれを使用）
						cwd = util.root_file({ ".clang-format", ".clang-format.yaml", ".clang-format.yml" }),
					},
				},
			}
		end,
		config = function(_, opts)
			require("conform").setup(opts)
			-- 手動整形用キー: <leader>f
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({ async = true, lsp_fallback = true })
			end, { desc = "Format file/range" })
		end,
	},
}
