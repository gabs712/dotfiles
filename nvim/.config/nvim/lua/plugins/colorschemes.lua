return {
  {
    'folke/tokyonight.nvim',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    'EdenEast/nightfox.nvim',
  },
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
  },
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
  },
  {
    'arcticicestudio/nord-vim',
  },
  {
    'HoNamDuong/hybrid.nvim',
  },
  {
    'navarasu/onedark.nvim',
  },
  {
    'projekt0n/github-nvim-theme',
  },
  {
    'AlexvZyl/nordic.nvim',
  },
  {
    'cdmill/neomodern.nvim', -- 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
    config = function()
      require('neomodern').setup()
    end,
  },
  {
    'cocopon/iceberg.vim',
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'iceberg',
        callback = function()
          -- Normally StatusLine is too bright
          vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#818596', fg = '#1e2132' })
          vim.api.nvim_set_hl(0, 'StatusLineTerm', { bg = '#818596', fg = '#1e2132' })
        end,
      })
    end,
  },
}
