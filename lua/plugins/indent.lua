return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    require('ibl').setup({
      indent = {
        char = '▏',
        tab_char = '▏', -- Still show indent guides if indent is a tab
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          'undotree',
          'harpoon',
          'neo-tree',
          'trouble',
        },
      },
    })
  end,
}
