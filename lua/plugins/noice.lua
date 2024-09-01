return {
  enabled = true,
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require('noice').setup({
      cmdline = {
        view = "cmdline", -- cmdline, cmdline_popup
        format = {
          -- cmdline = false,
          -- search_down = false,

          -- Change search icon
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" }, --  
          lua = false,
          help = false,
          filter = false, -- ! (bang)
        }
      }, 
      messages = {
        view_search = false,
      }
    })

    require("telescope").load_extension("noice")
    vim.keymap.set('n', '<leader>fn', '<cmd>Noice telescope<CR>')
  end
}
