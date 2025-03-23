return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    require('dapui').setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require('custom.debugger.vscode-js-debug')

    vim.keymap.set('n', '<leader>x', function()
      require('dapui').toggle()
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set('n', '<C-b>', function()
      dap.toggle_breakpoint()
    end, { desc = 'Toggle debugger breakpoint' })

    vim.keymap.set('n', '<F1>', function()
      dap.continue()
    end, { desc = 'Debugger contiue' })
  end,
}
