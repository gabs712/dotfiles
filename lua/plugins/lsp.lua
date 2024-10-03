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
            -- Ignores lint for unused vars
            diagnostics = { ignoredCodes = { 6133 } },
          },
        })
      end,
    })

    -- Fallbacks to original if there's no lsp attached
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Manual about symbol under cursor' })
      end,
    })
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol across project' })
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code actions' })
  end,
}
