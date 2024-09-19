return {
  enabled = true,
  "hrsh7th/nvim-cmp",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Source for lsp
    "hrsh7th/cmp-buffer", -- Source for text written in buffer
    "hrsh7th/cmp-path", -- Source for paths
    'hrsh7th/cmp-cmdline', -- Source for cmdline

    "L3MON4D3/LuaSnip", -- Engine responsable for snippets
    "saadparwaiz1/cmp_luasnip", -- Source for snippets
    "rafamadriz/friendly-snippets", -- Extra snippets

    "onsails/lspkind.nvim", -- Icons
  },
  config = function()
    -- Loads snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Global config
    cmp.setup({
      -- Sources from higher to lower priority
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      completion = {
        completeopt = "menu",
      },
      view = {
        docs = {
          auto_open = false, -- Automatically show docs when highlighting
        }
      },
      formatting = {
        -- Adds icons
        format = lspkind.cmp_format({
          mode = 'symbol_text', -- 'text', 'text_symbol', 'symbol_text', 'symbol'
          symbol_map = {
            Variable = '' -- 󰀫
          },
          maxwidth = 50,
        }),
      },
      snippet = {
        -- Engine to use when expanding snippets
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Selects first option when confirming if select equals true
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- C-j is also being remaped to it

        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ["<C-c>"] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),

        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),

        -- Prevent from interfering with default behavior
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.config.disable,

        -- Next snippet position
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        -- Previous snippet position
        ['<C-k>'] = cmp.mapping(function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- Show docs (manual)
        ['<C-m>'] = function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end
      }),
    })

    -- Search config
    cmp.setup.cmdline({ '/', '?' }, {
      sources = {
        { name = 'buffer' }
      },
      completion = {
        completeopt = "noselect",
      },
      mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = require('custom.tab-completion').tab,
      }),
    })

    -- Cmd mode config
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' },
        {
          name = 'cmdline',
          option = {
            treat_trailing_slash = false, -- Adds slash at the end of paths
          }
        },
      }),
      completion = {
        completeopt = "noselect",
        autocomplete = false,
      },
      mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = require('custom.tab-completion').tab_confirm,
        ["<C-e>"] = cmp.config.disable,
      }),
    })
  end
}

