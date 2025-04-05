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
        vim.keymap.set('t', '<Esc>', '<cmd>close<CR>', { buffer = true })
      end,
    })
  end,
}
