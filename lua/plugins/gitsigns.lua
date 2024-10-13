return {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({
      -- Untracked files don't need to be refreshed when committed to be attached
      attach_to_untracked = true,
      signs = {
        untracked = { text = '' },
      },
    })

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- Repeatable hunk move
    local next_hunk, prev_hunk = ts_repeat_move.make_repeatable_move_pair(function()
      gitsigns.nav_hunk('next', { target = 'all' })
    end, function()
      gitsigns.nav_hunk('prev', { target = 'all' })
    end)

    vim.keymap.set({ 'n', 'x' }, '<leader>h', gitsigns.preview_hunk, { desc = 'Git preview hunk diff' })
    vim.keymap.set({ 'n', 'x' }, '<leader>H', gitsigns.reset_hunk, { desc = 'Git reset hunk' })

    vim.keymap.set({ 'n', 'x' }, '<leader>b', gitsigns.blame_line, { desc = 'Git preview blame' })
    vim.keymap.set({ 'n', 'x' }, '<leader>B', gitsigns.blame, { desc = 'Git all blames' })

    vim.keymap.set({ 'n', 'x' }, '<leader>g', gitsigns.stage_hunk, { desc = 'Git stage hunk' })
    vim.keymap.set({ 'n', 'x' }, '<leader>G', gitsigns.diffthis, { desc = 'Git diff' })

    vim.keymap.set('n', ']h', next_hunk, { desc = 'Git next hunk' })
    vim.keymap.set('n', '[h', prev_hunk, { desc = 'Git previous hunk' })

    vim.keymap.set('o', 'ah', gitsigns.select_hunk, { desc = 'Select hunk' })
    vim.keymap.set('o', 'ih', gitsigns.select_hunk, { desc = 'Select hunk' })

    -- Uses ':' in visual mode due to a bug (Only lines after cursor were being selected)
    vim.keymap.set('x', 'ah', ':Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
    vim.keymap.set('x', 'ih', ':Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
  end,
}
