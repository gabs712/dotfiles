local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt -- '{{' inserts '{'

local s = ls.snippet -- New snippet
local i = ls.insert_node -- Insert cursor
local rep = require('luasnip.extras').rep -- Repeats

ls.add_snippets('lua', {
  s('lr', fmt("local {} = require('{}')", { rep(1, 'module'), i(1, 'module') })),
  s('vk', fmt("vim.keymap.set({}, '{}', {})", { i(1, 'mode'), i(2, 'keymap'), i(3, 'action') })),
})

ls.add_snippets('javascript', {
  s('jd', fmt("describe('{}', () => {{\n  {}\n}})", { i(1), i(2) })),
  s('jt', fmt("test('{}', () => {{\n  {}\n}})", { i(1), i(2) })),
  s('ji', fmt("it('{}', () => {{\n  {}\n}})", { i(1), i(2) })),
  s('j', fmt('expect({}).toBe()', { i(1) })),
  s('je', fmt('expect({}).toBe()', { i(1) })),
})
