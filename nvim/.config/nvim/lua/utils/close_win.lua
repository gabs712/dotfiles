--- @param action string | function
return function(action)
  local hl_active = vim.v.hlsearch ~= 0

  if hl_active then
    return vim.cmd('nohlsearch')
  end

  if type(action) == 'string' then
    return vim.cmd(action)
  end

  action()
end
