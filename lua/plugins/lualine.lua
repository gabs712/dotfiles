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
        disabled_filetypes = {
          statusline = {}, -- Only ignores the ft for statusline.
          winbar = {}, -- Only ignores the ft for winbar.
          -- Ignores for both \/
        },

        -- Some icons:             
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          'branch',
        },
        lualine_c = {
          {
            'filetype',
            padding = {left = 1, right = 0},
            icon_only = true,
            icon = {
              align = 'left'
            }
          },
          {
            'filename',
            path = 4, -- Parent directory and file name
            symbols = {
              -- Icons:  
              modified = '',
              readonly = '',
              unnamed = 'Unnamed',
              newfile = '',
            }
          },
        },
        lualine_x = {
          {
            'searchcount',
            padding = {left = 1, right = 3}
          },
          'diagnostics',
          {
            'diff',
            padding = {left = 1, right = 1},
            symbols = {
              added = ' ',
              modified = ' ',
              removed = ' '
            },
            -- Where to get git info from
            source = function()
              -- Using gitsigns, it updates in real time, with no need to save
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          {
            padding = {left = 1, right = 0},
            maximize_icon,
          },
          'progress',
        },
        lualine_z = {},
      },
    })
  end
}
