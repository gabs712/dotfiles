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
    require('custom.helpers').map_ctrl_j_hl('dapui_hover')

    local dap = require('dap')
    local dapui = require('dapui')

    require('dapui').setup({
      layouts = { -- 'console' contents usually appear on 'repl'
        {
          elements = {
            {
              id = 'scopes',
              size = 0.70,
            },
            {
              id = 'breakpoints',
              size = 0.10,
            },
            {
              id = 'stacks',
              size = 0.20,
            },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = {
            {
              id = 'watches',
              size = 0.5,
            },
            {
              id = 'repl',
              size = 0.5,
            },
          },
          position = 'bottom',
          size = 11,
        },
      },
      controls = {
        element = 'repl',
        enabled = false, -- Disable repl icons
      },
      mappings = {
        edit = 'e',
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't',
      },
    })
    require('custom.debugger.adapters-config')

    vim.fn.sign_define('DapBreakpoint', {
      text = '󰻃', -- 󰻃 
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapBreakpointRejected', {
      text = '󰻃',
      texthl = 'DiagnosticSignError',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapStopped', {
      text = '', --  → 
      texthl = 'Conditional',
      linehl = 'Visual',
      numhl = '',
    })
    vim.fn.sign_define('DapBreakpointCondition', {
      text = '󰻃',
      texthl = 'Conditional',
      linehl = '',
      numhl = '',
    })
    vim.fn.sign_define('DapLogPoint', {
      text = '󰻃',
      texthl = 'DiagnosticSignInfo',
      linehl = '',
      numhl = '',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'dap-repl', 'dapui_watches' },
      callback = function()
        vim.keymap.set('i', '<C-w>', '<C-S-w>', { buffer = true }) -- Fix C-w behavior on dapui
        vim.keymap.set({ 'n', 'i' }, '<C-l>', function()
          require('dap.repl').clear()
        end, { buffer = true })

        vim.keymap.set({ 'i', 's' }, '<C-f>', '<Right>', { buffer = true })
        vim.keymap.set({ 'i', 's' }, '<C-b>', '<Left>', { buffer = true })
        vim.keymap.set({ 'i', 's' }, '<C-a>', '<Home>', { buffer = true })
        vim.keymap.set({ 'i', 's' }, '<C-e>', '<End>', { buffer = true })
      end,
    })

    vim.keymap.set('n', '<leader>j', dap.continue, { desc = 'Continue debugger' })
    vim.keymap.set('n', "<leader>'", dap.continue, { desc = 'Continue debugger' })
    vim.keymap.set('n', '<leader>0', dap.run_last, { desc = 'Rerun last debugger session' })

    vim.keymap.set('n', '<leader>J', function()
      -- 'terminate' on sessions of type 'launch', else defaults to 'disconnect'
      local session = dap.session()
      if session and session.config.request == 'launch' then
        dap.terminate({ all = true, hierarchy = true })
      else
        dap.disconnect({ terminateDebuggee = true })
        dap.close()
      end

      dapui.close()
      dap.clear_breakpoints()
    end, { desc = 'Disconnect debugger' })

    vim.keymap.set('n', '<leader>k', function()
      dap.toggle_breakpoint()
    end, { desc = 'Toggle debugger breakpoint' })

    vim.keymap.set('n', '<leader>K', function()
      dap.clear_breakpoints()
    end, { desc = 'Clear debugger breakpoints' })

    vim.keymap.set('n', '<leader>9', function()
      dap.set_breakpoint(nil, nil, vim.fn.input('Log Point'))
    end, { desc = 'Set log debugger breakpoint' })

    vim.keymap.set('n', '<leader>8', function()
      dap.set_breakpoint(vim.fn.input('Condition'))
    end, { desc = 'Set conditional debugger breakpoint' })

    vim.keymap.set('n', '<leader>7', function()
      dap.set_breakpoint(nil, vim.fn.input('Hit Condition'))
    end, { desc = 'Set hit condition debugger breakpoint' })

    vim.keymap.set('n', '<leader>m', function()
      dapui.toggle({ reset = true })
    end, { desc = 'Toggle debugger ui' })

    vim.keymap.set({ 'n', 'x' }, 'M', function()
      dapui.eval(nil, { enter = true })
    end, { desc = 'Eval debugger expression' })

    vim.keymap.set('n', '<leader>i', function()
      dap.repl.toggle({ height = 12 })
    end, { desc = 'Toggle debugger repl (terminal)' })

    vim.keymap.set('n', '<leader>I', function()
      require('dap.repl').clear()
    end, { desc = 'Clear debugger repl (terminal)' })

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
