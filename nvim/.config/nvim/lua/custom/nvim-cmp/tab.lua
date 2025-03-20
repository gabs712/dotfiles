local M = {}

local cmp = require('cmp')

-- When pressing tab, instantely selects the first result
M.search = cmp.mapping(function()
  if not cmp.visible() then
    cmp.complete()
    cmp.select_next_item()
  else
    cmp.select_next_item()
  end
end, { 'c' })

-- Do the same, but automatically accpets single results
M.cmd = function()
  if not cmp.visible() then
    cmp.complete()
    cmp.select_next_item()

    if #cmp.get_entries() == 1 then
      cmp.close()
    end
  else
    cmp.select_next_item()
  end
end

-- NOTE: Would avoid tab accting as space at the end of completed expressions, but cmp.mapping is acting weird on ':' currently
-- M.cmd = cmp.mapping(function()
--   if not cmp.visible() then
--     cmp.complete()
--     cmp.select_next_item()
--
--     if #cmp.get_entries() == 1 then
--       cmp.close()
--     end
--   else
--     cmp.select_next_item()
--   end
-- end, { 'c' })

return M
