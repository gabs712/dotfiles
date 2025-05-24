return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Sources
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'rcarriga/cmp-dap',
    'jcha0713/cmp-tw2css', -- Tailwind on css

    'L3MON4D3/LuaSnip', -- Engine responsable for snippets
    'saadparwaiz1/cmp_luasnip', -- Source for snippets

    'onsails/lspkind.nvim', -- Icons
    { 'luckasRanarison/tailwind-tools.nvim', name = 'tailwind-tools' }, -- Color icons
  },
  config = function()
    local cmp = require('cmp')

    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    local completion_trigger = require('custom.nvim-cmp.completion_trigger')

    -- Max completion height
    vim.opt.pumheight = 15

    -- Global config
    cmp.setup({
      enabled = function()
        return (vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()) -- Recommended by cmp-dap
          and vim.fn.reg_recording() == '' -- Disable when recording macros
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
        completeopt = 'menu', -- 'noselect' prevents from selecting automatically
        -- Don't trigger completion after spaces or quotes, particullarly useful when writting tailwind classes
        get_trigger_characters = function(chars)
          local new_chars = {}
          for _, char in ipairs(chars) do
            if char ~= ' ' and char ~= "'" and char ~= '"' then
              table.insert(new_chars, char)
            end
          end
          return new_chars
        end,
      },
      mapping = cmp.mapping({
        ['<C-j>'] = cmp.mapping.confirm({ select = true }),

        -- Show completion / toggle docs
        ['<C-Space>'] = cmp.mapping(function()
          local current_sources = require('cmp.config').get().sources
          local filtered = {}

          for _, item in ipairs(current_sources) do
            if item.name ~= 'luasnip' and item.name ~= 'buffer' then
              table.insert(filtered, item)
            end
          end

          completion_trigger({ sources = filtered })
        end),

        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        ['<C-c>'] = cmp.mapping.abort(),

        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
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
    })

    require('custom.nvim-cmp.command_bindings')

    -- Custom completions
    require('custom.nvim-cmp.completion_init')
  end,
}
