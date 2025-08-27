return {
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
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
    lazy = true,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = true,
  },
}
