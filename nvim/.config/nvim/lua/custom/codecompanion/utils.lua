local M = {}

local ts = require('codecompanion.utils.treesitter')

M.nav_heading = function(wich)
  vim.cmd("normal! m'")

  local count = vim.v.count > 0 and vim.v.count or 1
  ts.goto_heading(wich, count)
end

return M
