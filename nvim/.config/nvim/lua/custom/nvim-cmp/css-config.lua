local cmp = require('cmp')
local types = require('cmp.types')
local ts_utils = require('nvim-treesitter.ts_utils')

local css_config = {
  sources = {
    { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        local cursor_node = ts_utils.get_node_at_cursor()

        -- Only shows emmet suggestions inside of css blocks
        if
          types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
          and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'
        then
          if cursor_node:type() ~= 'block' then
            return false
          end
        end

        return true
      end,
    },
    { name = 'buffer' },
    { name = 'path' },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      function(entry1, entry2)
        local source1 = entry1.source:get_debug_name()
        local source2 = entry2.source:get_debug_name()

        local is_emmet1 = source1 == 'nvim_lsp:emmet_ls'
        local is_emmet2 = source2 == 'nvim_lsp:emmet_ls'

        -- Deprioritize emmet_ls compared to other sources
        if is_emmet1 and not is_emmet2 then
          return false
        elseif not is_emmet1 and is_emmet2 then
          return true
        end

        return nil
      end,

      -- The rest of the comparators are pretty much the defaults
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.scopes,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

return css_config
