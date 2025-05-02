local cmp = require('cmp')
local completion_trigger = require('custom.nvim-cmp.completion_trigger')

return {
  sources = {
    { name = 'dap' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping(function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', true)
    end),

    ['<Tab>'] = function()
      if not cmp.visible() then
        cmp.complete()
        return
      end

      cmp.select_next_item()
    end,

    ['<S-Tab>'] = function()
      if not cmp.visible() then
        cmp.complete()
        return
      end

      cmp.select_prev_item()
    end,

    ['<C-c>'] = cmp.abort,

    -- Doesn't seem to support docs
    ['<C-Space>'] = completion_trigger(),

    ['<C-e>'] = cmp.config.disable,
    ['<C-y>'] = cmp.config.disable,
  }),
}
