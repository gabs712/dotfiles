return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()

    vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Git preview' })
    vim.keymap.set('n', '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Git toggle blame' })
  end,
}
