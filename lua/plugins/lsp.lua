return {
  'neovim/nvim-lspconfig', -- Sets up lsp's
  dependencies = {
    'williamboman/mason.nvim', -- Provides mason-lspconfig to use handlers
    'hrsh7th/cmp-nvim-lsp', -- Provides capabilities for completion with lsp's
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Sets up mason installed servers
    require('mason-lspconfig').setup_handlers({
      function(server_name) -- Default
        lspconfig[server_name].setup({
          capabilities = cmp_capabilities,
        })
      end,

      ['lua_ls'] = function()
        lspconfig['lua_ls'].setup({
          capabilities = cmp_capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        })
      end,

      ['ts_ls'] = function()
        lspconfig['ts_ls'].setup({
          capabilities = cmp_capabilities,
          settings = {
            diagnostics = {
              ignoredCodes = {
                6133, -- Unused vars
                7016, -- 'Invalid' imports
              },
            },
          },
        })
      end,

      ['cssls'] = function()
        lspconfig['cssls'].setup({
          capabilities = cmp_capabilities,
          settings = {
            css = {
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            scss = {
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            less = {
              lint = {
                unknownAtRules = 'ignore',
              },
            },
          },
        })
      end,

      ['tailwindcss'] = function()
        lspconfig['tailwindcss'].setup({
          capabilities = cmp_capabilities,
          root_dir = function(fname) -- Will only attach if root of project has a tailwind config file
            local root_pattern =
              require('lspconfig').util.root_pattern('tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.js')
            return root_pattern(fname)
          end,
        })
      end,
    })
  end,
}
