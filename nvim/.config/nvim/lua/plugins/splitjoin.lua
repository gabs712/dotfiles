return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    { 'echasnovski/mini.splitjoin', version = '*' },
  },
  config = function()
    local treesj = require('treesj')
    local mini_splitjoin = require('mini.splitjoin')

    mini_splitjoin.setup({
      mappings = {
        toggle = 'gs', -- Sets it for n and v mode, overwritten on n later
      },
    })

    treesj.setup({
      use_default_keymaps = false,
      check_syntax_error = true, -- Doesn't act on syntax errors in favor of fallback
      notify = false,
      max_join_length = 9999999999999999999,

      -- Fallback config
      on_error = function()
        mini_splitjoin.toggle()
      end,
    })

    vim.keymap.set('n', 'gs', treesj.toggle, { desc = 'Split/join' })
  end,
}
