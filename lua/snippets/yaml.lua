-- YAML
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
	sp('logging', {
		t({ 'logging:' }),
		t({ '', '  driver: local' }),
		t({ '', '  options:' }),
		t({ '', '    max-size: "10m"' }),
		t({ '', '    max-file: "3"' }),
	}),
}
