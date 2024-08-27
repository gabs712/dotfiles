-- Plugins that add small tweaks
return {
  {
    -- Whenever y is used, the cursor doesn't move to start
    "svban/YankAssassin.nvim",
    config = function()
      require("YankAssassin").setup {
        auto_normal = true, 
        auto_visual = true,
      }
    end,
  },
  {
    'declancm/maximize.nvim',
    config = function()
      require('maximize').setup()

      vim.keymap.set({'n', 'x'}, '<C-w>m', require('maximize').toggle, {desc = 'Toggle window maximize'})
    end
  },
}
