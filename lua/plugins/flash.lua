return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require('flash').setup({
      search = {
        multi_window = true,
        exclude = {
          "notify",
          "cmp_menu",
          "noice",
          "flash_prompt",
          function(win)
            -- exclude non-focusable windows
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      highlight = {
        backdrop = true, -- When searching, fade out text
        matches = true, -- Highlights text as you type
        groups = {
          current = 'FlashMatch', -- Does not show different color to first match
        },
      },
      modes = {
        char = {
          highlight = {
            backdrop = false, -- Fade out text with f/t
          },
        },
      },
    })

    vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
  end
}

