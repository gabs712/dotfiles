return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    require('custom.helpers').map_ctrl_j_hl('dapui_watches')
    require('custom.helpers').map_ctrl_j_hl('dapui_scopes')
    require('custom.helpers').map_ctrl_j_hl('dapui_stacks')
    require('custom.helpers').map_ctrl_j_hl('dapui_breakpoints')
    require('custom.helpers').map_ctrl_j_hl('dap-repl')
    require('custom.helpers').map_ctrl_j_hl('dapui_console', false)

    local dap = require('dap')
    local dapui = require('dapui')

    require('dapui').setup({
      layouts = {
        {
          elements = {
            {
              id = 'watches',
              size = 0.30,
            },
            {
              id = 'scopes',
              size = 0.40,
            },
            {
              id = 'stacks',
              size = 0.20,
            },
            {
              id = 'breakpoints',
              size = 0.10,
            },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 0.5,
            },
            {
              id = 'console',
              size = 0.5,
            },
          },
          position = 'bottom',
          size = 10,
        },
      },
    })
    require('custom.debugger.attach')

    require('custom.debugger.vscode-js-debug')

    vim.fn.sign_define('DapBreakpoint', {
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapBreakpointRejected', {
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapStopped', {
      text = '', -- → 
      texthl = 'DiagnosticSignWarn',
      linehl = 'Visual',
      numhl = '',
    })
    vim.fn.sign_define('DapBreakpointCondition', {
      text = '',
      texthl = 'DiagnosticSignWarn',
      linehl = '',
      numhl = '',
    })
    vim.fn.sign_define('DapLogPoint', {
      text = '',
      texthl = 'DiagnosticSignInfo',
      linehl = '',
      numhl = '',
    })

    vim.keymap.set('n', '<leader>k', function()
      dapui.float_element()
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set('n', '<leader>x', function()
      dapui.toggle()
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set('n', "<leader>'", function()
      dap.toggle_breakpoint()
    end, { desc = 'Toggle debugger breakpoint' })
    vim.keymap.set('n', '<leader>"', function()
      dap.clear_breakpoints()
    end, { desc = 'Clear debugger breakpoints' })

    vim.keymap.set('n', '<leader>1', function()
      dap.continue() -- Continue/Start
    end)
    vim.keymap.set('n', '<leader>2', function()
      dap.step_over()
    end)
    vim.keymap.set('n', '<leader>3', function()
      dap.step_into()
    end)
    vim.keymap.set('n', '<leader>4', function()
      dap.step_out()
    end)
    vim.keymap.set('n', '<leader>5', function()
      dap.restart()
    end)
    vim.keymap.set('n', '<leader>6', function()
      require('dap').terminate()
    end)
    vim.keymap.set('n', '<leader>7', function()
      require('dap').step_back()
    end)
  end,
}
