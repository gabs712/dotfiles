-- Config specifically made for codecompanion
return function()
  require('render-markdown').setup({
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
      width = 'block', -- block | full
      style = 'normal',

      left_pad = 1,
      right_pad = 1,
      highlight_inline = '',
    },
  })
end
