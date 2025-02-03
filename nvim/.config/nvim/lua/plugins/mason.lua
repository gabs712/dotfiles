return {
  'williamboman/mason.nvim', -- The package manager
  dependencies = {
    'williamboman/mason-lspconfig.nvim', -- Allow lspconfig server names
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- API to ensure that mason installs packages
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup() -- Must be setup after mason

    require('custom.helpers').map_ctrl_j_hl('mason')
    require('mason-tool-installer').setup({
      ensure_installed = {
        -- Language servers
        'html',
        'cssls',
        'ts_ls',
        'tailwindcss',
        'emmet_ls',
        'lua_ls',
        'eslint',

        -- Formatters
        'prettier',
        'stylua',
      },
    })
  end,
}
