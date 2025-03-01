-- Maximize Icon added to lualine.lua
return {
  'declancm/maximize.nvim',
  config = function()
    require('maximize').setup()

    vim.keymap.set({ 'n', 's' }, '<C-w>m', require('maximize').toggle, { desc = 'Toggle window maximize' })
  end,
}
