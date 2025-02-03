return {
  enabled = true,
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Source for lsp
    'hrsh7th/cmp-buffer', -- Source for text written in buffer
    'hrsh7th/cmp-path', -- Source for paths
    'hrsh7th/cmp-cmdline', -- Source for cmdline

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

          cmp.complete()
        end, { 'i', 'c' }),

        ['<C-c>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),

        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),

        -- Prevent from interfering with default behavior
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.config.disable,
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
        ['<Tab>'] = require('custom.nvim-cmp.tab').search,
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
        ['<Tab>'] = require('custom.nvim-cmp.tab').cmd,
        ['<C-e>'] = cmp.config.disable,
      }),
    })

    cmp.setup.filetype('html', require('custom.nvim-cmp.html-config'))
    cmp.setup.filetype('css', require('custom.nvim-cmp.css-config'))
    cmp.setup.filetype({ 'javascriptreact', 'typescriptreact' }, require('custom.nvim-cmp.jsx-config'))
  end,
}
