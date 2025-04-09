-- Opens dapui when deliberately starting a new session without including restarts
local M = {}

local dap = require('dap')
local dapui = require('dapui')

local will_open = true
local on_start = function()
  if will_open then
    dapui.open({ reset = true })
  end
  will_open = false
end

M.continue = function()
  if not dap.session() then
    will_open = true
  end
  dap.continue()
end

M.run_last = function()
  will_open = true
  dap.run_last()
end

dap.listeners.before.attach.dapui_config = on_start
dap.listeners.before.launch.dapui_config = on_start

return M
