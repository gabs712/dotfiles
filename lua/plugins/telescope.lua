return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fa', builtin.live_grep)
    vim.keymap.set('n', '<leader>fb', builtin.buffers)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    vim.keymap.set('n', '<leader>fg', builtin.git_files)
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme)
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files {
        cwd = vim.fn.stdpath 'config',
        prompt_title = 'Neovim Files'
      }
    end)
  end
}

