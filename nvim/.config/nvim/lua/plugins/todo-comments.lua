return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter-textobjects',
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

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')
    local next_todo, prev_todo = ts_repeat_move.make_repeatable_move_pair(function()
      require('todo-comments').jump_next()
    end, function()
      require('todo-comments').jump_prev()
    end)

    vim.keymap.set({ 'n', 'x', 'o' }, ']t', next_todo, { desc = 'Next todo ' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[t', prev_todo, { desc = 'Previous todo' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']T', next_todo, { desc = 'Next todo ' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[T', prev_todo, { desc = 'Previous todo' })

    vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find todos' })
  end,
}
