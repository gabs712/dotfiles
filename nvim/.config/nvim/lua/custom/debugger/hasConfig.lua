return function()
  local dap = require('dap')
  local bufnr = vim.api.nvim_get_current_buf()

  if
    next(dap.providers.configs['dap.global'](bufnr)) == nil -- global (editor) config
    and next(dap.providers.configs['dap.launch.json'](bufnr)) == nil -- local (json) config
  then
    return false
  end
  return true
end
