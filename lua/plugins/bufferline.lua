return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		-- options = {
		--   always_show_bufferline = true, -- ← これを追加
		-- },
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					show_buffer_close_icons = false,
					show_close_icon = false,
					separator_style = "slant",
				},
			})
			-- local bufferCount = #vim.fn.getbufinfo({ buflisted = 1 })
			-- if bufferCount == 0 then
			--   -- スタート時にスタートページのタブを作る
			--   vim.cmd("enew")                              -- 新しいバッファを開く
			--   vim.api.nvim_buf_set_name(0, "X10A-FREEDOM") -- バッファ名を「スタートページ」に設定（bufferline などに表示されるラベルになる）
			--   vim.bo.bufhidden = "wipe"                    -- バッファが非表示になったときにメモリから削除（:bd 相当）
			--   vim.bo.swapfile = false                      -- スワップファイル（.swp）を作成しない（一時的なバッファに最適）
			--   vim.bo.buftype = "nofile"                    -- バッファの種類を 'nofile' に設定（実在するファイルに対応しない特殊バッファ）
			--   vim.bo.buflisted = true                      -- buffer list（:ls や bufferline）に表示されるようにする（falseだと表示されない）
			--   vim.bo.readonly = true                       -- 読み取り専用に設定（編集不可。書き込みもできない）
			--
			--   -- ファイルツリーを表示する
			--   vim.defer_fn(function()
			--     require("nvim-tree.api").tree.open()
			--   end, 100) -- 遅延させて dashboard の後に表示
			-- end
			-- if vim.fn.argc() == 0 then
			--   -- スタート時にスタートページのタブを作る
			--   vim.cmd("enew")                              -- 新しいバッファを開く
			--   vim.api.nvim_buf_set_name(0, "X10A-FREEDOM") -- バッファ名を「スタートページ」に設定（bufferline などに表示されるラベルになる）
			--   vim.bo.bufhidden = "wipe"                    -- バッファが非表示になったときにメモリから削除（:bd 相当）
			--   vim.bo.swapfile = false                      -- スワップファイル（.swp）を作成しない（一時的なバッファに最適）
			--   vim.bo.buftype = "nofile"                    -- バッファの種類を 'nofile' に設定（実在するファイルに対応しない特殊バッファ）
			--   vim.bo.buflisted = true                      -- buffer list（:ls や bufferline）に表示されるようにする（falseだと表示されない）
			--   vim.bo.readonly = true                       -- 読み取り専用に設定（編集不可。書き込みもできない）
			--
			--   -- ファイルツリーを表示する
			--   vim.defer_fn(function()
			--     require("nvim-tree.api").tree.open()
			--   end, 0) -- 遅延させて dashboard の後に表示
			-- end
		end,
	},
}
