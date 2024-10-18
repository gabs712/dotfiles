local M = {}

M.free_ft_ctrl = function(filetype)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      local current = vim.api.nvim_get_current_buf()

      vim.keymap.set('n', '<C-h>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-j>', '<CR>', { buffer = current, remap = true })
      vim.keymap.set('n', '<C-k>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-l>', '<Nop>', { buffer = current })
    end,
  })
end

return M
