-- Typescriptreact
local ls = require("luasnip")
local sp = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
  -- console.log
  sp("clog", {
    t("console.log("), i(1, "message"), t(");"),
  }),

  -- for loop (classic)
  sp("forl", {
    t({ "for (let " }), i(1, "i"), t(" = 0; "), i(2, "i < array.length"), t("; "), i(3, "i++"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- for...in loop
  sp("forin", {
    t({ "for (const " }), i(1, "key"), t(" in "), i(2, "object"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- for...of loop
  sp("forof", {
    t({ "for (const " }), i(1, "item"), t(" of "), i(2, "array"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- while loop
  sp("while", {
    t({ "while (" }), i(1, "condition"), t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- switch statement
  sp("switch", {
    t({ "switch (" }), i(1, "value"), t({ ") {", "\tcase " }), i(2, "caseValue"), t({ ":", "\t\t" }),
    i(3, "// code"),
    t({ "", "\t\tbreak;", "", "\tdefault:", "\t\t" }),
    i(0, "// default code"),
    t({ "", "\t\tbreak;", "}" }),
  }),

  -- アロー関数
  sp('ar', {
    t("("), i(1, ''), t(") => "), i(0),
  }),

  -- const
  sp('cs', {
    t("const ")
  }),

  sp("settimeout", {
    t('setTimeout(() => '), i(1), t(', 1000)')
  }),

  -- React
  sp('kara', {
    t("<>"), i(0), t("</>")
  }),
  sp('fragment', {
    t("<React.Fragment key={"), i(1), t("}>"), i(0), t("</React.Fragment>")
  }),
  sp("fd", {
    t("{"), i(0), t("}")
  }),
  sp("setreact", {
    t('import React from "react";')
  }),
  sp("reactreducer", {
    t('const [state, dispatch] = React.useReducer(reducer, {'), i(0), t('}, init);')
  }),
  sp('setreducer', {
    t("type State = {"),
    t({ "", "  status: 'initialize' | 'enter' | 'active' | 'exit';" }),
    t({ "", "};" }),
    t({ "", "type Actions = Action;" }),
    t({ "", "" }),
    t({ "", "const init = (state: State) => {" }),
    t({ "", "  return { ...state };" }),
    t({ "", "};" }),
    t({ "", "const reducer = (state: State, action: Actions) => {" }),
    t({ "", "  switch (action.type) {" }),
    t({ "", "    case : {" }),
    t({ "", "      break;" }),
    t({ "", "    }" }),
    t({ "", "    case : {" }),
    t({ "", "      break;" }),
    t({ "", "    }" }),
    t({ "", "    default:" }),
    t({ "", "      const _: never = action;" }),
    t({ "", "      throw _;" }),
    t({ "", "  }" }),
    t({ "", "  return init(state);" }),
    t({ "", "};" }),
  }),
  sp("setuseeffect", {
    t("React.useEffect(() => {"),
    t({ "", "  let id: NodeJS.Timeout;", }),
    t({ "", "  switch (", }), i(1), t(") {"),
    t({ "", "    case : {" }),
    t({ "", "      break;" }),
    t({ "", "    }" }),
    t({ "", "    case : {" }),
    t({ "", "      break;" }),
    t({ "", "    }" }),
    t({ "", "    case : {" }),
    t({ "", "      break;" }),
    t({ "", "    }" }),
    t({ "", "    case : {" }),
    t({ "", "      break;" }),
    t({ "", "    }" }),
    t({ "", "    default:" }),
    t({ "", "      const _: never = " }), i(1), t(""),
    t({ "", "      throw _" }),
    t({ "", "  }" }),
    t({ "", "  return () => id && clearTimeout(id);" }),
    t({ "", "}, [" }), i(1), t("]);")
  }),
  sp("setusestate", {
    t('const ['), i(3), t('] = React.useState<'), i(1), t('>('), i(2), t(');'),
  }),
  sp("usereducer", {
    t('const [state, dispatch] = React.useReducer(reducer, {'), i(1), t('}, init);'),
  }),
  sp("reactfc", {
    t('React.FC<'), i(1), t('> = (p) => {'),
    t({ '', '  return ' }), i(2),
    t({ '', '}' })
  }),
  sp("oncase", {
    t("case "), i(1), t(": {"),
    t({ '', '  ' }),
    t({ '', '  break;' }),
    t({ '', '}' })
  }),
  -- HTMLタグ
  sp("tag", {
    t('<'), i(1, 'div'), t(' className="'), i(2), t('">'), i(3), t('</'), rep(1), t('>')
  }),
  sp("tagd", {
    t('<div className="'), i(1), t('">'), i(0), t('</div>')
  }),
  sp("tagi", {
    t('<i className="'), i(1), t('">'), i(0), t('</i>')
  }),
  sp("tags", {
    t('<span className="'), i(1), t('">'), i(0), t('</span>')
  }),
  sp("tagu", {
    t('<div className="'), i(1), t('"><ul>'), i(0), t('</ul></div>')
  }),
  sp("tago", {
    t('<div className="'), i(1), t('"><ol>'), i(0), t('</ol></div>')
  }),
  sp("tagl", {
    t('<li key={'), i(1), t('}>'), i(0), t('</li>')
  }),
  sp("tagc", {
    t('<section className="'), i(1), t('">'), i(0), t('</section>')
  }),
  sp("tagh2", {
    t('<h2 className="'), i(1), t('">'), i(0), t('</h2>')
  }),
  sp("tagh3", {
    t('<h3 className="'), i(1), t('">'), i(0), t('</h3>')
  }),
  sp("tagh4", {
    t('<h4 className="'), i(1), t('">'), i(0), t('</h4>')
  }),
  sp("tagh5", {
    t('<h5 className="'), i(1), t('">'), i(0), t('</h5>')
  }),
  sp("tagh6", {
    t('<h6 className="'), i(1), t('">'), i(0), t('</h6>')
  }),
  sp("taga", {
    t('<a href='), i(1), t('>'), i(0), t('</a>')
  }),

}
