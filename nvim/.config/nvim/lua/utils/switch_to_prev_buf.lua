return function()
  local ls_output = vim.fn.execute('ls t')
  local bufrs = vim.split(ls_output, '\n', { trimempty = true })

  if #bufrs < 2 then
    return
  end

  local prev_bufnr = tonumber(bufrs[2]:match('^%s*(%d+)'))

  if prev_bufnr then
    vim.cmd('buffer ' .. prev_bufnr)
  else
    vim.notify('Could not parse the second terminal buffer number.', vim.log.levels.ERROR)
  end
end
