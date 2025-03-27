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
              size = 0.20,
            },
            {
              id = 'scopes',
              size = 0.55,
            },
            {
              id = 'stacks',
              size = 0.25,
            },
            -- {
            --   id = 'breakpoints',
            --   size = 0,
            -- },
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
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapStopped', {
      text = '', -- → 
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

    vim.keymap.set('n', '<leader>K', function()
      dapui.toggle()
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set('n', '<leader>k', function()
      if dap.session() then
        dap.terminate({ all = true, hierarchy = true })
        return
      end

      dap.set_breakpoint()
      dap.continue() -- Continue/Start
    end, { desc = 'Toggle debugger' })

    vim.keymap.set('n', '<leader>0', function()
      dap.run_last()
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
