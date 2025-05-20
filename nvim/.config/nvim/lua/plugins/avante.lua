return {
  {
    'yetone/avante.nvim',
    version = false,
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',

      -- Optional
      'hrsh7th/nvim-cmp', -- Completion for commands and mentions
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'Avante' },
        },
        ft = { 'Avante' },
      },
    },
    config = function()
      require('avante').setup({
        provider = 'gemini',
        behaviour = {
          enable_token_counting = true,
        },
        hints = { enabled = false }, -- Virtual text
        windows = {
          sidebar_header = {
            enabled = false, -- true, false to enable/disable the header
          },
          position = 'right',
          wrap = true,
          width = 30,
          input = {
            prefix = '> ',
          },
          ask = {
            start_insert = false,
          },
        },
        mappings = {
          submit = {
            normal = '<C-s>',
            insert = '<C-s>',
          },
        },
      })

      vim.keymap.set({ 'n', 'x' }, '<leader>w', '<cmd>AvanteToggle<CR>')
    end,
  },
}
