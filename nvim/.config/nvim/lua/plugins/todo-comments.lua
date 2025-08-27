return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<leader>ft', '<cmd>TodoTelescope<CR>', desc = 'Find todos' },
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
  end,
}
