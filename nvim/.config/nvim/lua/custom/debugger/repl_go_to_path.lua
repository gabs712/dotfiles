local dapui = require('dapui')

return function(goToLine)
  local c_WORD = vim.fn.expand('<cWORD>')
  local trimed_WORD = c_WORD:match('^["\'%[%(%{]?(.-)["\'%]%)%}]?$')

  local path, line, col = trimed_WORD:match('^([^:]+):?(%d*):?(%d*)$')
  line = tonumber(line)
  col = tonumber(col)

  if vim.fn.filereadable(path) ~= 1 then
    return
  end

  vim.cmd('wincmd p')
  dapui.close()

  pcall(vim.cmd, 'edit ' .. vim.fn.fnameescape(path))

  if goToLine then
    vim.api.nvim_win_set_cursor(0, { line, col - 1 })
    return
  end
end
