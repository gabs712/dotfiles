local conceal_enabled = false

return {
  'luckasRanarison/tailwind-tools.nvim', -- Primarily provides sort, concealing and icons for tailwind
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = { 'TailwindSort', 'TailwindConcealToggle' },
  keys = {
    {
      '<leader>A',
      function()
        vim.cmd('TailwindConcealToggle')
        conceal_enabled = not conceal_enabled

        if conceal_enabled then
          vim.notify('Tailwind conceal enabled')
        else
          vim.notify('Tailwind conceal disabled')
        end
      end,
      desc = 'Alternate tailwind conceal',
    },
  },
  config = function()
    local mask_module = require('utils.mask_module')

    -- Prevents it from loading telescope, messing up lazy loading
    mask_module('telescope', function()
      require('tailwind-tools').setup({
        server = {
          -- Let own config handle tailwind language server
          override = false,
        },
        document_color = {
          enabled = false, -- Let other plugin handle color highlight
        },
        conceal = {
          enabled = conceal_enabled, -- Wheather or not to conceal by default
        },
      })
    end)
  end,
}
