-- YAML
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
	sp('basic', {
		t({ '# Basic Setting' }),
		t({ '', '/logs/' }),
		t({ '', '*.env' }),
		t({ '', '# Neovim/Vim swap files' }),
		t({ '', '*.swp' }),
		t({ '', '*.swo' }),
		t({ '', '*.swx' }),
		t({ '', '# Neovim undo/backup files' }),
		t({ '', '*.un~' }),
		t({ '', '*.bak' }),
		t({ '', '*.tmp' }),
		t({ '', '# Mac OS' }),
		t({ '', '.DS_Store' }),
		t({ '', '.AppleDouble' }),
		t({ '', '.LSOverride' }),
		t({ '', '.DocumentRevisions-V100' }),
		t({ '', '.fseventsd' }),
		t({ '', '.Spotlight-V100' }),
		t({ '', '.TemporaryItems' }),
		t({ '', '.Trashes' }),
		t({ '', '.VolumeIcon.icns' }),
		t({ '', '.com.apple.timemachine.donotpresent' }),
		t({ '', '.AppleDB' }),
		t({ '', '.AppleDesktop' }),
		t({ '', 'Network Trash Folder' }),
		t({ '', 'Temporary Items' }),
		t({ '', '.apdisk' }),
	}),
}
