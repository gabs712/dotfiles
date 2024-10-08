return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'tsx',
        'lua',
        'javascript',
        'html',
        'css',
        'typescript',
        'vim',
        'vimdoc',
        'bash',
        'regex',
        'markdown',
        'markdown_inline',
        'yaml',
        'toml',
      },

      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Jump to next ocurrence if not inside any

          keymaps = {
            ['ra'] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },
            ['aa'] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            ['ia'] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            ['la'] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['mpn'] = { query = '@parameter.inner', desc = 'Move parameter next' },
            ['mfn'] = '@function.outer',
            ['mop'] = '@property.outer',
          },
          swap_previous = {
            ['mpp'] = '@parameter.inner',
            ['<leader>pm'] = '@function.outer',
            ['<leader>p:'] = '@property.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true,

          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = 'Next function call start' },
            [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = 'Next function call end' },
            [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    })

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- TODO: lua vim.diagnostic.jump({count = -1}) and hunk
    -- Repeat textobject moves
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
