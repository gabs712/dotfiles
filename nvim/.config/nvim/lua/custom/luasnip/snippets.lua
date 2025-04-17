local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt -- '{{' inserts '{'

local s = ls.snippet -- New snippet
local i = ls.insert_node -- Insert cursor
local f = ls.function_node
local rep = require('luasnip.extras').rep -- Repeats

ls.add_snippets('lua', {
  s('l', fmt('local {}', { i(1) })),
})

-- local jest = {
--   s('jd', fmt("describe('{}', () => {{\n  {}\n}})", { i(1), i(2, '//') })),
--   s('jt', fmt("test('{}', () => {{\n  {}\n}})", { i(1), i(2, '//') })),
--   s('je', fmt('expect({}).toBe({})', { i(1), i(2) })),
-- }
--
-- ls.add_snippets('javascript', jest)

local javascript = {
  s('c', fmt('const {}', { i(1) })),
  s('l', fmt('let {}', { i(1) })),
  s('sf', fmt('({}) => {}', { i(1), i(2) })),
  s('csf', fmt('const {} = ({}) => {}', { i(1, 'name'), i(2), i(3) })),
  s('lsf', fmt('let {} = ({}) => {}', { i(1, 'name'), i(2), i(3) })),

  s('imp', fmt("import {} from '{}'", { i(1, 'name'), i(2, 'module') })),
  s('re', fmt("require('{}')", { i(1) })),

  s(
    'f',
    fmt(
      [[
        ({}) => {{
          {}
        }}
      ]],
      { i(1), i(2) }
    )
  ),

  s(
    'cf',
    fmt(
      [[
        const {} = ({}) => {{
          {}
        }}
      ]],
      { i(1, 'name'), i(3), i(2) }
    )
  ),

  s(
    'lf',
    fmt(
      [[
        let {} = ({}) => {{
          {}
        }}
      ]],
      { i(1, 'name'), i(3), i(2) }
    )
  ),

  s(
    'fun',
    fmt(
      [[
        function {}({}) {{
          {}
        }}
      ]],
      { i(1, 'name'), i(3), i(2) }
    )
  ),

  s(
    'ef',
    fmt(
      [[
        export default function {}({}) {{
          {}
        }}
      ]],
      {
        f(function(_, snip)
          return vim.fn.fnamemodify(snip.env.TM_FILENAME, ':r')
        end),
        i(2),
        i(1),
      }
    )
  ),

  s(
    'for',
    fmt(
      [[
    for (let {} = 0; {} < {}; {}++) {{
      {}
    }}
      ]],
      { i(1, 'i'), rep(1, 'i'), i(2, '_'), rep(1, 'i'), i(3) }
    )
  ),

  s(
    'forof',
    fmt(
      [[
        for (const {} of {}) {{
          {}
        }}
      ]],
      { i(1, 'name'), i(2, '_'), i(3) }
    )
  ),

  s(
    'forin',
    fmt(
      [[
        for (const {} in {}) {{
          {}
        }}
      ]],
      { i(1, 'name'), i(2, '_'), i(3) }
    )
  ),

  s('cl', fmt('console.log({})', i(1))),

  s(
    'if',
    fmt(
      [[
        if ({}) {{
          {}
        }}
      ]],
      { i(1), i(2) }
    )
  ),

  s(
    'switch',
    fmt(
      [[
        switch ({}) {{
          case '{}': {{
            {}
          }}
        }}
      ]],
      { i(1), i(2), i(3) }
    )
  ),

  s(
    'dowhile',
    fmt(
      [[
        do {{
          {}
        }} while ({})
      ]],
      { i(2), i(1) }
    )
  ),

  s(
    'try',
    fmt(
      [[
        try {{
          {}
        }} catch (error) {{
          {}
        }}
      ]],
      { i(1), i(2) }
    )
  ),
}

ls.add_snippets('javascript', javascript)
ls.add_snippets('javascriptreact', javascript)
ls.add_snippets('javascriptreact', {
  s(
    'us',
    fmt('const [{}, set{}] = useState({})', {
      i(1, 'name'),
      f(function(args)
        return args[1][1]:gsub('^%l', string.upper)
      end, { 1 }),
      i(2),
    })
  ),
})

ls.add_snippets('html', {
  s('e', fmt('<%{} {} %>', { i(2), i(1) })),
})
