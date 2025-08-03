return {
  'folke/trouble.nvim',
  config = function()
    require('utils.ft').clear_c_hjkl('trouble', { bind_c_j = true })
    require('utils.ft').bind_close_win('trouble', 'close')

    require('trouble').setup({
      warn_no_results = false,
      open_no_results = true,
      auto_preview = false,
      focus = true,

      keys = {
        ['l'] = 'jump',
        ['h'] = 'fold_close',
        ['<C-k>'] = 'fold_close',
        ['q'] = false,
        ['<esc>'] = false,
      },
    })

    vim.keymap.set('n', '<leader>D', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics on workspace' })
  end,
}
