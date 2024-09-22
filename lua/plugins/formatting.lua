return {
  'stevearc/conform.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        liquid = { 'prettier' },
        lua = { 'stylua' },
      },
    })

    vim.keymap.set('n', '<leader>p', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = 'Format (Make pretty)' })
  end,
}
