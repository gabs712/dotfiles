local ignore_filetypes = {
  '\'\'',
  'aerial',
  'better_term',
  'checkhealth',
  'dashboard',
  'gitcommit',
  'help',
  'lazy',
  'leetcode.nvim',
  'lspinfo',
  'man',
  'markdown',
  'mason',
  'neo-tree',
  'neogitstatus',
  'notify',
  'NvimTree',
  'packer',
  'startify',
  'TelescopePrompt',
  'TelescopeResults',
  'toggleterm',
  'trouble',
  'Trouble',
  'text',
}

local is_enabled = true
local char = '▏'

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    enabled = is_enabled,
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = char,
        },
        scope = {
          enabled = false,
        },
      })

      require("ibl").overwrite({
        exclude = {
          filetypes = ignore_filetypes
        }
      })
    end
  },
  {
    'echasnovski/mini.indentscope',
    enabled = is_enabled,
    version = '*',
    config = function()
      require('mini.indentscope').setup({
        symbol = char,
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

      vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable indentscope for certain filetypes",
      pattern = ignore_filetypes,
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    end
  }
}

