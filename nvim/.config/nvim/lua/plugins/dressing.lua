return {
  'stevearc/dressing.nvim',
  config = function()
    require('custom.helpers').map_ctrl_j('DressingInput')
    require('dressing').setup({
      input = {
        mappings = {
          n = {
            ['<C-c>'] = 'Close',
          },
          i = {
            ['<C-c>'] = 'Close',
            ['<C-j>'] = 'Confirm',
          },
        },
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'DressingInput',
      callback = function()
        local current = vim.api.nvim_get_current_buf()

        vim.keymap.set('i', '<C-f>', '<Right>', { buffer = current })
        vim.keymap.set('i', '<C-b>', '<Left>', { buffer = current })
        vim.keymap.set('i', '<C-a>', '<Home>', { buffer = current })
        vim.keymap.set('i', '<C-e>', '<End>', { buffer = current })
      end,
    })
  end,
}
