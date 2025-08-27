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
      },
      {
        ']i',
        function()
          require('mini.indentscope').operator('bottom', true)
        end,
        desc = 'Go to indent scope bottom',
      },
      {
        '[i',
        function()
          require('mini.indentscope').operator('top')
        end,
        mode = 'x',
        desc = 'Go to indent scope top',
      },
      {
        ']i',
        function()
          require('mini.indentscope').operator('bottom')
        end,
        mode = 'x',
        desc = 'Go to indent scope bottom',
      },
      {
        'ii',
        function()
          require('mini.indentscope').textobject(false)
        end,
        mode = 'x',
        desc = 'Object scope',
      },
      {
        'ai',
        function()
          require('mini.indentscope').textobject(true)
        end,
        mode = 'x',
        desc = 'Object scope with border',
      },
      {
        '[i',
        function()
          require('mini.indentscope').operator('top')
        end,
        mode = 'o',
        desc = 'Go to indent scope top',
      },
      {
        ']i',
        function()
          require('mini.indentscope').operator('bottom')
        end,
        mode = 'o',
        desc = 'Go to indent scope bottom',
      },
      {
        'ii',
        function()
          require('mini.indentscope').textobject(false)
        end,
        mode = 'o',
        desc = 'Object scope',
      },
      {
        'ai',
        function()
          require('mini.indentscope').textobject(true)
        end,
        mode = 'o',
        desc = 'Object scope with border',
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
