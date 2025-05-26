local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet_on_element')
return {
  sources = {
    { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        return emmet_on_element(entry, true)
      end,
    },
    { name = 'path' },
  },
}
