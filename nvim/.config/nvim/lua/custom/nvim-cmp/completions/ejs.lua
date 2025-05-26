local ts_utils = require('nvim-treesitter.ts_utils')

local emmet_on_element = require('custom.nvim-cmp.completions.utils.emmet_on_element')
return {
  sources = {
    { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        return emmet_on_element(entry, false)
      end,
    },
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
    { name = 'path' },
  },
}
