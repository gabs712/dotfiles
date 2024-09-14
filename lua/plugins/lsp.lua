return {
  'neovim/nvim-lspconfig', -- Actually wires lsp's
  dependencies = {
    {'williamboman/mason.nvim', config = true}, -- Just a package manager
    'williamboman/mason-lspconfig.nvim', -- API for mason lsp's
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- API for mason formatters and linters
  },
  config = function()
    require("mason-lspconfig").setup({
      -- Ensures that mason installs those
      ensure_installed = {
        'lua_ls',
        'tsserver',
      }
    })

    local lspconfig = require("lspconfig")

    -- Sets up mason installed servers
    require('mason-lspconfig').setup_handlers({
      function(server_name) -- Default
        lspconfig[server_name].setup({})
      end,

      ['lua_ls'] = function()
        lspconfig['lua_ls'].setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          }
        })
      end,
    })

    -- ev.buf ensures that lsp keymaps are only settled when a language server is avaliable
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Manual about symbol under cursor' })
        vim.keymap.set('n', '<leader>p', vim.lsp.buf.format, { buffer = ev.buf, desc = 'Format (make pretty)' })
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename symbol across project' })
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code actions' })
      end
    })
  end
}

