return {
  'hedyhli/outline.nvim',
  config = function()
    require('outline').setup({
      outline_window = {
        position = 'right', -- left / right
        auto_close = false, -- Closes window if item is selected with enter
        focus_on_open = false,
      },
      outline_items = {
        show_symbol_details = true, -- Extra symbol details as virtual text
        show_symbol_lineno = false, -- Line numbers for each symbol
      },
      keymaps = {
        fold_all = { 'W', '<C-h>' },
        unfold_all = { 'E', '<C-l>' },
      },
    })

    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle outline (symbols)' })
  end,
}
