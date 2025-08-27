--- @param tbl table
return function(tbl)
  local keys = {}
  for name, group in pairs(tbl) do
    for lhs, def in pairs(group) do
      local mode
      if name == 'select' then
        mode = { 'o', 'x' }
      elseif name == 'swap_previous' or name == 'swap_next' then
        mode = 'n'
      else
        mode = { 'n', 'o', 'x' }
      end

      table.insert(keys, { lhs, desc = def.desc, mode = mode })
    end
  end

  return keys
end
