return {
  enabled = true,
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Source for lsp
    'hrsh7th/cmp-buffer', -- Source for text written in buffer
    'hrsh7th/cmp-path', -- Source for paths
    'hrsh7th/cmp-cmdline', -- Source for cmdline
    'rcarriga/cmp-dap', -- Source for DAP

    'L3MON4D3/LuaSnip', -- Engine responsable for snippets
    'saadparwaiz1/cmp_luasnip', -- Source for snippets

    'onsails/lspkind.nvim', -- Icons
    { 'luckasRanarison/tailwind-tools.nvim', name = 'tailwind-tools' }, -- Color icons
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    -- Max completion height
    vim.opt.pumheight = 15

    -- Global config
    cmp.setup({
      enabled = function()
        return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()
      end,

      -- Sources from higher to lower priority
      sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      formatting = {
        fields = { 'kind', 'abbr', 'menu' }, -- kind, abbr, menu
        format = lspkind.cmp_format({
          mode = 'symbol',
          before = require('tailwind-tools.cmp').lspkind_format, -- Icons provided by tailwind-tools
          symbol_map = {
            Variable = '',
            Color = '', -- ██  󰝤    󱓻
            Constant = '',
            Value = '',
          },
        }),
      },
      sorting = {
        priority_weight = 2,
        comparators = require('custom.nvim-cmp.global_comparators'),
      },
      window = {
        completion = {
          col_offset = -1,
        },
      },
      view = {
        entries = {
          follow_cursor = false,
        },
        docs = {
          auto_open = false, -- Automatically show docs when highlighting
        },
      },
      snippet = {
        -- Engine to use when expanding snippets
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu', -- ',noselect' prevents from selecting automatically
        -- Don't trigger completion after spaces, particullarly useful when writting tailwind classes
        get_trigger_characters = function(chars)
          local new_chars = {}
          for _, char in ipairs(chars) do
            if char ~= ' ' then
              table.insert(new_chars, char)
            end
          end
          return new_chars
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.confirm({ select = true }),

        -- Show completion / toggle docs
        ['<C-Space>'] = cmp.mapping(function()
          if cmp.visible() then
            if cmp.visible_docs() then
              cmp.close_docs()
            else
              cmp.open_docs()
            end
            return
          end

          cmp.complete({
            config = {
              sources = {
                { name = 'nvim_lsp' },
              },
            },
          })
        end, { 'i', 'c' }),

        ['<C-c>'] = cmp.abort,
        ['<C-e>'] = cmp.close,

        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),

        ['<C-y>'] = cmp.config.disable,
      }),
    })

    -- Search config
    cmp.setup.cmdline({ '/', '?' }, {
      sources = {
        { name = 'buffer' },
      },
      formatting = {
        fields = { 'abbr' },
      },
      window = {
        completion = {
          col_offset = 0,
        },
      },
      view = {
        entries = {
          follow_cursor = false,
        },
      },
      completion = {
        completeopt = 'noselect',
      },
      mapping = cmp.mapping.preset.cmdline({
        ['<Tab>'] = cmp.config.disable,
        ['<C-n>'] = cmp.config.disable,
        ['<C-p>'] = cmp.config.disable,
        ['<C-e>'] = cmp.config.disable,
        ['<C-c>'] = cmp.config.disable,
      }),
    })

    -- Cmd mode config
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        {
          name = 'cmdline',
          option = {
            treat_trailing_slash = false, -- Adds slash at the end of paths
          },
        },
      }),
      formatting = {
        fields = { 'abbr' },
      },
      window = {
        completion = {
          col_offset = 0,
        },
      },
      view = {
        entries = {
          follow_cursor = false,
        },
      },
      completion = {
        completeopt = 'noselect',
        autocomplete = false,
      },
      mapping = cmp.mapping.preset.cmdline({
        ['<Tab>'] = cmp.config.disable,
        ['<C-n>'] = cmp.config.disable,
        ['<C-p>'] = cmp.config.disable,
        ['<C-e>'] = cmp.config.disable,
        ['<C-c>'] = cmp.config.disable,
      }),
    })

    -- Completion for DAP
    require('cmp').setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
      sources = {
        { name = 'dap' },
      },
      completion = {
        completeopt = 'noselect',
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping(function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', true)
        end),

        ['<C-c>'] = cmp.abort,

        ['<C-y>'] = cmp.config.disable,
      }),
    })

    require('custom.nvim-cmp.command-keys')

    cmp.setup.filetype('html', require('custom.nvim-cmp.html-config'))
    cmp.setup.filetype('css', require('custom.nvim-cmp.css-config'))
    cmp.setup.filetype({ 'javascriptreact', 'typescriptreact' }, require('custom.nvim-cmp.jsx-config'))
  end,
}
