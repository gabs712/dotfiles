local cmp = require('cmp')

return {
  sources = {
    { name = 'dap' }, -- Doesn't support docs
  },
  completion = {
    completeopt = 'noselect',
  },
  mapping = cmp.mapping({
    ['<C-j>'] = cmp.mapping(function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', true)
    end),

    ['<Tab>'] = function()
      if vim.fn.reg_recording() ~= '' then
        return
      end

      if not cmp.visible() then
        cmp.complete()
        cmp.select_next_item()
        return
      end

      cmp.select_next_item()
    end,

    ['<S-Tab>'] = function()
      if vim.fn.reg_recording() ~= '' then
        return
      end

      if not cmp.visible() then
        cmp.complete()
        cmp.select_prev_item()
        return
      end

      cmp.select_prev_item()
    end,

    ['<C-Space>'] = require('custom.nvim-cmp.completion_toggle'),
  }),
}
