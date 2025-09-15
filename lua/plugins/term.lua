return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 12,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      start_in_insert = true,
      shade_terminals = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
      on_open = function(term)
        -- 非ターミナルの直近のバッファ番号を探す
        local bufnr = vim.api.nvim_get_current_buf()
        local current_dir = nil
        for _, b in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
          if not vim.api.nvim_buf_get_name(b.bufnr):match("^term://") then
            current_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(b.bufnr), ":p:h")
            break
          end
        end

        -- フォールバック（見つからなかった場合）
        if not current_dir then
          current_dir = vim.fn.getcwd()
        end
      end,
    },
    config = function()
      -- 最大4つの横ターミナルを `<C-\>` でトグル
      local Terminal = require("toggleterm.terminal").Terminal
      local terminals = {}
      for i = 1, 4 do
        terminals[i] = Terminal:new({ count = i, direction = "horizontal" })
      end
      local current = 1
      vim.keymap.set(
        { "n", "t" },
        "<C-\\>",
        function()
          terminals[current]:toggle()
          current = (current % 4) + 1
        end,
        { noremap = true, silent = true, desc = "Toggle multi-terminal" }
      )

      -- ターミナルモードからノーマルモードへ
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "ターミナルを抜けてノーマルモードへ" })
    end
  }
}
