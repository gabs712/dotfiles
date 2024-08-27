-- Show icon when maximizing window (declancm/maximize.nvim)
local function maximize_icon()
  return vim.t.maximized and ' ' or '' 
end

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
        lualine_y = {maximize_icon, 'progress'},
        lualine_z = {},
      },
    })
  end
}
