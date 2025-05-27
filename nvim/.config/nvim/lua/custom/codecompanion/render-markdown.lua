-- Config specifically made for codecompanion
return function()
  require('render-markdown').setup({
    enabled = true,
    file_types = { 'codecompanion' },
    anti_conceal = {
      enabled = false, -- Shows chars original appearence on current line
    },
    win_options = {
      conceallevel = {
        rendered = 1, -- 1 show inserted language icons, 3 hide all
      },
      concealcursor = {
        rendered = 'nic', -- Conceals raw markdown chars on current line
      },
    },
    heading = {
      backgrounds = {},
      icons = { '', '▋ ', '', '', '', '' },
    },
    code = {
      highlight_inline = '',
      language_icon = false,
      render_modes = false,
      language_name = true,
      highlight_border = false,
    },
  })
end
