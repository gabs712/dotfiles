return {
  'stevearc/dressing.nvim',
  config = function()
    require('custom.helpers').free_ft_ctrl('DressingInput')
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
