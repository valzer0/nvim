-- PHP
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep



return {
	sp("rewrite", {
		t({ 'rewrite ^' }), i(0),
	}),
	sp("break", {
		t({ 'break;' }),
	}),
	sp("last", {
		t({ 'last;' }),
	}),
	sp("permanent", {
		t({ 'permanent;' }),
	}),
	sp("redirect", {
		t({ 'redirect;' }),
	}),
	sp("try_files", {
		t({ 'try_files ' }), i(0),
	}),
	sp("root", {
		t({ 'root /var/www/' }), i(0),
	}),
	sp("brotli", {
		t({ 'brotli ' }), i(0),
	}),
	sp("include", {
		t({ 'include /etc/nginx/' }), i(0),
	}),
	sp("location", {
		t({ 'location ' }), i(0),
	}),
	sp("server", {
		t({ 'server ' }), i(0),
	}),
	sp("upstream", {
		t({ 'upstream ' }), i(0),
	}),
	sp("host", {
		t({ '$host' }), i(0),
	}),
	sp("request_uri", {
		t({ '$request_uri' }), i(0),
	}),
	sp("add_header", {
		t({ 'add_header' }), i(0),
	}),
}

