return {
  'zaldih/themery.nvim',
  dependencies = {
    'folke/tokyonight.nvim',
  },
  config = function()
    vim.cmd('colorscheme tokyonight-moon') -- Default colorscheme

    require('custom.helpers').free_ft_ctrl('themery')
    require('themery').setup({
      themes = {
        'tokyonight-moon',
        'tokyonight-night',
        'tokyonight-storm',

        'catppuccin-mocha',
        'catppuccin-macchiato',
        'catppuccin-frappe',

        'duskfox',
        'nordfox',
        'nightfox',
        'carbonfox',

        'rose-pine-main',
        'rose-pine-moon',

        'kanagawa-wave',
        'kanagawa-dragon',
      },
      livePreview = true,
    })

    vim.keymap.set('n', '<leader>t', '<cmd>Themery<cr>', { desc = 'Themery' })
  end,
}
