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
      width = 'full', -- block | full
      style = 'normal',

      highlight_inline = '',
    },
  })
end
