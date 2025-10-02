return {
	{
		-- "mason-org/mason.nvim",
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- "mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"intelephense", -- PHP
					"cssls", -- Sass/Scss
					"clangd", -- C++
					"yamlls", -- YAML
					"gopls", -- Golang
					"rust_analyzer", -- Rust
					"nginx_language_server", -- Nginx
				}, -- 自動インストール対象
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			------------------------------------------------------------------
			-- 共通設定
			------------------------------------------------------------------
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities(
			--   vim.lsp.protocol.make_client_capabilities()
			-- )
			-- 補完プラグイン（nvim-cmp 等）と連携するための capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities.textDocument.completion.completionItem.snippetSupport = true

			local function on_attach(client, bufnr)
				-- LSP のフォーマット機能を無効化（null-ls や conform.nvim と競合しないように）
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				local map = function(lhs, rhs)
					vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
				end
				map("gd", vim.lsp.buf.definition)
				map("gr", vim.lsp.buf.references)
				map("K", vim.lsp.buf.hover)
				map("<leader>rn", vim.lsp.buf.rename)
				map("<leader>ca", vim.lsp.buf.code_action)
			end

			------------------------------------------------------------------
			-- TypeScript / JavaScript
			------------------------------------------------------------------
			-- TypeScript LSP 用の on_attach 関数
			local ts_on_attach = function(client, bufnr)
				-- LSP のフォーマット機能を無効化（null-ls や conform.nvim と競合しないように）
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				-- バッファローカルで有効な LSP 操作用キーマップ
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local m = require("core.my-modules")
				-- local map = vim.keymap.set
				-- map("n", "gd", vim.lsp.buf.definition, opts)          -- 定義ジャンプ
				-- map("n", "gr", vim.lsp.buf.references, opts)          -- 参照を表示
				-- map("n", "K", vim.lsp.buf.hover, opts)                -- 型や説明をホバー表示
				-- map("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- 変数名のリネーム
				-- map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- コードアクション実行（例: import 修正）
				m.setKeymap("n", "gr", vim.lsp.buf.references, "参照を表示", bufnr)
				m.setKeymap("n", "K", vim.lsp.buf.hover, "型や説明をホバー表示", bufnr)
				m.setKeymap("n", "<leader>rn", vim.lsp.buf.rename, "変数名のリネーム", bufnr)
				m.setKeymap(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					"コードアクション実行（例: import 修正）",
					bufnr
				) --

				local smart_gd = require("core.smart_gd")
				-- 既存の gd を置き換え（好みで別キーでもOK）
				m.setKeymap("n", "gd", smart_gd.goto_definition_smart, "定義ジャンプ", bufnr)
				-- vim.keymap.set("n", "gd", smart_gd.goto_definition_smart,
				--   { desc = "LSP: Smart go to definition", noremap = true, silent = true, buffer = bufnr })
			end

			-- inlayHints の共通設定（引数・型の自動表示）
			local inlay_hint_options = {
				includeInlayParameterNameHints = "all", -- 全ての引数名を表示
				includeInlayParameterNameHintsWhenArgumentMatchesName = false, -- 引数と変数名が一致しても表示
				includeInlayFunctionParameterTypeHints = true, -- 関数の引数の型を表示
				includeInlayVariableTypeHints = true, -- 変数の型を表示
				includeInlayPropertyDeclarationTypeHints = true, -- プロパティ宣言の型を表示
				includeInlayFunctionLikeReturnTypeHints = true, -- 関数やアロー関数の戻り値の型を表示
				includeInlayEnumMemberValueHints = true, -- enum 値のヒントを表示
			}

			-- TypeScript/JavaScript LSP の設定
			lspconfig.ts_ls.setup({
				on_attach = ts_on_attach, -- LSP 接続時に呼ばれる関数
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = inlay_hint_options, -- TypeScript 用の inlay hint 設定
					},
					javascript = {
						inlayHints = inlay_hint_options, -- JavaScript 用の inlay hint 設定
					},
				},
			})
			------------------------------------------------------------------
			-- Lua (Neovim 開発用)
			------------------------------------------------------------------
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" }, -- Neovim は LuaJIT 上で動いている
						diagnostics = { globals = { "vim" } }, -- vim グローバル変数を未定義扱いにしない
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Neovim ランタイム API を補完対象に含める
							checkThirdParty = false, -- サードパーティの警告を無効化（余計な通知を減らす）
						},
						telemetry = { enable = false }, -- LuaLS の利用統計を送信しない（プライバシー対策）
					},
				},
			})

			-- Lua LSP の設定（Neovim 自身の Lua 開発用）
			lspconfig.lua_ls.setup({
				on_attach = on_attach, -- LSP 接続時に呼ばれる関数（Lua用）
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT", -- Neovim は LuaJIT 上で動いている
							path = vim.split(package.path, ";"), -- Lua のモジュール検索パスを指定
						},
						diagnostics = {
							globals = { "vim" }, -- vim グローバル変数を未定義扱いにしない
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Neovim ランタイム API を補完対象に含める
							checkThirdParty = false, -- サードパーティの警告を無効化（余計な通知を減らす）
						},
						telemetry = {
							enable = false, -- LuaLS の利用統計を送信しない（プライバシー対策）
						},
					},
				},
			})
			------------------------------------------------------------------
			-- Pyright
			------------------------------------------------------------------
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			------------------------------------------------------------------
			-- CSS
			------------------------------------------------------------------
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			------------------------------------------------------------------
			-- PHP (Intelephense)
			------------------------------------------------------------------
			-- Intelephense を有効化
			lspconfig.intelephense.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					intelephense = {
						files = { maxSize = 5 * 1024 * 1024 }, -- 大規模プロジェクト用に上限を 5MB に
					},
					environment = {
						includePaths = {
							-- vendor ディレクトリを動的に解決
							vim.fn.getcwd() .. "/vendor/php-stubs/wordpress-stubs",
							vim.fn.getcwd() .. "/custom-stubs",
							vim.fn.getcwd() .. "/lib",
						},
					},
				},
			})

			-- C++ (clangd)
			-- nvim-cmpを使用している場合
			lspconfig.clangd.setup({
				-- cmd = { "clangd" }, -- mason がインストールしてくれる
				cmd = {
					"clangd",
					"--background-index", -- バックグラウンドでプロジェクト全体のインデックスを作成
					"--clang-tidy", -- clang-tidyの警告を有効化
					"--completion-style=detailed", -- 補完候補をより詳細にする
					-- "--header-insertion=iwyu",     -- #includeの自動挿入をIWYU(Include What You Use)ベースにする
					-- "--function-arg-placeholders", -- 関数の引数にプレースホルダーを挿入
				},
				-- cmd = { "clangd", "--completion-style=detailed" },
				-- cmd = {
				--   "clangd",
				--   "--background-index",
				--   "--clang-tidy",
				--   -- ルート直下に compile_commands.json がない場合のみ指定
				--   -- "--compile-commands-dir=build",
				--   -- Apple のコンパイラを使うなら query-driver を合わせる
				--   "--query-driver=/usr/bin/clang++",
				-- },
				-- clangdが認識するファイルタイプ
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				-- nvim-cmpなどの補完プラグインと連携
				-- capabilities = clang_capabilities,

				on_attach = function(_, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					-- 定義へジャンプ
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

					-- ホバーで情報を表示
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					-- 実装へジャンプ
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

					-- リファレンスを表示
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

					-- シグネチャヘルプを表示
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

					-- リネーム
					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

					-- コードアクション
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- 診断情報（エラーや警告）へ移動
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})

			-- YAML
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemas = {
							-- docker-compose 用スキーマ
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
						},
						-- validate = true,
						-- hover = true,
						-- completion = true,
					},
				},
			})

			-- Golang
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})
			-- Nginx
			lspconfig.nginx_language_server.setup({
				capabilities = capabilities,
				filetypes = { "nginx" },
			})
			-- capabilities を LSP に渡す
			local util = require("lspconfig.util")

			lspconfig.nginx_language_server.setup({
				capabilities = capabilities, -- ★これ重要
				filetypes = { "nginx" },
				root_dir = util.root_pattern(".git", "nginx.conf") or vim.fs.dirname,
			})

			-- Rust
			-- lspconfig.rust_analyzer.setup({
			-- 	settings = {
			-- 		["rust-analyzer"] = {
			-- 			cargo = { allFeatures = true },
			-- 			checkOnSave = { command = "clippy" },
			-- 		},
			-- 	},
			-- })

			-- lspconfig.sqls.setup({
			--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
			--   settings = {
			--     sqls = {
			--       connections = {
			--         {
			--           driver = "mysql",
			--           dataSourceName = "admin:pass@tcp(127.0.0.1:3306)/sample?tls=skip-verify",
			--         },
			--         -- {
			--         --   driver = "postgresql",
			--         --   dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=secret dbname=mydb sslmode=disable",
			--         -- },
			--       }
			--     }
			--   }
			-- })
		end,
	},
}
