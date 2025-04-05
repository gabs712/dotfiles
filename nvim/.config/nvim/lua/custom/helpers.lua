local M = {}

M.map_ctrl_j = function(filetype, remap)
  if remap == nil then
    remap = true
  end

  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      vim.keymap.set({ 'n', 's' }, '<C-h>', '<Nop>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-j>', '<CR>', { buffer = true, remap = remap })
      vim.keymap.set({ 'n', 's' }, '<C-k>', '<Nop>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-l>', '<Nop>', { buffer = true })
    end,
  })
end

M.map_ctrl_j_hl = function(filetype, remap)
  if remap == nil then
    remap = true
  end

  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      vim.keymap.set({ 'n', 's' }, '<C-h>', '<cmd>nohlsearch<cr>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-j>', '<CR>', { buffer = true, remap = remap })
      vim.keymap.set({ 'n', 's' }, '<C-k>', '<Nop>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-l>', '<Nop>', { buffer = true })
    end,
  })
end

M.clear_ctrl_hl = function(filetype)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      vim.keymap.set({ 'n', 's' }, '<C-h>', '<cmd>nohlsearch<cr>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-j>', '<Nop>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-k>', '<Nop>', { buffer = true })
      vim.keymap.set({ 'n', 's' }, '<C-l>', '<Nop>', { buffer = true })
    end,
  })
end

M.switch_to_previous_buffer = function()
  -- Capture the output of `:ls t`
  local ls_output = vim.fn.execute('ls t')

  -- Split the output into lines
  local lines = vim.split(ls_output, '\n', { trimempty = true })

  -- Check if there are at least two terminal buffers
  if #lines < 2 then
    return
  end

  -- Extract the buffer number of the second terminal buffer
  local second_line = lines[2]
  local buffer_number = tonumber(second_line:match('^%s*(%d+)'))

  if buffer_number then
    -- Switch to the buffer
    vim.cmd('buffer ' .. buffer_number)
  else
    print('Could not parse the second terminal buffer number.')
  end
end

return M
