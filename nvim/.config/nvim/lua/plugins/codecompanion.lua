return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'codecompanion' },
      config = require('custom.codecompanion.render-markdown'),
    },
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'ravitemer/codecompanion-history.nvim',
    'echasnovski/mini.diff',
  },
  config = function()
    local codecompanion = require('codecompanion')
    local utils = require('custom.codecompanion.utils')

    local window = utils.floating_window({
      width = 105,
      height = 36,
      padding_x = 7,
      padding_y = 4,
    })

    codecompanion.setup({
      display = {
        chat = {
          auto_scroll = true,
          start_in_insert_mode = false,
          intro_message = '',
          show_settings = false,
          show_token_count = true,
          show_references = true, -- Slash commands and variables

          window = {
            title = '',
            layout = 'float',

            border = 'rounded',
            relative = 'editor',
            row = window.row,
            col = window.col,
            width = window.width,
            height = window.height,
            opts = {
              scrolloff = 17,
              number = false,
              relativenumber = false,
            },
          },
        },
        diff = {
          provider = 'mini_diff',
        },
      },
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return 'CodeCompanion (' .. adapter.formatted_name .. ')'
            end,
            user = 'Me',
          },
          keymaps = {
            send = {
              callback = function(chat)
                -- vim.cmd has buggy behavior here, therefore using nvim_feedkeys
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>m'", true, false, true), 'n', false)
                chat:submit()
              end,
            },
            regenerate = {
              callback = function(chat)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>m'", true, false, true), 'n', false)
                chat:regenerate()
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
            },
            system_prompt = {
              modes = {
                n = 'gT',
              },
            },
            goto_file_under_cursor = {
              modes = {
                n = { 'gf', 'gF' },
              },
              description = 'Open the file under cursor',
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
            previous_header = {
              modes = {
                n = '<C-k>',
              },
              callback = function()
                utils.nav_heading('prev')
              end,
              description = 'Go to prev header',
            },
            next_header = {
              modes = {
                n = '<C-j>',
              },
              callback = function()
                utils.nav_heading('next')
              end,
              description = 'Go to next header',
            },
            goto_input = {
              modes = {
                n = { '<C-l>', 'G' },
              },
              callback = function()
                vim.cmd('normal! Gzb$')
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
      opts = {
        goto_file_action = function(fname)
          vim.cmd('close')
          vim.cmd('edit ' .. fname)
        end,
      },
      extensions = {
        history = {
          opts = {
            expiration_days = 30,
            continue_last_chat = true,

            auto_save = true,
            delete_on_clearing_chat = false,

            keymap = '<C-f>',
            save_chat_keymap = 'gH',
          },
        },
      },
    })

    local diff = require('mini.diff')
    diff.setup({
      source = diff.gen_source.none(),
      view = {
        style = 'sign',
        signs = { add = '▒', change = '▒', delete = '▒' },
      },
      mappings = {
        apply = '',
        reset = '',
        textobject = '',
        goto_first = '',
        goto_prev = '',
        goto_next = '',
        goto_last = '',
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

    local toggle_binding = '<leader>a'
    vim.keymap.set('n', toggle_binding, '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'Open AI chat' })
    vim.keymap.set('x', toggle_binding, ':CodeCompanionChat Add<CR>', { desc = 'Add selection to AI chat' })

    vim.keymap.set({ 'n', 'x' }, '<leader>A', ':CodeCompanion<CR>', { desc = 'Act with AI (edit/ask)' })

    vim.api.nvim_create_user_command('AI', function(opts)
      vim.cmd('CodeCompanionCmd ' .. table.concat(opts.fargs, ' '))
    end, { nargs = '*' })
  end,
}
