local cmp = require('cmp')

local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet-on-elemnt')

local completion_trigger = require('custom.nvim-cmp.completion_trigger')
return {
  sources = {
    { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = emmet_on_element,
    },
    { name = 'path' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = completion_trigger({
      { name = 'nvim_lsp', entry_filter = emmet_on_element },
    }),
  }),
}
