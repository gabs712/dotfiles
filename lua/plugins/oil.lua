-- TODO: Enhance config
return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      default_file_explorer = false,
      keymaps = {
        ['<C-p>'] = false,
        ['<C-s>'] = false,
        ['<C-t>'] = false,

        ['gs'] = 'actions.change_sort',
        ['<C-h>'] = false,
        ['<C-l>'] = false,

        ['H'] = 'actions.parent',
        ['L'] = 'actions.select',

        ['<leader>o'] = 'actions.close',

        ['K'] = 'actions.preview',
      },
    })

    vim.keymap.set('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'Oil' })
  end,
}
