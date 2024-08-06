return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      }
    })

    vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<CR>')
  end
}
