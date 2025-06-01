local M = {}

local ts = require('codecompanion.utils.treesitter')

M.nav_heading = function(wich)
  local count = vim.v.count > 0 and vim.v.count or 1

  vim.cmd("normal! m'")
  ts.goto_heading(wich, count)
end

M.floating_window = function(opts)
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get()

  local window_w = opts.width
  local window_h = opts.height

  local max_w = screen_w - opts.padding_x
  if window_w > max_w then
    window_w = max_w
  end

  local max_h = screen_h - opts.padding_y
  if window_h > max_h then
    window_h = screen_h - opts.padding_y
  end

  local center_x = (screen_w - window_w) / 2
  local center_y = ((screen_h - window_h) / 2) - vim.opt.cmdheight:get()

  return {
    width = window_w,
    height = window_h,
    col = center_x,
    row = center_y,
  }
end

M.go_to_path = function(goToLine)
  local c_WORD = vim.fn.expand('<cWORD>')
  local trimed_WORD = c_WORD:match('^["\'%[%(%{]?(.-)["\'%]%)%}]?$')

  local path, line, col = trimed_WORD:match('^([^:]+):?(%d*):?(%d*)$')
  line = tonumber(line)
  col = tonumber(col)

  if vim.fn.filereadable(path) ~= 1 then
    return
  end

  vim.cmd('close')

  pcall(vim.cmd, 'edit ' .. vim.fn.fnameescape(path))

  if not goToLine then
    return
  end

  if line and col then
    vim.api.nvim_win_set_cursor(0, { line, col - 1 })
    return
  end

  if line then
    vim.api.nvim_win_set_cursor(0, { line, 5 })
  end
end

return M
