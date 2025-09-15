local M = {}

--- キーマップを設定するヘルパー関数
---@param mode string|string[]   モード（例: "n", "i", {"n", "v"}）
---@param lhs string         キー（例: "<leader>x"）
---@param rhs string|function    実行する関数
---@param desc string           説明（オプション）
---@param buffer? integer|boolean バッファ番号または true（ローカルマップ）
function M.setKeymap(mode, lhs, rhs, desc, buffer)
  vim.keymap.set(mode, lhs, rhs, {
    noremap = true,
    silent = true,
    desc = desc,
    buffer = buffer,
  })
end

return M
