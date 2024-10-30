local M = {}

M.map_ctrl_j = function(filetype, remap)
  if remap == nil then
    remap = true
  end

  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      local current = vim.api.nvim_get_current_buf()

      vim.keymap.set('n', '<C-h>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-j>', '<CR>', { buffer = current, remap = remap })
      vim.keymap.set('n', '<C-k>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-l>', '<Nop>', { buffer = current })
    end,
  })
end

M.clear_ctrl = function(filetype)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      local current = vim.api.nvim_get_current_buf()

      vim.keymap.set('n', '<C-h>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-j>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-k>', '<Nop>', { buffer = current })
      vim.keymap.set('n', '<C-l>', '<Nop>', { buffer = current })
    end,
  })
end

return M
