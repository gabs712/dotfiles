return {
  'akinsho/git-conflict.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      ']g',
      function()
        require('custom.text-objects.repeat').git_conflict(true)
      end,
      desc = 'Next git conflict',
      mode = { 'n', 'x', 'o' },
    },
    {
      '[g',
      function()
        require('custom.text-objects.repeat').git_conflict(false)
      end,
      desc = 'Previous git conflict',
      mode = { 'n', 'x', 'o' },
    },
    { '<leader>[', '<cmd>GitConflictChooseOurs<CR>', desc = 'Choose current git conflict' },
    { '<leader>]', '<cmd>GitConflictChooseTheirs<CR>', desc = 'Choose merged git conflict' },
    { '<leader>=', '<cmd>GitConflictChooseBoth<CR>', desc = 'Choose both git conflicts' },
    { '<leader>-', '<cmd>GitConflictChooseNone<CR>', desc = 'Choose neither of git conflicts' },
  },
  config = function()
    local git_conflict = require('git-conflict')

    git_conflict.setup({
      default_mappings = false,
    })
  end,
}
