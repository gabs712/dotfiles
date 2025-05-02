return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-x>'] = false,
            ['<C-u>'] = false,
            ['<C-d>'] = false,

            ['<C-s>'] = actions.select_horizontal,

            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.select_default,

            ['<C-f>'] = actions.preview_scrolling_down,
            ['<C-b>'] = actions.preview_scrolling_up,
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

    for _, b in ipairs(require('custom.telescope.bindings')) do
      vim.keymap.set(b.mode, b.lhs, b.rhs, b.obj)
    end

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to references' })
  end,
}
