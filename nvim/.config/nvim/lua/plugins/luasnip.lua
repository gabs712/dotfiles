return {
  'L3MON4D3/LuaSnip',
  keys = {
    {
      '<c-l>',
      function()
        if require('luasnip').jumpable(1) then
          require('luasnip').jump(1)
        end
      end,
      desc = 'Jump to next snippet',
      mode = { 'i', 's' },
    },
    {
      '<c-k>',
      function()
        if require('luasnip').jumpable(-1) then
          require('luasnip').jump(-1)
        end
      end,
      desc = 'Jump to previous snippet',
      mode = { 'i', 's' },
    },
  },
  config = function()
    require('luasnip').config.set_config({
      history = true, -- Jumps through snippet even after finishing it
    })

    -- Custom snippets
    require('custom.luasnip.snippet_init')
  end,
}
