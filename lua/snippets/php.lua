-- PHP
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep



return {
	sp("fd", {
		t({ "<?php " }),
		t({ "", "  " }),
		i(0),
		t({ "", "?>" }),
	}),
	-- HTMLタグ
	sp("tag", {
		t("<"),
		i(1, "div"),
		t(' class="'),
		i(2),
		t('">'),
		i(3),
		t("</"),
		rep(1),
		t(">"),
	}),
	sp("tagd", {
		t('<div class="'),
		i(1),
		t('">'),
		i(0),
		t("</div>"),
	}),
	sp("tagi", {
		t('<i class="'),
		i(1),
		t('">'),
		i(0),
		t("</i>"),
	}),
	sp("tags", {
		t('<span class="'),
		i(1),
		t('">'),
		i(0),
		t("</span>"),
	}),
	sp("tagu", {
		t('<div class="'),
		i(1),
		t('"><ul>'),
		i(0),
		t("</ul></div>"),
	}),
	sp("tago", {
		t('<div class="'),
		i(1),
		t('"><ol>'),
		i(0),
		t("</ol></div>"),
	}),
	sp("tagl", {
		t("<li key={"),
		i(1),
		t("}>"),
		i(0),
		t("</li>"),
	}),
	sp("tagc", {
		t('<section class="'),
		i(1),
		t('">'),
		i(0),
		t("</section>"),
	}),
	sp("tagh2", {
		t('<h2 class="'),
		i(1),
		t('">'),
		i(0),
		t("</h2>"),
	}),
	sp("tagh3", {
		t('<h3 class="'),
		i(1),
		t('">'),
		i(0),
		t("</h3>"),
	}),
	sp("tagh4", {
		t('<h4 class="'),
		i(1),
		t('">'),
		i(0),
		t("</h4>"),
	}),
	sp("tagh5", {
		t('<h5 class="'),
		i(1),
		t('">'),
		i(0),
		t("</h5>"),
	}),
	sp("tagh6", {
		t('<h6 class="'),
		i(1),
		t('">'),
		i(0),
		t("</h6>"),
	}),
	sp("taga", {
		t("<a href="),
		i(1),
		t(">"),
		i(0),
		t("</a>"),
	}),
}
