return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      input = {
        mappings = {
          n = {
            ['<C-c>'] = "Close",
          },
          i = {
            ['<C-j>'] = 'Confirm',
            ['<C-c>'] = "Close",
          }
        }
      }
    })
  end
}
