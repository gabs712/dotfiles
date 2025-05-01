return {
  'hedyhli/outline.nvim',
  config = function()
    require('custom.helpers').map_ctrl_j('Outline')
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
        fold_all = 'H',
        unfold_all = 'L',

        toggle_preview = 'P',
        down_and_jump = 'J',
        up_and_jump = 'K',
        restore_location = '-',
        close = 'q',
      },
      symbols = {
        icons = {
          Constant = { icon = '', hl = 'Constant' },
        },
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'Outline',
      callback = function()
        vim.keymap.set('n', '<C-o>', '<Nop>', { buffer = true })
        vim.keymap.set('n', '<C-i>', '<Nop>', { buffer = true })
      end,
    })

    vim.keymap.set('n', '<leader>s', '<cmd>Outline<CR>', { desc = 'Toggle outline (symbols)' })
  end,
}
