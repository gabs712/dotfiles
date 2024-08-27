-- Plugins that add small tweaks
return {
  {
    -- Whenever y is used, the cursor doesn't move to start
    "svban/YankAssassin.nvim",
    config = function()
      require("YankAssassin").setup {
        -- Enabled modes
        auto_normal = true, 
        auto_visual = true,
      }
    end,
  },
  {
    -- Whenever indent (<, >, =) is used, the cursor doesn't move to start
    -- Doesn't yet support dot repeat and undos 
    "gbprod/stay-in-place.nvim",
    config = function()
      require("stay-in-place").setup({
        {
          set_keymaps = true, -- Keymaps are automatically settled
          preserve_visual_selection = true, -- Keep selection when indenting
        }
      })
    end
  },
  {
    'declancm/maximize.nvim',
    config = function()
      require('maximize').setup()

      vim.keymap.set({'n', 'x'}, '<C-w>m', require('maximize').toggle, {desc = 'Toggle window maximize'})
    end
  },
}
