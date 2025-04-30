local cmp = require('cmp')

local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet-on-elemnt')

return {
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'buffer' },
    {
      name = 'nvim_lsp',
      entry_filter = emmet_on_element,
    },
    { name = 'path' },
  }),
}
