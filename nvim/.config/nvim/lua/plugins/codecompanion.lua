return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'codecompanion' },
        anti_conceal = {
          enabled = false, -- Shows chars original appearence on current line
        },
        win_options = {
          concealcursor = {
            rendered = 'nic', -- Conceals raw markdown chars on current line
          },
        },
      },
      ft = { 'codecompanion' },
    },
  },
  config = function()
    require('codecompanion').setup()

    vim.keymap.set('n', '<leader>w', '<cmd>CodeCompanionChat Toggle<CR>')
  end,
}
