local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet_on_element')
return {
  sources = {
    { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = emmet_on_element,
    },
    { name = 'path' },
  },
}
