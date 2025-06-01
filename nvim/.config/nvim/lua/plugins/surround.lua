return {
  'kylechui/nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup({
      -- Swap open and closing pairs bindings for whitepaces
      surrounds = {
        [')'] = {
          add = { '( ', ' )' },
          delete = '^(. ?)().-( ?.)()$',
        },
        ['('] = {
          add = { '(', ')' },
          delete = '^(.)().-(.)()$',
        },
        ['}'] = {
          add = { '{ ', ' }' },
          delete = '^(. ?)().-( ?.)()$',
        },
        ['{'] = {
          add = { '{', '}' },
          delete = '^(.)().-(.)()$',
        },
        ['>'] = {
          add = { '< ', ' >' },
          delete = '^(. ?)().-( ?.)()$',
        },
        ['<'] = {
          add = { '<', '>' },
          delete = '^(.)().-(.)()$',
        },
        [']'] = {
          add = { '[ ', ' ]' },
          delete = '^(. ?)().-( ?.)()$',
        },
        ['['] = {
          add = { '[', ']' },
          delete = '^(.)().-(.)()$',
        },
      },
      aliases = {
        ['a'] = '<',
        ['b'] = '(',
        ['B'] = '{',
        ['r'] = '[',
        ['q'] = { '"', "'", '`' },
        ['s'] = { '{', '[', '(', '<', '"', "'", '`' },
      },

      move_cursor = 'sticky',
      keymaps = {
        -- Autopairs
        insert = false,
        insert_line = false,

        -- Sufixed with 'line' also indents
        normal = '\\',
        normal_cur = '\\\\',
        visual = '\\',
        normal_line = '|',
        normal_cur_line = '||',
        visual_line = '|',
        delete = '\\d',
        change = '\\c',
        change_line = '|c',
      },
    })
  end,
}
