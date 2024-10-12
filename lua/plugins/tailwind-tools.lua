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
        -- Let own config handle tailwind language server
        override = false,
      },
      document_color = {
        enabled = false, -- Let other plugin handle color highlight
      },
      conceal = {
        enabled = false, -- Wheather or not to conceal by default
      },
    })

    vim.keymap.set('n', '<leader>-', '<cmd>TailwindConcealToggle<CR>', { desc = 'Toggle tailwind conceal' })
  end,
}
