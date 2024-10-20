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
  end,
}
