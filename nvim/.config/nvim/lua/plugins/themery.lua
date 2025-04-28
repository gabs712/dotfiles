return {
  'zaldih/themery.nvim',
  dependencies = {
    'folke/tokyonight.nvim',
  },
  config = function()
    vim.cmd('colorscheme duskfox') -- Default colorscheme

    require('custom.helpers').map_ctrl_j_hl('themery')
    require('themery').setup({
      themes = {
        'catppuccin-mocha',
        'catppuccin-macchiato',
        'catppuccin-frappe',

        'duskfox',
        'nordfox',
        'nightfox',
        'carbonfox',

        'iceclimber',
        'roseprime',

        'hybrid',

        'iceberg',

        'nord',
        'nordic',

        'moonfly',

        'nightfly',

        'github_dark_default',
        'github_dark_dimmed',

        'rose-pine-main',
        'rose-pine-moon',

        'onedark',

        'tokyonight-moon',
        'tokyonight-night',
        'tokyonight-storm',

        'kanagawa-wave',
        'kanagawa-dragon',
      },
      livePreview = true,
    })

    vim.keymap.set('n', '<leader>t', '<cmd>Themery<cr>', { desc = 'Themery' })
  end,
}
