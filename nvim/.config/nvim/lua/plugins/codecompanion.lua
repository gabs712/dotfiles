return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    { 'MeanderingProgrammer/render-markdown.nvim', config = require('custom.codecompanion.render-markdown') },
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local codecompanion = require('codecompanion')
    local floating_window = require('custom.codecompanion.floating_window')
    local utils = require('custom.codecompanion.utils')

    codecompanion.setup({
      display = {
        chat = {
          auto_scroll = true,
          start_in_insert_mode = false,
          intro_message = '',
          show_settings = false,
          show_token_count = true,
          show_references = true, -- slash commands and variables

          window = {
            title = '',
            layout = 'float',

            border = 'rounded',
            relative = 'editor',
            row = floating_window.col,
            col = floating_window.row,
            width = floating_window.width,
            height = floating_window.height,
            opts = {
              scrolloff = 15,
              number = false,
              relativenumber = false,
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = os.getenv('AI_PROVIDER') or nil,
          roles = {
            llm = function(adapter)
              return 'CodeCompanion (' .. adapter.formatted_name .. ')'
            end,
            user = 'Me',
          },
          keymaps = {
            send = {
              callback = function(chat)
                vim.cmd('stopinsert')
                chat:submit()
              end,
            },
            close = {
              modes = {
                n = '<Esc>',
                i = '<Nop>',
              },
              callback = function()
                vim.cmd('close')
              end,
            },
            clear = {
              modes = {
                n = '<C-e>',
              },
            },
            options = {
              modes = {
                n = 'g?',
              },
              callback = 'keymaps.options',
            },
            stop = {
              modes = {
                n = '<C-c>',
              },
            },
            pin = {
              modes = {
                n = 'gW',
              },
            },
            next_chat = {
              modes = {
                n = 'g]',
              },
            },
            previous_chat = {
              modes = {
                n = 'g[',
              },
            },
            codeblock = {
              modes = {
                n = 'gl',
              },
            },
            fold_code = {
              modes = {
                n = 'gL',
              },
            },
            auto_tool_mode = {
              modes = {
                n = 'gt',
              },
              callback = 'keymaps.auto_tool_mode',
            },
            system_prompt = {
              modes = {
                n = 'gT',
              },
              callback = 'keymaps.toggle_system_prompt',
            },
            clear_highlights = {
              modes = {
                n = '<C-h>',
              },
              callback = function()
                vim.cmd('nohlsearch')
              end,
              description = 'Clear highlights',
            },
            next_header = {
              modes = {
                n = '<C-j>',
              },
              callback = function()
                utils.nav_heading('next')
              end,
            },
            previous_header = {
              modes = {
                n = '<C-k>',
              },
              callback = function()
                utils.nav_heading('prev')
              end,
            },
            goto_input = {
              modes = {
                n = '<C-l>',
              },
              callback = function()
                vim.cmd('normal! G0')
              end,
              description = 'Go to input',
            },
          },
        },
        inline = {
          keymaps = {
            reject_change = {
              modes = {
                n = '<leader>[',
              },
            },
            accept_change = {
              modes = {
                n = '<leader>]',
              },
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

    vim.keymap.set('n', '<leader>w', codecompanion.toggle, { desc = 'AI chat toggle' })
    vim.keymap.set('x', '<leader>w', '<cmd>CodeCompanionChat Add<CR>', { desc = 'Add selection to AI chat' })
    vim.keymap.set({ 'n', 'x' }, '<leader>W', '<cmd>CodeCompanionActions<CR>', { desc = 'AI menu' })

    vim.keymap.set({ 'n', 'x' }, '<leader>a', ':CodeCompanion<CR>', { desc = 'Act with AI (edit/ask)' }) -- TODO: Check if ':' is the only way to select with it and prompt commands

    vim.api.nvim_create_user_command('AI', function(opts)
      vim.cmd('CodeCompanionCmd ' .. table.concat(opts.fargs, ' '))
    end, { nargs = '*' })
  end,
}
