return {
  'neovim/nvim-lspconfig', -- Actually wires lsp's
  dependencies = {
    'williamboman/mason.nvim', -- Just a package manager
    'williamboman/mason-lspconfig.nvim', -- API that bridges the gap between mason and lspconfig
  },
  config = function()
    require('mason').setup()

    require("mason-lspconfig").setup({
      -- Ensures that mason installs those
      ensure_installed = {
        'lua_ls',
        'tsserver',
      },

      -- Sets up mason installed servers
      handlers = {
        function (server_name)
          require("lspconfig")[server_name].setup({})
        end,
      }
    })
  end
}

