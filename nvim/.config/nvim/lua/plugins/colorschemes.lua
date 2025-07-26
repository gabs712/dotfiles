return {
  {
    'EdenEast/nightfox.nvim',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        integrations = {
          render_markdown = false,
        },
      })
    end,
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'projekt0n/github-nvim-theme',
  },
}
