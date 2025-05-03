local types = require('cmp.types')
local ts_utils = require('nvim-treesitter.ts_utils')

local comparators = vim.list_extend({
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
}, require('custom.nvim-cmp.global_comparators'))

local lsp_filter = function(entry)
  local cursor_node = ts_utils.get_node_at_cursor()

  local is_emmet = types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
    and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'

  -- Shows emmet completion only on empty part of block
  if is_emmet then
    local current = cursor_node
    while current:parent() do
      if current:type() == 'declaration' then
        return false
      end
      if current:type() == 'block' then
        return true
      end
      current = current:parent()
    end

    return false
  end

  return true
end

local cmp = require('cmp')
local completion_trigger = require('custom.nvim-cmp.completion_trigger')

return {
  sources = {
    { name = 'luasnip' },
    { name = 'cmp-tw2css' },
    { name = 'nvim_lsp', entry_filter = lsp_filter },
    { name = 'path' },
  },
  mapping = cmp.mapping({
    ['<C-Space>'] = completion_trigger({
      sources = {
        { name = 'cmp-tw2css' },
        { name = 'nvim_lsp', entry_filter = lsp_filter },
      },
    }),
  }),
  sorting = {
    priority_weight = 2,
    comparators = comparators,
  },
}
