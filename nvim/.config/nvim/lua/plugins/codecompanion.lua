return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    { 'MeanderingProgrammer/render-markdown.nvim', config = require('custom.codecompanion.render-markdown') },
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return 'CodeCompanion (' .. adapter.formatted_name .. ')'
            end,
            user = 'Me',
          },
        },
      },
      display = {
        chat = {
          auto_scroll = true,
          start_in_insert_mode = false,
          intro_message = '',
          show_settings = false,
          show_token_count = true,
          show_references = true, -- slash commands and variables

          window = {
            width = 0.60,
            opts = {
              number = false,
              relativenumber = false,
            },
          },
        },
      },
    })

    require('cmp').setup.filetype('codecompanion', {
      sources = {
        { name = 'codecompanion_models' },
        { name = 'codecompanion_slash_commands' },
        { name = 'codecompanion_tools' },
        { name = 'codecompanion_variables' },
      },
    })

    vim.keymap.set('n', '<leader>w', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'AI chat toggle' })
    vim.keymap.set('x', '<leader>w', '<cmd>CodeCompanionChat Add<CR>', { desc = 'Add selection to AI chat' })
    vim.keymap.set({ 'n', 'x' }, '<leader>W', '<cmd>CodeCompanionActions<CR>', { desc = 'AI menu' })

    vim.keymap.set({ 'n', 'x' }, '<leader>a', ':CodeCompanion<CR>', { desc = 'Act with AI (edit/ask)' }) -- TODO: Check if ':' is the only way to select with it and prompt commands

    vim.api.nvim_create_user_command('AI', function(opts)
      vim.cmd('CodeCompanionCmd ' .. table.concat(opts.fargs, ' '))
    end, { nargs = '*' })
  end,
}
