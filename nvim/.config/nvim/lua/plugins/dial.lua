return {
  'monaqa/dial.nvim',
  config = function()
    local config = require('dial.config')
    local augend = require('dial.augend') --'augend' is a term used in the context of incrementing or decrementing things
    local map = require('dial.map')

    config.augends:register_group({
      default = {
        augend.integer.alias.decimal, -- decimal, decimal_int (includes negative numbers)
        augend.constant.alias.bool,
        augend.date.alias['%Y/%m/%d'],
        augend.integer.alias.hex, -- Nonnegative hex number (0x01, 0x1a1f)
        augend.hexcolor.new({ -- (#60a5fa)
          case = 'prefer_lower', -- upper, lower, prefer_upper, prefer_lower
        }),

        -- augend.constant.new({
        --   elements = { '&&', '||' },
        --   word = false, -- True if must be a separated 'word' *
        --   cyclic = true, -- Cycle from the last to the first result
        -- }),
      },
    })

    vim.keymap.set('n', '<C-a>', function()
      map.manipulate('increment', 'normal')
    end)
    vim.keymap.set('n', '<C-x>', function()
      map.manipulate('decrement', 'normal')
    end)
    vim.keymap.set('n', 'g<C-a>', function()
      map.manipulate('increment', 'gnormal')
    end)
    vim.keymap.set('n', 'g<C-x>', function()
      map.manipulate('decrement', 'gnormal')
    end)
    vim.keymap.set('v', '<C-a>', function()
      map.manipulate('increment', 'visual')
      vim.cmd('norm! gv')
    end)
    vim.keymap.set('v', '<C-x>', function()
      map.manipulate('decrement', 'visual')
      vim.cmd('norm! gv')
    end)
    vim.keymap.set('v', 'g<C-a>', function()
      map.manipulate('increment', 'gvisual')
      vim.cmd('norm! gv')
    end)
    vim.keymap.set('v', 'g<C-x>', function()
      map.manipulate('decrement', 'gvisual')
      vim.cmd('norm! gv')
    end)
  end,
}
