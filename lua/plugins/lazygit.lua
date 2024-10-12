return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set({ 'n', 'x' }, '<leader>l', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
  end,
}
