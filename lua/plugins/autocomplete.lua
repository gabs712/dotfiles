return {
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

    cmp.setup({
      -- Sources from higher to lower priority
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      snippet = {
        -- Engine to use when expanding snippets
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      formatting = {
        -- Adds icons
        format = lspkind.cmp_format({
          maxwidth = 50,
        }),
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.abort(),

        -- Selects first option when confirming if select equals true
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping.confirm({ select = true }),

        -- Fix delay in insertion for the following keymaps
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.config.disable,

        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }), -- TODO: what this does?

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
    })

    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = 'path' },
    --     { name = 'cmdline' }
    --   }),
    --   matching = { disallow_symbol_nonprefix_matching = false }
    -- })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
  end
}
