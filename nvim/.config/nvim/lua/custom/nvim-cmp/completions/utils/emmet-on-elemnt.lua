local ts_utils = require('nvim-treesitter.ts_utils')
local types = require('cmp.types')

return function(entry)
  local cursor_node = ts_utils.get_node_at_cursor()

  -- Only shows emmet suggestions on root or inside of elements
  if
    types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
    and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'
  then
    if cursor_node:type() ~= 'element' and cursor_node:type() ~= 'document' then
      return false
    end
  end

  return true
end
