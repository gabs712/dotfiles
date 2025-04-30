return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'luckasRanarison/tailwind-tools.nvim', name = 'tailwind-tools' }, -- Sort tailwind
  },
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- Formatters
        formatting.stylua,
        formatting.prettier.with({
          extra_args = function(params)
            if params.bufname:match('%.ejs$') then -- Treats '.ejs' as if it was '.html'
              return { '--parser', 'html' }
            end
            return {}
          end,
        }),
      },
    })

    local format = require('custom.none-ls.format')

    vim.api.nvim_create_autocmd('BufWritePre', { callback = format.on_save })
    vim.keymap.set({ 'n', 'x' }, '<leader>p', format.sort, { desc = 'Format (make pretty)' })
  end,
}
