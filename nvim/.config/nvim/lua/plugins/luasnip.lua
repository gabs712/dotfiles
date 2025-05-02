return {
  'L3MON4D3/LuaSnip',
  config = function()
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
    require('custom.luasnip.snippet_init')
  end,
}
