-- Config specifically made for codecompanion
return function()
  require('render-markdown').setup({
    enabled = true,
    file_types = { 'codecompanion' },
    anti_conceal = {
      enabled = false, -- Shows chars original appearence on current line
    },
    win_options = {
      concealcursor = {
        rendered = 'nic', -- Conceals raw markdown chars on current line
      },
    },
    heading = {
      backgrounds = {},
      icons = { '', '▋ ', '', '', '', '' },
    },
    code = {
      highlight_inline = '', -- backhround highlight on statements
      width = 'block', -- block | full
      left_pad = 1,
      right_pad = 1,

      -- Revealing language on code block border
      highlight_border = false,
      language_icon = true,
      language_name = false,
    },
  })
end
