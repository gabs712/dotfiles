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
    version = '*',
    config = function()
      require('mini.indentscope').setup({
        symbol = '▏',
        draw = {
          animation = require('mini.indentscope').gen_animation.none(),
        },
        options = {
          -- Highlight selected parent children
          try_as_border = true,
          -- Highlight at cursor column
          indent_at_cursor = false,
        },
        mappings = {
          -- Textobjects
          object_scope = 'ii',
          object_scope_with_border = 'ai',

          -- Motions (jump to respective border line)
          goto_top = '[i',
          goto_bottom = ']i',
        },
      })
    end
  }
}

