return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local startify = require('alpha.themes.startify')

    startify.file_icons.provider = 'devicons'

    startify.section.header.val = {
      [[                                   __                ]],
      [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    require('alpha').setup(startify.config)
  end,
}
