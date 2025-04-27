local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

local s = ls.snippet
local i = ls.insert_node

ls.add_snippets('html', {
  s('e', fmt('<%{} {} %>', { i(2), i(1) })),
})
