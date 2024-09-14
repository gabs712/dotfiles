return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      input = {
        mappings = {
          i = {
            ['<C-j>'] = 'Confirm'
          }
        }
      }
    })
  end
}
