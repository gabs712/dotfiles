return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('custom.helpers').map_ctrl_j_hl('neotest-summary')

    local neotest = require('neotest')
    neotest.setup({
      adapters = {
        require('neotest-vitest'),
        require('neotest-jest')({
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
      status = {
        signs = false,
      },
      diagnostic = {
        enabled = false,
      },
      output = {
        open_on_run = false, -- Popup that opens after running tests
      },
      summary = {
        animated = true,
        count = true, -- Display number of tests found
        expand_errors = true, -- Expand all errors
        follow = true, -- Expand on current file
        mappings = {
          attach = 'a',
          clear_marked = 'M',
          clear_target = 'T',
          debug = 'd',
          debug_marked = 'D',
          expand = { 'h', '<2-LeftMouse>' },
          expand_all = { 'l', 'e' },
          help = '?',
          jumpto = '<CR>',
          mark = 'm',
          next_failed = 'J',
          output = 'o',
          prev_failed = 'K',
          run = 'r',
          run_marked = 'R',
          short = 'O',
          stop = 'u',
          target = 't',
          watch = 'w',
        },
        open = 'botright vsplit | vertical resize 50',
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'neotest-summary',
      callback = function()
        vim.keymap.set('n', '<Esc>', '<cmd>Neotest summary close<CR>', { buffer = true })
      end,
    })

    vim.keymap.set('n', '<leader>x', function()
      neotest.summary.toggle()
      local win = vim.fn.bufwinid('Neotest Summary')
      if win > -1 then
        vim.api.nvim_set_current_win(win) -- Autofocus window (doesn't focus current test properly when first opening)
      end
    end, { desc = 'Toggle neotest symmary' })

    vim.keymap.set('n', '<leader>X', function()
      neotest.output.open({ enter = true, last_run = true })
    end, { desc = 'Toggle neotest output' })

    -- vim.keymap.set('n', '', function()
    --   neotest.watch.toggle(vim.fn.expand('%'))
    -- end, { desc = 'Run and watch tests from neotest' })
    -- vim.keymap.set('n', '', function()
    --   neotest.run.run(vim.fn.expand('%'))
    -- end, { desc = 'Run tests from neotest' })
  end,
}
