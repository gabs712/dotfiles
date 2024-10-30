return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

    local icons = require('custom.icons')

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-s>'] = actions.select_horizontal,
            ['<C-x>'] = false,

            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.select_default,
          },
        },
      },
    })

    vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files({ hidden = true, prompt_title = 'Find Files (Hidden)' })
    end, { desc = 'Find files including hidden' })

    vim.keymap.set('n', '<leader>fe', function()
      builtin.find_files({ hidden = true, no_ignore = true, prompt_title = 'Find Every File' })
    end, { desc = 'Find all files' })

    vim.keymap.set('n', '<leader>fg', function()
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
    end, { desc = 'Find git status files' })

    vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = 'Find all strings (grep)' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Find quickfix' })

    vim.keymap.set('n', '<leader>f/', builtin.search_history, { desc = 'Find search history' })
    vim.keymap.set('n', '<leader>f:', builtin.command_history, { desc = 'Find command history' })

    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find old files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Find colorschemes' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find symbols' })

    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({
        cwd = vim.fn.stdpath('config'),
        prompt_title = 'Neovim Files',
      })
    end, { desc = 'Find neovim config' })

    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search in buffer' })
    vim.keymap.set('n', "<leader>'", builtin.registers, { desc = 'Find registers' })
    vim.keymap.set('n', '<leader>m', builtin.marks, { desc = 'Find marks' })

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to references' })
  end,
}
