return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-l>"] = actions.select_default,
          },
        },
      },
    })

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find files' })
    vim.keymap.set({'n', 'x'}, '<C-f>', builtin.find_files, {desc = 'Find files' })
    vim.keymap.set('n', '<leader>fa', builtin.live_grep, {desc = 'Find all terms' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find help' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = 'Find git files' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = 'Find old files' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {desc = 'Find colorschemes' })
    vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, {desc = 'Search in buffer' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Find keymaps' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files {
        cwd = vim.fn.stdpath 'config',
        prompt_title = 'Neovim Files'
      }
    end, { desc = 'Find neovim config' })

    --lsp
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {desc = 'Find references'})
  end
}

