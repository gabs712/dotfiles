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
            ['<Esc>'] = 'Close',
            ['<C-c>'] = 'Close',
            ['<C-j>'] = 'Confirm',
          },
        },
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'DressingInput',
      callback = function()
        vim.keymap.set({ 'i', 's' }, '<C-f>', '<Right>', { buffer = true })
        vim.keymap.set({ 'i', 's' }, '<C-b>', '<Left>', { buffer = true })
        vim.keymap.set({ 'i', 's' }, '<C-a>', '<Home>', { buffer = true })
        vim.keymap.set({ 'i', 's' }, '<C-e>', '<End>', { buffer = true })
      end,
    })
  end,
}
