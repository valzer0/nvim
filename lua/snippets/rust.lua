local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node


return {
  sp("log", {
    t('println!("'), i(1, '{:?}'), t('", '), i(2), t(');'),
  }),
  sp("ero", {
    t('|| { '), i(1), t(' }'),
  }),
  sp("aro", {
    t('|v| { '), i(1), t(' }'),
  }),
  sp("sro", {
    t('|&v| { '), i(1), t(' }'),
  }),
  sp("ssro", {
    t('|&&v| { '), i(1), t(' }'),
  }),
}
