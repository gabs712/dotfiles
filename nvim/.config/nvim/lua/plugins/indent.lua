return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
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
    keys = {
      {
        '[i',
        function()
          require('mini.indentscope').operator('top', true)
        end,
        desc = 'Go to indent scope top',
        mode = { 'n', 'x', 'o' },
      },
      {
        ']i',
        function()
          require('mini.indentscope').operator('bottom', true)
        end,
        desc = 'Go to indent scope bottom',
        mode = { 'n', 'x', 'o' },
      },
      {
        'ii',
        function()
          require('mini.indentscope').textobject(false)
        end,
        mode = { 'x', 'o' },
        desc = 'Object scope',
      },
      {
        'ai',
        function()
          require('mini.indentscope').textobject(true)
        end,
        desc = 'Object scope with border',
        mode = { 'x', 'o' },
      },
    },
    config = function()
      vim.g.miniindentscope_disable = true -- Disable indent highlight

      require('mini.indentscope').setup({
        options = {
          try_as_border = true, -- When in indent border selects it's children instead of parent
          indent_at_cursor = false, -- Selects based on cursor column
        },
        mappings = {
          object_scope = '',
          object_scope_with_border = '',
          goto_top = '',
          goto_bottom = '',
        },
      })
    end,
  },
}
