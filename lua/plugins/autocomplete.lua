return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- Source for text written in buffer
    "hrsh7th/cmp-path", -- Source for paths
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
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

      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
        }),
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.abort(),

        -- Selects first option when confirming when select equals true
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping.confirm({ select = true }),

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
  end
}
