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

    -- Custom snippets
    require('lua.custom.luasnip.snippets')
  end,
}
