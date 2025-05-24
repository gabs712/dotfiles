local ls = require('luasnip')
local fmt = require('custom.luasnip.fmt')

local s = ls.snippet
local i = ls.insert_node

ls.add_snippets('ejs', {
  s('e', fmt('<%{} {} %>', { i(2), i(1) })),
})
