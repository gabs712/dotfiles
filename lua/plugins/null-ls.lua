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

    vim.api.nvim_create_autocmd('BufWritePre', { callback = require('custom.format').format })
    vim.keymap.set({ 'n', 'x' }, '<leader>p', require('custom.format').sort_format, { desc = 'Format (make pretty)' })
  end,
}
