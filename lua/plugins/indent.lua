local ignore_filetypes = {
  '\'\'',
  'aerial',
  'better_term',
  'checkhealth',
  'dashboard',
  'gitcommit',
  'harpoon',
  'help',
  'lazy',
  'leetcode.nvim',
  'lspinfo',
  'man',
  'markdown',
  'mason',
  'neo-tree',
  'neo-tree-popup',
  'neogitstatus',
  'notify',
  'NvimTree',
  'packer',
  'startify',
  'TelescopePrompt',
  'TelescopeResults',
  'themery',
  'toggleterm',
  'trouble',
  'Trouble',
  'text',
}

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = '▏',
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
    -- IMPORTANT: To change highlight while keeping keymaps, toggle between autocmd and miniindentscope_disable
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      require('mini.indentscope').setup({
        symbol = '▏',
        draw = {
          animation = require('mini.indentscope').gen_animation.none(),
        },
        options = {
          -- Focus selected parent children
          try_as_border = true,
          -- Focus at cursor column
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

      --

      -- vim.api.nvim_create_autocmd("FileType", {
      --   desc = "Disable indentscope for certain filetypes",
      --   pattern = ignore_filetypes,
      --   callback = function()
      --     vim.b.miniindentscope_disable = true
      --   end,
      -- })

      vim.g.miniindentscope_disable = true
    end
  }
}

