return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      default_file_explorer = true,
      delete_to_trash = true,
      watch_for_changes = true, -- Watch the filesystem for changes and reload oil

      lsp_file_methods = {
        enabled = true,
        autosave_changes = false, -- Autosave buffers that are updated with lsp
      },
      win_options = {
        wrap = true,
      },

      view_options = {
        show_hidden = true, -- Show files and directories that start with "."

        is_hidden_file = function(name) -- What is considered a hidden file
          return vim.startswith(name, '.')
        end,
        is_always_hidden = function(name) -- Never show
          return name == '..'
        end,
      },

      use_default_keymaps = false,
      keymaps = {
        ['H'] = 'actions.parent',
        ['L'] = 'actions.select',
        ['<CR>'] = 'actions.select',

        ['-'] = 'actions.open_cwd',
        ['K'] = 'actions.preview',

        ['gd'] = { 'actions.cd', opts = { scope = 'tab' }, desc = 'Change cwd on tab', mode = 'n' },
        ['g?'] = 'actions.show_help',
        ['gh'] = 'actions.toggle_hidden',
        ['gs'] = 'actions.change_sort',
        ['g\\'] = 'actions.toggle_trash',

        ['<leader>o'] = 'actions.close',
        ['<C-c>'] = 'actions.close',
      },
    })

    vim.keymap.set('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'Explore tree (oil)' })
  end,
}
