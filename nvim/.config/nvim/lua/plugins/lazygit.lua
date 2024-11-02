return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>l', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lazygit',
      callback = function()
        local current = vim.api.nvim_get_current_buf()

        vim.keymap.set('t', '<Esc>', '<cmd>close<CR>', { buffer = current })
      end,
    })
  end,
}
