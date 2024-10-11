return {
  'luckasRanarison/tailwind-tools.nvim', -- Primarily provides sort, concealing and icons for tailwind
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('tailwind-tools').setup({
      server = {
        -- Don't setup the tailwind language server, let own config handle that
        override = false,
      },
      document_color = {
        enabled = true,
        kind = 'inline',
        inline_symbol = require('custom.icons').inline_color,
      },
      conceal = {
        enabled = false, -- Wheather or not to conceal by default
      },
    })

    vim.keymap.set('n', '<leader>=', '<cmd>TailwindSort<CR>', { desc = 'Sort tailwind classes' })
    vim.keymap.set('n', '<leader>-', '<cmd>TailwindConcealToggle<CR>', { desc = 'Toggle tailwind conceal' })
  end,
}
