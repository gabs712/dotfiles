return {
  'luckasRanarison/tailwind-tools.nvim', -- Primarily provides sort, concealing and icons for tailwind
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local default_conceal = false
    require('tailwind-tools').setup({
      server = {
        -- Let own config handle tailwind language server
        override = false,
      },
      document_color = {
        enabled = false, -- Let other plugin handle color highlight
      },
      conceal = {
        enabled = default_conceal, -- Wheather or not to conceal by default
      },
    })

    local is_enabled = default_conceal
    vim.keymap.set('n', '<leader>A', function()
      vim.cmd('TailwindConcealToggle')
      is_enabled = not is_enabled

      if is_enabled then
        vim.notify('Tailwind conceal enabled')
      else
        vim.notify('Tailwind conceal disabled')
      end
    end, { desc = 'Alternate tailwind conceal' })
  end,
}
