return {
  -- Whenever y is used, the cursor doesn't move to start
  "svban/YankAssassin.nvim",
  config = function()
    require("YankAssassin").setup {
      auto_normal = true, 
      auto_visual = true,
    }
  end,
}
