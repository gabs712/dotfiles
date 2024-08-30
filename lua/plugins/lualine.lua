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
        theme = 'auto',

        -- Some icons:             
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          'branch', 
          {
            'diff',
            symbols = {
              added = '+',
              modified = '~',
              removed = '-'
            },
          },
          'diagnostics'
        },
        lualine_c = {
          {
            'filename',
            path = 4, -- Parent directory and file name
            symbols = {
              -- Icons:  
              modified = '',
              readonly = '',
              unnamed = '-',
              newfile = '',
            }
          },
        },
        lualine_x = {
          'searchcount',
          maximize_icon,
          {
            'filetype',
            icon_only = false,
            icon = {
              align = 'left'
            }
          },
        },
        lualine_y = {'progress'},
        lualine_z = {},
      },
    })
  end
}
