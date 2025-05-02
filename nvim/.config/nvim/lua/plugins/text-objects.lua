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
            ['iv'] = { query = '@assignment.rhs', desc = 'Select inside (right) variable' },
            ['av'] = { query = '@assignment.lhs', desc = 'Select around (left) variable' },

            ['if'] = { query = '@function.inner', desc = 'Select inside function' },
            ['af'] = { query = '@function.outer', desc = 'Select around function' },

            ['im'] = { query = '@call.inner', desc = 'Select inside function call (method)' },
            ['am'] = { query = '@call.outer', desc = 'Select around function call (method)' },

            ['il'] = { query = '@loop.inner', desc = 'Select inside loop' },
            ['al'] = { query = '@loop.outer', desc = 'Select around loop' },

            ['ix'] = { query = '@conditional.inner', desc = 'Select inside conditional' },
            ['ax'] = { query = '@conditional.outer', desc = 'Select around conditional' },

            ['io'] = { query = '@class.inner', desc = 'Select inside class (object)' },
            ['ao'] = { query = '@class.outer', desc = 'Select around class (object)' },

            ['ia'] = { query = '@parameter.inner', desc = 'Select inside argument or parameter' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select around argument or parameter' },

            ['ic'] = { query = '@comment.outer', desc = 'Select inside comment' }, -- @comment.inner not implemented for most languages
            ['ac'] = { query = '@comment.outer', desc = 'Select around comment' },

            ['it'] = { query = '@statement.inner', desc = 'Select inside statement' }, -- Usually doesn't work
            ['at'] = { query = '@statement.outer', desc = 'Select around statement' },

            ['an'] = { query = '@number.inner', desc = 'Select number' },
            ['in'] = { query = '@number.inner', desc = 'Select number' },
          },
        },
        swap = {
          enable = true,
          swap_previous = {
            ['Hv'] = { query = '@assignment.outer', desc = 'Swap variable with previous' },
            ['Hf'] = { query = '@function.outer', desc = 'Swap function with previous' },
            ['Hm'] = { query = '@call.outer', desc = 'Swap function call (method) with previous' },
            ['Hl'] = { query = '@loop.outer', desc = 'Swap loop with previous' },
            ['Hx'] = { query = '@conditional.outer', desc = 'Swap conditional with previous' },
            ['Ho'] = { query = '@class.outer', desc = 'Swap class (object) with previous' },
            ['Ha'] = { query = '@parameter.inner', desc = 'Swap argument with previous' },
            ['Hc'] = { query = '@comment.outer', desc = 'Swap comment with previous' },
            ['Ht'] = { query = '@statement.outer', desc = 'Swap statement with previous' },
            ['Hn'] = { query = '@number.inner', desc = 'Swap number with previous' },
          },
          swap_next = {
            ['Lv'] = { query = '@assignment.outer', desc = 'Swap variable with next' },
            ['Lf'] = { query = '@function.outer', desc = 'Swap function with next' },
            ['Lm'] = { query = '@call.outer', desc = 'Swap function call (method) with next' },
            ['Ll'] = { query = '@loop.outer', desc = 'Swap loop with next' },
            ['Lx'] = { query = '@conditional.outer', desc = 'Swap conditional with next' },
            ['Lo'] = { query = '@class.outer', desc = 'Swap class (object) with next' },
            ['La'] = { query = '@parameter.inner', desc = 'Swap argument with next' },
            ['Lc'] = { query = '@comment.outer', desc = 'Swap comment with next' },
            ['Lt'] = { query = '@statement.outer', desc = 'Swap statement with next' },
            ['Ln'] = { query = '@number.inner', desc = 'Swap number with next' },
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
            [']x'] = { query = '@conditional.outer', desc = 'Next conditional' },
            [']o'] = { query = '@class.outer', desc = 'Next class (object)' },
            [']a'] = { query = '@parameter.inner', desc = 'Next argument or parameter' },
            [']c'] = { query = '@comment.outer', desc = 'Next comment' },
            [']t'] = { query = '@statement.outer', desc = 'Next statement' },
            [']n'] = { query = '@number.inner', desc = 'Next number' },
          },
          goto_next_end = {
            [']V'] = { query = '@assignment.outer', desc = 'Next variable on end' },
            [']F'] = { query = '@function.outer', desc = 'Next function on end' },
            [']M'] = { query = '@call.outer', desc = 'Next function call (method) on end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop on end' },
            [']X'] = { query = '@conditional.outer', desc = 'Next conditional on end' },
            [']O'] = { query = '@class.outer', desc = 'Next class (object) on end' },
            [']A'] = { query = '@parameter.inner', desc = 'Next argument or parameter on end' },
            [']C'] = { query = '@comment.outer', desc = 'Next comment on end' },
            [']T'] = { query = '@statement.outer', desc = 'Next statement on end' },
            [']N'] = { query = '@number.inner', desc = 'Next number on end' },
          },
          goto_previous_start = {
            ['[v'] = { query = '@assignment.outer', desc = 'Previous variable' },
            ['[f'] = { query = '@function.outer', desc = 'Previous function' },
            ['[m'] = { query = '@call.outer', desc = 'Previous function call (method)' },
            ['[l'] = { query = '@loop.outer', desc = 'Previous loop' },
            ['[x'] = { query = '@conditional.outer', desc = 'Previous conditional' },
            ['[o'] = { query = '@class.outer', desc = 'Previous class (object)' },
            ['[a'] = { query = '@parameter.inner', desc = 'Previous argument or parameter' },
            ['[c'] = { query = '@comment.outer', desc = 'Previous comment' },
            ['[t'] = { query = '@statement.outer', desc = 'Previous statement' },
            ['[n'] = { query = '@number.inner', desc = 'Previous number' },
          },
          goto_previous_end = {
            ['[V'] = { query = '@assignment.outer', desc = 'Previous variable on end' },
            ['[F'] = { query = '@function.outer', desc = 'Previous function on end' },
            ['[M'] = { query = '@call.outer', desc = 'Previous function call (method) on end' },
            ['[L'] = { query = '@loop.outer', desc = 'Previous loop on end' },
            ['[X'] = { query = '@conditional.outer', desc = 'Previous conditional on end' },
            ['[O'] = { query = '@class.outer', desc = 'Previous class (object) on end' },
            ['[A'] = { query = '@parameter.inner', desc = 'Previous argument or parameter on end' },
            ['[C'] = { query = '@comment.outer', desc = 'Previous comment on end' },
            ['[T'] = { query = '@statement.outer', desc = 'Previous statement on end' },
            ['[N'] = { query = '@number.inner', desc = 'Next number on end' },
          },
        },
      },
    })
    -- Clear swap keys
    vim.keymap.set('n', 'H', '<Nop>')
    vim.keymap.set('n', 'L', '<Nop>')

    local various = require('various-textobjs')
    require('various-textobjs').setup({
      textobjs = {
        subword = {
          -- When deleting start of camelCase, changes remaining uppercase to lowercase
          noCamelToPascalCase = false,
        },
      },
      notify = {
        whenObjectNotFound = false,
      },
    })

    -- camelCase, snake_case, kebab-case
    vim.keymap.set({ 'x', 'o' }, 'is', function()
      various.subword('inner')
    end, { desc = 'Select inside subword' })

    vim.keymap.set({ 'x', 'o' }, 'as', function()
      various.subword('outer')
    end, { desc = 'Select around subword' })

    vim.keymap.set({ 'x', 'o' }, 'id', various.entireBuffer, { desc = 'Select entire document' })
    vim.keymap.set({ 'x', 'o' }, 'ad', various.entireBuffer, { desc = 'Select entire document' })

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
      local count = vim.v.count > 0 and vim.v.count or 1
      vim.diagnostic.jump({ count = count })
    end, function()
      local count = vim.v.count > 0 and vim.v.count or 1
      vim.diagnostic.jump({ count = -count })
    end)

    vim.keymap.set({ 'n', 'x', 'o' }, ']d', next_diagnostic, { desc = 'Next diagnostic' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[d', prev_diagnostic, { desc = 'Previous diagnostic' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']D', next_diagnostic, { desc = 'Next diagnostic' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[D', prev_diagnostic, { desc = 'Previous diagnostic' })

    -- Quickfix
    local next_quickfix, prev_quickfix = ts_repeat_move.make_repeatable_move_pair(function()
      local count = vim.v.count > 0 and vim.v.count or 1
      vim.cmd('cnext ' .. count)
    end, function()
      local count = vim.v.count > 0 and vim.v.count or 1
      vim.cmd('cprev ' .. count)
    end)

    vim.keymap.set({ 'n', 'x', 'o' }, ']q', next_quickfix, { desc = 'Next quickfix ' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[q', prev_quickfix, { desc = 'Previous Quickfix' })
  end,
}
