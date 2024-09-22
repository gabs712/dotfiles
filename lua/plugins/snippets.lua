return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets', -- Extra snippets
  },
  config = function()
    -- Loads snippets from friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    local ls = require('luasnip')

    ls.config.set_config({
      history = true, -- Jumps through snippet even after finishing it
    })

    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      if ls.jumpable(1) then
        ls.jump(1)
      end
    end, { desc = 'Jump to next snippet' })

    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { desc = 'Jump to previous snippet' })

    -- Snippets
    local fmt = require('luasnip.extras.fmt').fmt -- '{{' inserts '{'
    local s = ls.snippet -- New snippet

    local rep = require('luasnip.extras').rep -- Repeats
    local i = ls.insert_node -- Insert cursor

    ls.add_snippets('lua', {
      s('lr', fmt("local {} = require('{}')", { rep(1, 'module'), i(1, 'module') })),
    })
  end,
}
