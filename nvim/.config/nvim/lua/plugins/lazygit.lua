return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lazygit',
      callback = function()
        vim.keymap.set('t', '<Esc>', '<C-c>', { buffer = true, remap = true })
      end,
    })

    vim.keymap.set('n', '<leader>l', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
  end,
}
