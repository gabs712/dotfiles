return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fa', builtin.live_grep, {desc = 'Find All' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = 'Find Git' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = 'Find Recent' })
    vim.keymap.set('n', '<leader>ft', builtin.colorscheme, {desc = 'Find Theme' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {desc = 'Search' })
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files {
        cwd = vim.fn.stdpath 'config',
        prompt_title = 'Neovim Files'
      }
    end, { desc = 'Find Config' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Find keymaps' })
  end
}

