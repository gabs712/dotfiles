return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
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
        local current = vim.api.nvim_get_current_buf()

        vim.keymap.set('n', '<C-h>', function()
          vim.cmd('nohlsearch')
        end, { buffer = current })
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        local current = vim.api.nvim_get_current_buf()

        vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<CR>', { buffer = current })
      end,
    })
    vim.keymap.set('n', '<leader>o', oil.open_float, { desc = 'Explore tree (oil)' })
  end,
}
