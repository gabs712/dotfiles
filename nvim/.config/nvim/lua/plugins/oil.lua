return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local oil = require('oil')

    local show_hidden = true
    local toggle_binding = '<leader>w'

    -- Notify when toggling hidden files
    local hidden_enabled = show_hidden
    local notify_toggle_hidden = {
      callback = function()
        oil.toggle_hidden()
        hidden_enabled = not hidden_enabled

        if hidden_enabled then
          vim.notify('Oil: hidden files enabled')
        else
          vim.notify('Oil: hidden files disabled')
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

      preview_win = {
        preview_method = 'scratch', -- Loads entire buffer without attaching lsp (necessary to scroll)
      },

      use_default_keymaps = false,
      keymaps = {
        ['<C-j>'] = 'actions.select',
        ['<C-k>'] = 'actions.parent',

        ['<C-Space>'] = 'actions.open_cwd',
        ['<C-l>'] = 'actions.preview',

        ['K'] = 'actions.preview_scroll_up',
        ['J'] = 'actions.preview_scroll_down',

        ['gd'] = { 'actions.cd', opts = { scope = 'tab' }, desc = 'Change cwd on tab', mode = 'n' },
        ['gr'] = 'actions.refresh',
        ['g.'] = notify_toggle_hidden,
        ['gs'] = 'actions.change_sort',
        ['g?'] = 'actions.show_help',

        [toggle_binding] = 'actions.close',
        ['<C-c>'] = 'actions.close',

        ['<CR>'] = 'actions.select',
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil_preview', -- Confirmation popup
      callback = function()
        vim.keymap.set('n', '<C-j>', 'y', { buffer = true, remap = true })
        vim.keymap.set('n', '<CR>', 'y', { buffer = true, remap = true })
        vim.keymap.set('n', '<C-k>', 'n', { buffer = true, remap = true })
        vim.keymap.set('n', '<C-h>', '<Nop>', { buffer = true })
        vim.keymap.set('n', '<C-l>', '<Nop>', { buffer = true })
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        local actions = require('oil.actions')

        vim.keymap.set('n', '<Esc>', function()
          actions.close.callback()
        end, { buffer = true })

        -- Clear highlights
        vim.keymap.set('n', '<C-h>', function()
          vim.cmd('nohlsearch')
        end, { buffer = true })

        -- Allow saving while in insert mode
        vim.keymap.set({ 'n', 'i', 'x', 's' }, '<C-s>', '<Esc><cmd>w<CR>', { buffer = true })

        -- Close oil before running telescope
        for _, b in ipairs(require('custom.telescope.bindings')) do
          local obj = vim.tbl_extend('force', b.obj, { buffer = true })

          vim.keymap.set(b.mode, b.lhs, function()
            actions.close.callback()
            b.rhs()
          end, obj)
        end
      end,
    })
    vim.keymap.set('n', toggle_binding, oil.open_float, { desc = 'Open oil (workspace)' })
  end,
}
