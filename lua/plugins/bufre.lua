-- lua/plugins/bufremove.lua
return {
	{
		"echasnovski/mini.bufremove",
		version = "*", -- mini.nvim と同じく最新版
		opts = {},
		config = function()
			local bufremove = require("mini.bufremove")

			----------------------------------------------------------------------
			-- ① ローカル関数 ─ 強制バッファ削除
			----------------------------------------------------------------------
			local function buf_force_delete()
				-- 第 1 引数 0  -> 現在バッファ
				-- 第 2 引数 true -> 強制 (未保存でも閉じる)
				bufremove.delete(0, true)
			end

			----------------------------------------------------------------------
			-- ② キーマッピング
			----------------------------------------------------------------------
			local map = vim.keymap.set
			-- 保存済みなら閉じる（履歴保持）
			map("n", "<leader>bd", bufremove.delete, { desc = "バッファ削除 (保存済のみ)" })
			-- 未保存でも問答無用で閉じる（履歴保持）
			map("n", "<leader>bD", buf_force_delete, { desc = "バッファ削除 (強制)" })
			-- 完全に痕跡を消す
			map("n", "<leader>bw", bufremove.wipeout, { desc = "バッファ消去 (履歴ごと)" })

			----------------------------------------------------------------------
			-- ③ ユーザーコマンド :Bd / :Bd!
			----------------------------------------------------------------------
			vim.api.nvim_create_user_command("Bd", function(args)
				if args.bang then -- :Bd! なら強制削除
					buf_force_delete()
				else
					bufremove.delete()
				end
			end, {
				bang = true,
				desc = "mini.bufremove delete",
			})

			------------------------------------------------------------------
			-- すべての “保存済み” バッファを一括処理
			------------------------------------------------------------------
			---@param fn function
			---@param current_buf_delete boolean
			local function foreach_saved_buffer(fn, current_buf_delete)
				local current_buf = vim.api.nvim_get_current_buf() -- ★ 現在のバッファ番号を取得
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if
						vim.bo[buf].buflisted -- :ls に載る普通のバッファ
						and not vim.bo[buf].modified -- 変更フラグなし = 保存済み
						and vim.api.nvim_buf_is_loaded(buf)
					then
						if current_buf ~= buf then
							fn(buf)
						else
							if current_buf_delete then
								fn(buf)
							end
						end
					end
				end
			end

			local function wipeout_all_saved()
				foreach_saved_buffer(function(buf)
					bufremove.wipeout(buf)
				end, false)
			end

			local function delete_all_saved()
				-- foreach_saved_buffer(function(buf) bufremove.delete(buf) end, false)
				foreach_saved_buffer(function(buf)
					bufremove.wipeout(buf)
				end, true)
			end

			map(
				"n",
				"<leader>ba",
				wipeout_all_saved,
				{ desc = "保存済みバッファをすべて消去（現在以外）" }
			)
			map(
				"n",
				"<leader>bA",
				delete_all_saved,
				{ desc = "保存済みバッファをすべて消去（すべて）" }
			)
		end,
	},
}
