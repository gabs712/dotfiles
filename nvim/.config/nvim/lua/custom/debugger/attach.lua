local dap = require('dap')
local dapui = require('dapui')

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dap.set_breakpoint()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dap.clear_breakpoints()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dap.clear_breakpoints()
  dapui.close()
end
