-- ~/.config/nvim/lua/utils/log.lua
local M = {}
local logfile = vim.fn.stdpath("cache") .. "/nvim.log"

function M.write(msg, level)
	local f = io.open(logfile, "a")
	if f then
		f:write(string.format("[%s] [%s] %s\n", os.date("%Y-%m-%d %H:%M:%S"), level or "INFO", msg))
		f:close()
	end
end

function M.info(msg)
	vim.notify(msg, vim.log.levels.INFO)
	M.write(msg, "INFO")
end

function M.error(msg)
	vim.notify(msg, vim.log.levels.ERROR)
	M.write(msg, "ERROR")
end

return M
