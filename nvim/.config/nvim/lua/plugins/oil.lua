return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local oil = require('oil')

    local show_hidden = true

    -- Notify when toggling hidden files
    local hidden_enabled = show_hidden
    local notify_toggle_hidden = {
      callback = function()
        oil.toggle_hidden()
        hidden_enabled = not hidden_enabled

        if hidden_enabled then
          print('Hidden files enabled')
        else
          print('Hidden files disabled')
        end
      end,
      mode = 'n',
      desc = 'Toggle hidden files',
    }

    oil.setup({
      default_file_explorer = true,
      watch_for_changes = true, -- Watch the filesystem for changes and reload oil

      lsp_file_methods = {
        enabled = true,
        autosave_changes = false, -- Autosave buffers that are updated with lsp
      },
      win_options = {
        wrap = true,
      },

      view_options = {
        show_hidden = show_hidden, -- Show files and directories that start with "."

        is_hidden_file = function(name) -- What is considered a hidden file
          return vim.startswith(name, '.')
        end,
        is_always_hidden = function(name) -- Never show
          return name == '..'
        end,
      },

      use_default_keymaps = false,
      keymaps = {
        ['<C-j>'] = 'actions.select',
        ['<C-k>'] = 'actions.parent',

        ['-'] = 'actions.open_cwd',
        ['<C-l>'] = 'actions.preview',

        ['gd'] = { 'actions.cd', opts = { scope = 'tab' }, desc = 'Change cwd on tab', mode = 'n' },
        ['gr'] = 'actions.refresh',
        ['g.'] = notify_toggle_hidden,
        ['gs'] = 'actions.change_sort',
        ['g?'] = 'actions.show_help',

        ['<leader>o'] = 'actions.close',
        ['<C-c>'] = 'actions.close',

        ['<CR>'] = 'actions.select',
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        vim.keymap.set('n', '<C-h>', function()
          vim.cmd('nohlsearch')
        end, { buffer = true })
      end,
    })

    local telescope = require('telescope.builtin')
    local actions = require('oil.actions')
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        -- Allow saving while in insert mode
        vim.keymap.set({ 'i', 's' }, '<C-s>', '<Esc><cmd>w<CR>', { buffer = true })

        -- Close oil before running telescope on bindings matching possible oil contents
        vim.keymap.set('n', '<C-f>', function()
          actions.close.callback()
          telescope.find_files()
        end, { buffer = true })
        vim.keymap.set('n', '<leader>ff', function()
          actions.close.callback()
          telescope.find_files({ hidden = true, prompt_title = 'Find Files (Hidden)' })
        end, { buffer = true })
        vim.keymap.set('n', '<leader>fe', function()
          actions.close.callback()
          telescope.find_files({ hidden = true, no_ignore = true, prompt_title = 'Find Every File' })
        end, { buffer = true })
      end,
    })
    vim.keymap.set('n', '<leader>o', oil.open_float, { desc = 'Explore tree (oil)' })
  end,
}
