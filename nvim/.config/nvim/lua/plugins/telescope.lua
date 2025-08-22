return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')
    local icons = require('utils.icons')

    require('utils.ft').bind_shell_movements('TelescopePrompt')

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-x>'] = false,

            ['<C-s>'] = actions.select_horizontal,

            ['<Esc>'] = actions.close,
            ['<C-j>'] = actions.select_default,

            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-d>'] = actions.preview_scrolling_down,
          },
        },
      },
      pickers = {
        git_status = {
          mappings = {
            i = {
              ['<C-g>'] = actions.git_staging_toggle,
              ['<Tab>'] = function(bufnr)
                actions.toggle_selection(bufnr)
                actions.move_selection_previous(bufnr)
              end,
            },
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
    end, { desc = 'Find every file' })

    vim.keymap.set('n', '<leader>fl', function()
      builtin.git_status({
        git_icons = {
          added = icons.git.added,
          deleted = icons.git.deleted,
          changed = icons.git.modified,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          copied = '>',
          unmerged = '‡',
        },
      })
    end, { desc = 'Find git status files' })

    vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = 'Find all strings (grep)' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Find quickfix' })
    vim.keymap.set('n', '<leader>Q', builtin.quickfixhistory, { desc = 'Find quickfix history' })
    vim.keymap.set('n', '<leader>/', builtin.search_history, { desc = 'Find search history' })
    vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Find command history' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find oldfiles' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Find colorschemes' })

    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find symbols' })
    vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, { desc = 'Find symbols across project' }) -- WARN: Currently deprecated API

    vim.keymap.set('n', '<leader>fk', function()
      builtin.keymaps({ show_plug = false })
    end, { desc = 'Find keymaps' })

    vim.keymap.set('n', '<leader>?', builtin.help_tags, { desc = 'Find help' })

    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({
        hidden = true,
        cwd = '~/dotfiles/',
        prompt_title = 'Dotfiles',
      })
    end, { desc = 'Find dotfiles (neovim and alike)' })

    vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { desc = 'Search in buffer' })
    vim.keymap.set('n', '<leader>fy', builtin.registers, { desc = 'Show registers' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Show marks' })

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to references' })
  end,
}
