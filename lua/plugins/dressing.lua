return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      input = {
        mappings = {
          n = {
            ['<C-e>'] = "Close",
          },
          i = {
            ['<C-c>'] = false,
            ['<C-j>'] = 'Confirm',
            ['<C-e>'] = "Close",
          }
        }
      }
    })
  end
}
