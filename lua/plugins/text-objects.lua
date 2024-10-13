return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'chrisgrieser/nvim-various-textobjs', -- Extra text-objects
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Jump to next ocurrence if not inside any

          keymaps = {
            ['iv'] = { query = '@assignment.inner', desc = 'Select inside variable' },
            ['av'] = { query = '@assignment.outer', desc = 'Select around variable' },

            ['if'] = { query = '@function.inner', desc = 'Select inside function' },
            ['af'] = { query = '@function.outer', desc = 'Select around function' },

            ['im'] = { query = '@call.inner', desc = 'Select inside function call (method)' },
            ['am'] = { query = '@call.outer', desc = 'Select around function call (method)' },

            ['il'] = { query = '@loop.inner', desc = 'Select inside loop' },
            ['al'] = { query = '@loop.outer', desc = 'Select around loop' },

            ['ii'] = { query = '@conditional.inner', desc = 'Select inside conditional (if)' },
            ['ai'] = { query = '@conditional.outer', desc = 'Select around conditional (if)' },

            ['io'] = { query = '@class.inner', desc = 'Select inside class (object)' },
            ['ao'] = { query = '@class.outer', desc = 'Select around class (object)' },

            ['ia'] = { query = '@parameter.inner', desc = 'Select inside argument or parameter' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select around argument or parameter' },

            ['ic'] = { query = '@comment.outer', desc = 'Select inside comment' }, -- @comment.inner not implemented for most languages
            ['ac'] = { query = '@comment.outer', desc = 'Select around comment' },
          },
        },
        swap = {
          enable = true,
          swap_previous = {
            ['<C-,>v'] = { query = '@assignment.outer', desc = 'Swap variable with previous' },
            ['<C-,>f'] = { query = '@function.outer', desc = 'Swap function with previous' },
            -- ['<C-,>m'] = { query = '@call.outer', desc = 'Swap function call (method) with previous' }, -- Doesn't behave as expected
            ['<C-,>l'] = { query = '@loop.outer', desc = 'Swap loop with previous' },
            ['<C-,>i'] = { query = '@conditional.outer', desc = 'Swap conditional (if) with previous' },
            ['<C-,>o'] = { query = '@class.outer', desc = 'Swap class (object) with previous' },
            ['<C-,>a'] = { query = '@parameter.inner', desc = 'Swap argument with previous' },
            ['<C-,>c'] = { query = '@comment.outer', desc = 'Swap comment with previous' },
          },
          swap_next = {
            ['<C-;>v'] = { query = '@assignment.outer', desc = 'Swap variable with next' },
            ['<C-;>f'] = { query = '@function.outer', desc = 'Swap function with next' },
            -- ['<C-,>m'] = { query = '@call.outer', desc = 'Swap function call (method) with next' },
            ['<C-;>l'] = { query = '@loop.outer', desc = 'Swap loop with next' },
            ['<C-;>i'] = { query = '@conditional.outer', desc = 'Swap conditional (if) with next' },
            ['<C-;>o'] = { query = '@class.outer', desc = 'Swap class (object) with next' },
            ['<C-;>a'] = { query = '@parameter.inner', desc = 'Swap argument with next' },
            ['<C-;>c'] = { query = '@comment.outer', desc = 'Swap comment with next' },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- Add to jump list

          goto_next_start = {
            [']v'] = { query = '@assignment.outer', desc = 'Next variable' },
            [']f'] = { query = '@function.outer', desc = 'Next function' },
            [']m'] = { query = '@call.outer', desc = 'Next function call (method)' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional (if)' },
            [']o'] = { query = '@class.outer', desc = 'Next class (object)' },
            [']a'] = { query = '@parameter.inner', desc = 'Next argument or parameter' },
            [']c'] = { query = '@comment.outer', desc = 'Next comment' },
          },
          goto_next_end = {
            [']V'] = { query = '@assignment.outer', desc = 'Next variable on end' },
            [']F'] = { query = '@function.outer', desc = 'Next function on end' },
            [']M'] = { query = '@call.outer', desc = 'Next function call (method) on end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop on end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional (if) on end' },
            [']O'] = { query = '@class.outer', desc = 'Next class (object) on end' },
            [']A'] = { query = '@parameter.inner', desc = 'Next argument or parameter on end' },
            [']C'] = { query = '@comment.outer', desc = 'Next comment on end' },
          },
          goto_previous_start = {
            ['[v'] = { query = '@assignment.outer', desc = 'Previous variable' },
            ['[f'] = { query = '@function.outer', desc = 'Previous function' },
            ['[m'] = { query = '@call.outer', desc = 'Previous function call (method)' },
            ['[l'] = { query = '@loop.outer', desc = 'Previous loop' },
            ['[i'] = { query = '@conditional.outer', desc = 'Previous conditional (if)' },
            ['[o'] = { query = '@class.outer', desc = 'Previous class (object)' },
            ['[a'] = { query = '@parameter.inner', desc = 'Previous argument or parameter' },
            ['[c'] = { query = '@comment.outer', desc = 'Previous comment' },
          },
          goto_previous_end = {
            ['[V'] = { query = '@assignment.outer', desc = 'Previous variable on end' },
            ['[F'] = { query = '@function.outer', desc = 'Previous function on end' },
            ['[M'] = { query = '@call.outer', desc = 'Previous function call (method) on end' },
            ['[L'] = { query = '@loop.outer', desc = 'Previous loop on end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Previous conditional (if) on end' },
            ['[O'] = { query = '@class.outer', desc = 'Previous class (object) on end' },
            ['[A'] = { query = '@parameter.inner', desc = 'Previous argument or parameter on end' },
            ['[C'] = { query = '@comment.outer', desc = 'Previous comment on end' },
          },
        },
      },
    })
    vim.keymap.set({ 'x', 'o' }, 'id', require('various-textobjs').entireBuffer, { desc = 'Select entire document' })
    vim.keymap.set({ 'x', 'o' }, 'ad', require('various-textobjs').entireBuffer, { desc = 'Select entire document' })

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- Repeat textobject moves
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

    -- Repeatable diagnostic move
    local next_diagnostic, prev_diagnostic = ts_repeat_move.make_repeatable_move_pair(function()
      vim.diagnostic.jump({ count = 1 })
    end, function()
      vim.diagnostic.jump({ count = -1 })
    end)

    vim.keymap.set('n', ']d', next_diagnostic, { desc = 'Next diagnostic' })
    vim.keymap.set('n', '[d', prev_diagnostic, { desc = 'Previous diagnostic' })
  end,
}
