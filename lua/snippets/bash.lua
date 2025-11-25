-- BASH
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
	sp('logdebug', {
		t({ 'printf "\\033[0;34m[DEBUG] %s\\033[0m\\n" "' }), i(1), t({ '"'})
	}),
	sp('loginfo', {
		t({ 'printf "\\033[0;32m[INFO] %s\\033[0m\\n" "' }), i(1), t({ '"'})
	}),
	sp('logwarn', {
		t({ 'printf "\\033[0;33m[WARN] %s\\033[0m\\n" "' }), i(1), t({ '"'})
	}),
	sp('logerror', {
		t({ 'printf "\\033[0;31m[ERROR] %s\\033[0m\\n" "' }), i(1), t({ '"'})
	}),
	sp('logbasic', {
		t({ 'printf "%s\\n" "' }), i(1), t({ '"'})
	}),
}

