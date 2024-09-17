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

      -- window.documentation.max_height~
      window = {
        -- Add borders
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },

      view = {
        docs = {
          auto_open = false, -- Automatically show docs when highlighting
        }
      },

      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      formatting = {
        -- Adds icons
        format = lspkind.cmp_format({
          symbol_map = {
            Variable = '' -- 󰀫
          },
          maxwidth = 50,
        }),
      },

      -- Todo: explicitely set c-n / c-p to render text
      mapping = cmp.mapping.preset.insert({
        -- Selects first option when confirming if select equals true
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.abort(),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        -- Fix delay when pressing
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.config.disable,

        -- Next snippet position
        ['<C-l>'] = cmp.mapping(function()
          luasnip.expand_or_jump()
        end, { 'i', 's' }),

        -- Previous snippet position
        ['<C-k>'] = cmp.mapping(function()
          luasnip.jump(-1)
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

    -- TODO: trigger completion with c-space on cmd
    -- snippets changing live
    -- decrease height
    -- remove text description from cmd
    -- arrows to history
    -- select first item Automatically

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
      }),
      completion = {
        autocomplete = false,
      },
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
  end
}
