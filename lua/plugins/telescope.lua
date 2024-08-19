return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find files' })
    vim.keymap.set('n', '<leader>fa', builtin.live_grep, {desc = 'Find all terms' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find help' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = 'Find git files' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = 'Find recent' })
    vim.keymap.set('n', '<leader>ft', builtin.colorscheme, {desc = 'Find theme (colorscheme)' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {desc = 'Search in buffer' })
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files {
        cwd = vim.fn.stdpath 'config',
        prompt_title = 'Neovim Files'
      }
    end, { desc = 'Find config' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Find keymaps' })
  end
}

