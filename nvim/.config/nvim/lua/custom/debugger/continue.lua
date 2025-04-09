-- Opens dapui when deliberately starting a new session without including restarts
local dap = require('dap')
local dapui = require('dapui')

local will_open = true
local continue = function()
  if not dap.session() then
    will_open = true
  end
  dap.continue()
end

local on_start = function()
  if will_open then
    dapui.open()
  end
  will_open = false
end

dap.listeners.before.attach.dapui_config = on_start
dap.listeners.before.launch.dapui_config = on_start

return continue
