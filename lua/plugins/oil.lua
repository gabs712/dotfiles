-- TODO: Enhance config
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
      view_options = {
        show_hidden = true, -- Show files and directories that start with "."

        is_hidden_file = function(name) -- What is considered a hidden file
          return vim.startswith(name, '.')
        end,

        is_always_hidden = function(name, bufnr) -- Never show
          return false
        end,
      },

      -- use_default_keymaps = true,
      keymaps = {
        ['<C-p>'] = false,
        ['<C-s>'] = false,
        ['<C-t>'] = false,

        ['gs'] = 'actions.change_sort',
        ['<C-h>'] = false,
        ['<C-l>'] = false,

        ['H'] = 'actions.parent',
        ['L'] = 'actions.select',

        ['<leader>e'] = 'actions.close',

        ['K'] = 'actions.preview',
      },
    })

    vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Explore tree (oil)' })
  end,
}
