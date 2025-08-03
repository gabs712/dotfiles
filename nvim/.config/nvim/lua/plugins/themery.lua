return {
  'zaldih/themery.nvim',
  dependencies = {
    'folke/tokyonight.nvim',
  },
  config = function()
    vim.cmd('colorscheme duskfox') -- Default colorscheme

    require('utils.ft').clear_c_hjkl('themery', { bind_c_j = true })
    require('themery').setup({
      themes = {
        'duskfox',
        'nightfox',

        'catppuccin-mocha',
        'catppuccin-macchiato',
        'catppuccin-frappe',

        'tokyonight-moon',
        'tokyonight-night',
        'tokyonight-storm',

        'github_dark_default',
        'github_dark_dimmed',
      },
      livePreview = true,
    })

    vim.keymap.set('n', '<leader>t', '<cmd>Themery<cr>', { desc = 'Themery' })
  end,
}
