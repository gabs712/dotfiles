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
  local center_y = (screen_h - window_h) / 2 - vim.opt.cmdheight:get()

  return {
    width = window_w,
    height = window_h,
    row = center_x,
    col = center_y,
  }
end

return M
