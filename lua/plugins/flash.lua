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
            backdrop = false, -- Fade out text
          },
          -- Adds labels to f and t searches
          autohide = true,
          jump_labels = false, 
          jump = {
            -- ToDO plugin pra desligar comentarios, todo highlihgt
            autojump = true,
            register = true, -- see what this does
            nohlsearch = true,
          },
        }
      },
      jump = {
        register = true, -- see what this does
        nohlsearch = true,

      }
    })

    vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
    vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
  end
}

