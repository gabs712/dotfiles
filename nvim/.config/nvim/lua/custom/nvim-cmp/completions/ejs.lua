local cmp = require('cmp')
local ts_utils = require('nvim-treesitter.ts_utils')

local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet_on_element')

local completion_trigger = require('custom.nvim-cmp.completion_trigger')
return {
  sources = {
    { name = 'luasnip' },
    {
      name = 'buffer',
      entry_filter = function()
        local cursor_node = ts_utils.get_node_at_cursor()

        if cursor_node:type() == 'ERROR' then
          return true
        end

        return false
      end,
    },
    {
      name = 'nvim_lsp',
      entry_filter = emmet_on_element,
    },
    { name = 'path' },
  },
  mapping = cmp.mapping({
    ['<C-Space>'] = completion_trigger({
      sources = {
        { name = 'nvim_lsp', entry_filter = emmet_on_element },
      },
    }),
  }),
}
