local cmp = require('cmp')
local types = require('cmp.types')
local ts_utils = require('nvim-treesitter.ts_utils')

local html_config = {
  sources = cmp.config.sources({
    { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        local cursor_node = ts_utils.get_node_at_cursor()

        -- Only shows emmet suggestions inside of elements
        if
          types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
          and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'
        then
          if cursor_node:type() ~= 'element' and cursor_node:type() ~= 'document' then
            return false
          end
        end

        return true
      end,
    },
    { name = 'path' },
  }),
}

return html_config
