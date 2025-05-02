local types = require('cmp.types')
local ts_utils = require('nvim-treesitter.ts_utils')

local comparators = vim.list_extend({
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

    return nil
  end,
}, require('custom.nvim-cmp.global_comparators'))

local lsp_filter = function(entry)
  local cursor_node = ts_utils.get_node_at_cursor()

  -- Only shows emmet suggestions inside of jsx elements
  local is_emmet = types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
    and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'

  if is_emmet then
    if cursor_node:type() ~= 'jsx_text' then
      return false
    end
  end

  return true
end

local cmp = require('cmp')
local completion_trigger = require('custom.nvim-cmp.completion_trigger')

return {
  sources = {
    {
      name = 'luasnip',
      entry_filter = function()
        local cursor_node = ts_utils.get_node_at_cursor()
        if not cursor_node then
          return true
        end

        if
          cursor_node:type() == 'string'
          or cursor_node:type() == 'string_fragment'
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
      name = 'nvim_lsp',
      entry_filter = lsp_filter,
    },
    {
      name = 'buffer',
    },
    {
      name = 'path',
    },
  },
  mapping = cmp.mapping({
    ['<C-Space>'] = completion_trigger({
      { name = 'nvim_lsp', entry_filter = lsp_filter },
    }),
  }),
  sorting = {
    priority_weight = 2,
    comparators = comparators,
  },
}
