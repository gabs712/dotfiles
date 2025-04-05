return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio', -- Async stuff
  },
  config = function()
    require('custom.helpers').map_ctrl_j_hl('dapui_watches')
    require('custom.helpers').map_ctrl_j_hl('dapui_scopes')
    require('custom.helpers').map_ctrl_j_hl('dapui_stacks')
    require('custom.helpers').map_ctrl_j_hl('dapui_breakpoints')
    require('custom.helpers').map_ctrl_j_hl('dap-repl')
    require('custom.helpers').map_ctrl_j_hl('dapui_console')

    local dap = require('dap')
    local dapui = require('dapui')

    require('dapui').setup({
      layouts = { -- 'console' contents usually appear on 'repl'
        {
          elements = {
            {
              id = 'scopes',
              size = 0.30,
            },
            {
              id = 'watches',
              size = 0.30,
            },
            {
              id = 'breakpoints',
              size = 0.15,
            },
            {
              id = 'stacks',
              size = 0.25,
            },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 1,
            },
          },
          position = 'bottom',
          size = 11,
        },
      },
    })
    require('custom.debugger.attach')
    require('custom.debugger.adapters-config')

    vim.fn.sign_define('DapBreakpoint', {
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapBreakpointRejected', {
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapStopped', {
      text = '', -- → 
      texthl = 'Conditional',
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
      dap.toggle_breakpoint()
    end, { desc = 'Toggle debugger breakpoint' })

    vim.keymap.set('n', '<leader>K', function()
      dap.set_breakpoint(vim.fn.input('Condition: '))
    end, { desc = 'Set conditional debugger breakpoint' })

    vim.keymap.set('n', '<leader>m', function()
      dapui.toggle()
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set('n', '<leader>M', function()
      dap.clear_breakpoints()
    end, { desc = 'Clear debugger breakpoints' })

    vim.keymap.set('n', '<leader>j', function()
      dap.continue()
    end, { desc = 'Continue debugger' })

    vim.keymap.set('n', '<leader>J', function()
      dap.terminate()
    end, { desc = 'Terminate debugger' })

    vim.keymap.set('n', '<leader>0', function()
      if dap.session() then
        dap.run_last()
      end
    end, { desc = 'Rerun last debugger session' })
    vim.keymap.set('n', '<leader>1', function()
      dap.step_over()
    end, { desc = 'Step over on debugger' })
    vim.keymap.set('n', '<leader>2', function()
      dap.step_into()
    end, { desc = 'Step into on debugger' })
    vim.keymap.set('n', '<leader>3', function()
      dap.step_out()
    end, { desc = 'Step out on debugger' })
    vim.keymap.set('n', '<leader>4', function()
      dap.step_back()
    end, { desc = 'Step back on debugger' })
  end,
}
