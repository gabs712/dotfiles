local cmp = require('cmp')
local types = require('cmp.types')
local ts_utils = require('nvim-treesitter.ts_utils')

local jsx_config = {
  sources = {
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        local cursor_node = ts_utils.get_node_at_cursor()

        -- Only shows emmet suggestions inside of jsx elements
        if
          types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
          and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'
        then
          if cursor_node:type() ~= 'jsx_text' then
            return false
          end
        end

        return true
      end,
    },
    {
      name = 'luasnip',
      entry_filter = function()
        local cursor_node = ts_utils.get_node_at_cursor()
        if not cursor_node then
          return true
        end

        if
          cursor_node:type() == 'string'
          or cursor_node:type() == 'jsx_opening_element'
          or cursor_node:type() == 'jsx_closing_element'
          or cursor_node:type() == 'jsx_self_closing_element'
          or cursor_node:type() == 'jsx_attribute'
        then
          return false
        end

        if not cursor_node:parent() then
          return true
        end

        if
          (cursor_node:parent():type() == 'jsx_opening_element' and cursor_node:type() == 'identifier')
          or (cursor_node:parent():type() == 'jsx_self_closing_element')
          or (cursor_node:parent():type() == 'jsx_attribute' and cursor_node:type() == 'identifier')
          or (cursor_node:parent():type() == 'jsx_attribute' and cursor_node:type() == 'property_identifier')
        then
          return false
        end

        return true
      end,
    },
    {
      name = 'buffer',
    },
    {
      name = 'path',
    },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      function(entry1, entry2)
        local source1 = entry1.source:get_debug_name()
        local source2 = entry2.source:get_debug_name()

        local is_emmet1 = source1 == 'nvim_lsp:emmet_ls'
        local is_emmet2 = source2 == 'nvim_lsp:emmet_ls'
        local is_buffer1 = source1 == 'buffer'
        local is_buffer2 = source2 == 'buffer'

        -- Give emmet_ls priority over buffer
        if is_emmet1 and is_buffer2 then
          return true
        elseif is_buffer1 and is_emmet2 then
          return false
        end

        -- Deprioritize emmet_ls compared to other sources
        -- if is_emmet1 and not is_emmet2 then
        --   return false
        -- elseif not is_emmet1 and is_emmet2 then
        --   return true
        -- end

        return nil
      end,

      -- The rest of the comparators are pretty much the defaults
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.scopes,
      cmp.config.compare.score,
      -- cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

return jsx_config
