-- SCSS
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Mixin スニペット
  sp("mixin", {
    t("@mixin "), i(1, "name"), t(" {"),
    t({ "", "  " }), i(2, "content"),
    t({ "", "}" }),
  }),

  -- Include スニペット
  sp("inc", {
    t("@include "), i(1, "name"), t(".apply-theme($type);"),
  }),

  -- Media Query スニペット
  sp("mq", {
    t("@media screen and (max-width: "), i(1, "768px"), t(") {"),
    t({ "", "  " }), i(2),
    t({ "", "}" }),
  }),

  sp("fd", {
    t("@if $type == \"sp\" {"), i(1), t("}"),
    t({ "", "@if $type == \"pc\" {}" }),
  }),
  sp("apply", {
    t('@mixin apply-theme($type) {'),
    t({ '', '  ' }), i(0),
    t({ '', '}' })
  }),
}
