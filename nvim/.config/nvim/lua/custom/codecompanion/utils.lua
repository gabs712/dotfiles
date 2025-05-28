local M = {}

local ts = require('codecompanion.utils.treesitter')

M.nav_heading = function(wich)
  local count = vim.v.count > 0 and vim.v.count or 1

  vim.cmd("normal! m'")
  ts.goto_heading(wich, count)
end

return M
