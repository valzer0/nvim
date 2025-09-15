-- Typescript
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- console.log
  s("clog", {
    t("console.log("), i(1, "message"), t(");"),
  }),

  -- for loop (classic)
  s("forl", {
    t({ "for (let " }), i(1, "i"), t(" = 0; "), i(2, "i < array.length"), t("; "), i(3, "i++"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- for...in loop
  s("forin", {
    t({ "for (const " }), i(1, "key"), t(" in "), i(2, "object"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- for...of loop
  s("forof", {
    t({ "for (const " }), i(1, "item"), t(" of "), i(2, "array"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- while loop
  s("while", {
    t({ "while (" }), i(1, "condition"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- switch statement
  s("switch", {
    t({ "switch (" }), i(1, "value"), t({ ") {", "\tcase " }), i(2, "caseValue"), t({ ":", "\t\t" }),
    i(3, "// code"),
    t({ "", "\t\tbreak;", "", "\tdefault:", "\t\t" }),
    i(0, "// default code"),
    t({ "", "\t\tbreak;", "}" }),
  }),

  -- アロー関数
  s('ar', {
    t("("), i(1, ''), t(") => "), i(0),
  }),

  -- const
  s('cs', {
    t("const ")
  })
}
