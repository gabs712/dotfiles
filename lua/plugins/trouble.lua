-- TODO: Subsittue for quickfix, while also making it prettier
return {
  'folke/trouble.nvim',
  config = function()
    require('trouble').setup({
      warn_no_results = false,
      open_no_results = true,
      auto_preview = false,
      focus = true,

      keys = {
        ['l'] = 'jump',
        ['h'] = 'fold_close',
      },
    })

    vim.keymap.set('n', '<leader>D', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics on workspace' })
  end,
}
