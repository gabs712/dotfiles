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

    local format = require('custom.null-ls.format')

    vim.api.nvim_create_autocmd('BufWritePre', { callback = format.default })
    vim.keymap.set({ 'n', 'x' }, '<leader>p', format.sort, { desc = 'Format (make pretty)' })
  end,
}
