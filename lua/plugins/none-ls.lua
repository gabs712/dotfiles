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

    -- Formats only using null_ls sources
    local source_formatting = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == 'null-ls'
        end,
        bufnr = bufnr,
      })
    end

    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = source_formatting,
    })

    vim.keymap.set('n', '<leader>p', source_formatting, { desc = 'Format (make pretty)' })
  end,
}
