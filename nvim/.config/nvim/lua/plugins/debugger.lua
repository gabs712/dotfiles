return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio', -- Async stuff
    'theHamsta/nvim-dap-virtual-text',
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
      layouts = {
        {
          elements = {
            {
              id = 'watches',
              size = 0.20,
            },
            {
              id = 'scopes',
              size = 0.45,
            },
            {
              id = 'stacks',
              size = 0.20,
            },
            {
              id = 'breakpoints',
              size = 0.15,
            },
          },
          position = 'right',
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
    require('nvim-dap-virtual-text').setup({
      highlight_changed_variables = true,
      highlight_new_as_changed = false, -- Highlight new variables in the same way as changed variables

      only_first_definition = true, -- Only show at first variable definition
      all_references = false, -- Show virtual text on all all references of the variable
      commented = false, -- Add comment string at start (ex. '//')
      virt_text_pos = 'eol', -- 'inline' or 'eol' (end of line)
    })

    require('custom.debugger.adapters')

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
      text = '→', -- → 
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

    -- vim.keymap.set('n', '<leader>k', function()
    --   if dap.session() then
    --     dap.terminate({ all = true, hierarchy = true })
    --     return
    --   end
    --
    --   local hasConfig = require('custom.debugger.hasConfig')
    --   if hasConfig() then
    --     dap.set_breakpoint()
    --   end
    --
    --   dap.continue() -- Continue/Start
    -- end, { desc = 'Toggle debugger' })

    vim.keymap.set('n', '<leader>m', function()
      dapui.toggle()
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set('n', '<leader>M', function()
      dap.clear_breakpoints()
    end, { desc = 'Clear debugger breakpoints' })

    vim.keymap.set('n', '<leader>J', function()
      dap.terminate({ all = true, hierarchy = true })
    end, { desc = 'Terminate debugger' })

    vim.keymap.set('n', '<leader>j', function()
      dap.continue()
    end, { desc = 'Continue debugger' })

    vim.keymap.set('n', '<leader>k', function()
      dap.toggle_breakpoint()
    end, { desc = 'Toggle debugger breakpoints' })

    vim.keymap.set('n', '<leader>K', function()
      dap.set_breakpoint(vim.fn.input('Condition: '))
    end, { desc = 'Set conditional debugger breakpoint' })

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
