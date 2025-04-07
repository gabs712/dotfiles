return {
  'monaqa/dial.nvim',
  config = function()
    local config = require('dial.config')
    local augend = require('dial.augend') --'augend' is a term used in the context of incrementing or decrementing things
    local map = require('dial.map')

    config.augends:register_group({
      --Default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal, --Nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex, --Nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias['%Y/%m/%d'], --Date (2024/03/19, etc.)
        augend.constant.alias.bool, --Boolean value (true <-> false)
      },

      --Augends used when group with name `mygroup` is specified
      mygroup = {},
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
