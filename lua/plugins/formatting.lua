return {
  'stevearc/conform.nvim',
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
      format_on_save = {
        lsp_fallback = true,
      },
    })

    vim.keymap.set('n', '<leader>p', function()
      conform.format({ lsp_fallback = true })
    end, { desc = 'Format (Make pretty)' })
  end,
}
