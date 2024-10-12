return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls-extras.nvim', -- Extra sources
    { 'luckasRanarison/tailwind-tools.nvim', name = 'tailwind-tools' }, -- Sort tailwind
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
    local null_format = function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == 'null-ls'
        end,
      })
    end

    -- Format and sort with tailwind
    local tailwind_format = function()
      null_format()

      local buffer_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
      for _, client in ipairs(buffer_clients) do
        if client.name == 'tailwindcss' then
          vim.cmd('TailwindSort')
          return
        end
      end
    end

    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = null_format,
    })
    vim.keymap.set('n', '<leader>p', tailwind_format, { desc = 'Format (make pretty)' })
  end,
}
