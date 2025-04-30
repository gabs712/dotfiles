local cmp = require('cmp')
local ts_utils = require('nvim-treesitter.ts_utils')

local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet-on-elemnt')

return {
  sources = cmp.config.sources({
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
  }),
}
