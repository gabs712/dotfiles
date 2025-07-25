local ts_utils = require('nvim-treesitter.ts_utils')
local types = require('cmp.types')

return function(entry, show_on_ERROR)
  local cursor_node = ts_utils.get_node_at_cursor()

  -- Only shows emmet suggestions on root or inside of elements
  local is_emmet = types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
    and entry.source:get_debug_name() == 'nvim_lsp:emmet_ls'

  if not is_emmet then
    return true
  end

  local type = cursor_node:type()

  if type == 'element' or type == 'document' or type == 'ERROR' then
    return true
  end

  return false
end
