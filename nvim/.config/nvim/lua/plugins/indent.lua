return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup({
        indent = {
          char = '▏',
          tab_char = '▏', -- Still show indent guides if indent is a tab
        },
        scope = {
          enabled = false,
        },
        exclude = {
          filetypes = {
            'undotree',
            'harpoon',
            'neo-tree',
            'trouble',
            'text',
            'markdown',
            'oil',
          },
        },
      })
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      vim.g.miniindentscope_disable = true -- Disable indent highlight

      require('mini.indentscope').setup({
        options = {
          try_as_border = true, -- When in indent border selects it's children instead of parent
          indent_at_cursor = false, -- Selects based on cursor column
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
    end,
  },
}
