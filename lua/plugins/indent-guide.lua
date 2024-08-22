return {
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
        },
        scope = {
          -- Set to true to use hightlight based on scope
          enabled = false,
          show_start = false,
          show_end = false,
        }
      })
    end
  },
  {
    -- Adds highlight based on current position
    'echasnovski/mini.indentscope',
    enabled = true,
    version = '*',
    config = function()
      require('mini.indentscope').setup({
        symbol = '▏',
        draw = {
          animation = require('mini.indentscope').gen_animation.none()
        }
      })
    end
  }
}

