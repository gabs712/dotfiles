return {
  'akinsho/git-conflict.nvim',
  version = '*',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local git_conflict = require('git-conflict')

    git_conflict.setup({
      default_mappings = false,
    })

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- Repeatable conflict move
    local next_conflict, prev_conflict = ts_repeat_move.make_repeatable_move_pair(function()
      if git_conflict.conflict_count() > 0 then
        vim.cmd("normal! m'")
      end

      vim.cmd('GitConflictNextConflict')
    end, function()
      if git_conflict.conflict_count() > 0 then
        vim.cmd("normal! m'")
      end

      vim.cmd('GitConflictPrevConflict')
    end)

    vim.keymap.set('n', '[g', prev_conflict, { desc = 'Previous git conflict' })
    vim.keymap.set('n', ']g', next_conflict, { desc = 'Next git conflict' })
    vim.keymap.set('n', '<leader>[', '<Plug>(git-conflict-ours)', { desc = 'Choose current git conflict' })
    vim.keymap.set('n', '<leader>]', '<Plug>(git-conflict-theirs)', { desc = 'Choose merged git conflict' })
    vim.keymap.set('n', '<leader>=', '<Plug>(git-conflict-both)', { desc = 'Choose both git conflicts' })
    vim.keymap.set('n', '<leader>-', '<Plug>(git-conflict-none)', { desc = 'Choose neither of git conflicts' })
  end,
}
