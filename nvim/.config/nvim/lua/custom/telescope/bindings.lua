local builtin = require('telescope.builtin')
local icons = require('custom.icons')

return {
  {
    mode = 'n',
    lhs = '<C-f>',
    rhs = builtin.find_files,
    obj = { desc = 'Find files' },
  },
  {
    mode = 'n',
    lhs = '<leader>ff',
    rhs = function()
      builtin.find_files({ hidden = true, prompt_title = 'Find Files (Hidden)' })
    end,
    obj = { desc = 'Find files including hidden' },
  },
  {
    mode = 'n',
    lhs = '<leader>fe',
    rhs = function()
      builtin.find_files({ hidden = true, no_ignore = true, prompt_title = 'Find Every File' })
    end,
    obj = { desc = 'Find all files' },
  },
  {
    mode = 'n',
    lhs = '<leader>fl',
    rhs = function()
      builtin.git_status({
        git_icons = {
          added = icons.git.added,
          deleted = icons.git.deleted,
          changed = icons.git.modified,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,

          -- Defaults
          copied = '>',
          unmerged = '‡',
        },
      })
    end,
    obj = { desc = 'Find git status files' },
  },
  {
    mode = 'n',
    lhs = '<leader>fa',
    rhs = builtin.live_grep,
    obj = { desc = 'Find all strings (grep)' },
  },
  {
    mode = 'n',
    lhs = '<leader>fd',
    rhs = builtin.diagnostics,
    obj = { desc = 'Find diagnostics' },
  },
  {
    mode = 'n',
    lhs = '<leader>fq',
    rhs = builtin.quickfix,
    obj = { desc = 'Find quickfix' },
  },
  {
    mode = 'n',
    lhs = '<leader>/',
    rhs = builtin.search_history,
    obj = { desc = 'Find search history' },
  },
  {
    mode = 'n',
    lhs = '<leader>:',
    rhs = builtin.command_history,
    obj = { desc = 'Find command history' },
  },
  {
    mode = 'n',
    lhs = '<leader>fo',
    rhs = builtin.oldfiles,
    obj = { desc = 'Find old files' },
  },
  {
    mode = 'n',
    lhs = '<leader>fb',
    rhs = builtin.buffers,
    obj = { desc = 'Find buffers' },
  },
  {
    mode = 'n',
    lhs = '<leader>fc',
    rhs = builtin.colorscheme,
    obj = { desc = 'Find colorschemes' },
  },
  -- WARN: Currently deprecated api
  {
    mode = 'n',
    lhs = '<leader>fs',
    rhs = builtin.lsp_document_symbols,
    obj = { desc = 'Find symbols' },
  },
  {
    mode = 'n',
    lhs = '<leader>fs',
    rhs = builtin.lsp_dynamic_workspace_symbols,
    obj = { desc = 'Find symbols across project' },
  },
  {
    mode = 'n',
    lhs = '<leader>fk',
    rhs = function()
      builtin.keymaps({ show_plug = false })
    end,
    obj = { desc = 'Find keymaps' },
  },
  {
    mode = 'n',
    lhs = '<leader>?',
    rhs = builtin.help_tags,
    obj = { desc = 'Find help' },
  },
  {
    mode = 'n',
    lhs = '<leader>fn',
    rhs = function()
      builtin.find_files({
        hidden = true,
        cwd = '~/dotfiles/',
        prompt_title = 'Dotfiles',
      })
    end,
    obj = { desc = 'Find dotfiles (neovim and alike)' },
  },
  {
    mode = 'n',
    lhs = '<leader>f/',
    rhs = builtin.current_buffer_fuzzy_find,
    obj = { desc = 'Search in buffer' },
  },
  {
    mode = 'n',
    lhs = '<leader>y',
    rhs = builtin.registers,
    obj = { desc = 'Show yank registers' },
  },
  {
    mode = 'n',
    lhs = '<leader>m',
    rhs = builtin.marks,
    obj = { desc = 'Show marks' },
  },
}
