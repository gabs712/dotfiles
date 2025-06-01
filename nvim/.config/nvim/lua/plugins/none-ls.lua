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
          -- Treats '.ejs' as if it was '.html'
          extra_filetypes = { 'ejs' },
          extra_args = function(params)
            if params.bufname:match('%.ejs$') then
              return { '--parser', 'html' }
            end
            return {}
          end,
        }),
      },
    })

    local format_on_save = true
    local format = require('custom.none-ls.format')

    vim.api.nvim_create_user_command('ToggleFormat', function()
      format_on_save = not format_on_save
      vim.notify('FormatOnSave ' .. (format_on_save and 'enabled' or 'disabled'))
    end, {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        if format_on_save then
          format()
        end
      end,
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>p', function()
      local result = format()
      if result and result.found_tailwind then
        vim.cmd('TailwindSort')
      end
    end, { desc = 'Format' })
  end,
}
