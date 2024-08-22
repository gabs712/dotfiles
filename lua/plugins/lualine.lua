return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
      },
      sections = {
        lualine_a = {},
        lualine_b = {'mode', 'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {},
      },
    })
  end
}
