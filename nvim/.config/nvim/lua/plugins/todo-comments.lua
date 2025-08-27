return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<leader>ft', '<cmd>TodoTelescope<CR>', desc = 'Find todos' },
    {
      ']t',
      function()
        require('custom.text-objects.repeat').todo(true)
      end,
      desc = 'Next todo',
      mode = { 'n', 'x', 'o' },
    },
    {
      '[t',
      function()
        require('custom.text-objects.repeat').todo(false)
      end,
      desc = 'Previous todo',
      mode = { 'n', 'x', 'o' },
    },
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
