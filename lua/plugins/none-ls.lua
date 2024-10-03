return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls-extras.nvim', -- Extra sources
  },
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- Formatters
        formatting.stylua,
        formatting.prettier,

        -- Linters
        require('none-ls.diagnostics.eslint_d'),
      },
    })

    vim.keymap.set('n', '<leader>p', vim.lsp.buf.format, { desc = 'Format (make pretty)' })

    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}
