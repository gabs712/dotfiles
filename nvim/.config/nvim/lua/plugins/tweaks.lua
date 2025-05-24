-- Plugins that add small tweaks
return {
  {
    -- Whenever y is used, the cursor doesn't move to start
    'svban/YankAssassin.nvim',
    config = function()
      require('YankAssassin').setup({
        -- Enabled modes
        auto_normal = true,
        auto_visual = true,
      })
    end,
  },
  {
    'drmingdrmer/vim-toggle-quickfix',
    config = function()
      vim.keymap.set('n', '<leader>q', '<Plug>window:quickfix:toggle', { desc = 'Toggle quickfix' })
    end,
  },
  {
    -- Automatically detects indentation and tab type when opening a buffer
    'tpope/vim-sleuth',
  },
}
