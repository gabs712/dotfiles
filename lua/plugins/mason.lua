return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim', -- API for mason lsp's
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- API for mason formatters and linters
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      -- Ensures that mason installs those
      ensure_installed = {
        'lua_ls',
        'ts_ls',
      }
    })
  end,
}
