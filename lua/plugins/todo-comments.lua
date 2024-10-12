return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local todo_comments = require('todo-comments')

    todo_comments.setup({
      signs = false,
      highlight = {
        -- keyword = '',
        -- after = '',
        multiline = false,
      },
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find todos' })
  end,
}
