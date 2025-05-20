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

      'hrsh7th/nvim-cmp', -- Completion for commands and mentions
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'Avante' },
          anti_conceal = {
            enabled = false, -- Shows chars original appearence on current line
          },
          win_options = {
            concealcursor = {
              rendered = 'nic', -- Conceal raw markdown chars on current line in given modes
            },
          },
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
        hints = { enabled = false }, -- Virtual text on visual mode
        windows = {
          sidebar_header = {
            enabled = true,
            align = 'right', -- left, center, right for title
          },
          position = 'right',
          wrap = true,
          width = 50,
          input = {
            prefix = '> ',
            height = 8,
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

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'AvanteConfirm',
        callback = function()
          vim.keymap.set('n', '<Esc>', 'n', { buffer = true, remap = true })
          vim.keymap.set('n', '<C-j>', 'y', { buffer = true, remap = true })
        end,
      })
    end,
  },
}
