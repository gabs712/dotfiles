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
    require('custom.helpers').clear_ctrl_hl('neotest-output')
    require('custom.helpers').map_ctrl_j('neotest-summary')

    require('neotest').setup({
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
          expand = { '<CR>', '<2-LeftMouse>' },
          expand_all = 'e',
          help = '?',
          jumpto = 'i',
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

    vim.keymap.set('n', '<leader>t', function()
      require('neotest').summary.toggle()
    end)
  end,
}
