return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()

    vim.keymap.set('n', '<leader>h', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Git preview hunk' })
    vim.keymap.set('n', '<leader>H', '<cmd>Gitsigns diffthis<CR>', { desc = 'Git diff' })

    vim.keymap.set('n', '<leader>b', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Git toggle blame' })
    vim.keymap.set('n', '<leader>B', '<cmd>Gitsigns blame<CR>', { desc = 'Git blame' })

    vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Git next hunk' })
    vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Git previous hunk' })

    vim.keymap.set('o', 'ah', '<cmd>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
    vim.keymap.set('o', 'ih', '<cmd>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })

    -- Uses ':' in visual mode due to a bug (Only lines after cursor were being selected)
    vim.keymap.set('x', 'ah', ':Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
    vim.keymap.set('x', 'ih', ':Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
  end,
}
