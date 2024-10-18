return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      input = {
        mappings = {
          n = {
            ['<C-c>'] = 'Close',
            ['<C-j>'] = 'Confirm',

            ['<C-h>'] = '<Nop>',
            ['<C-k>'] = '<Nop>',
            ['<C-l>'] = '<Nop>',
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
