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

      ['html'] = function()
        local default = require('lspconfig.configs.html').default_config.filetypes
        local filetypes = vim.list_extend(vim.deepcopy(default), { 'ejs' })

        lspconfig['html'].setup({
          filetypes = filetypes,
          capabilities = cmp_capabilities,
        })
      end,

      ['emmet_ls'] = function()
        local default = require('lspconfig.configs.emmet_ls').default_config.filetypes
        local filetypes = vim.list_extend(vim.deepcopy(default), { 'ejs' })

        lspconfig['emmet_ls'].setup({
          filetypes = filetypes,
          capabilities = cmp_capabilities,
          init_options = {
            jsx = {
              options = { -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ['output.selfClosingStyle'] = 'xhtml', -- Closes self closing tags with a space before the slash
              },
            },
            html = {
              options = {
                ['output.selfClosingStyle'] = 'xhtml',
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
                7016, -- 'Invalid' imports (causing incorrect linting)
                80001, -- CommonJs imports,
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
    })
  end,
}
