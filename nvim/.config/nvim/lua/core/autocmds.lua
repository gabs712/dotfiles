-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable automatic comment insertion
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()

    vim.cmd('tabdo wincmd =') -- Resize windows of all tabs
    vim.cmd('tabnext ' .. current_tab) -- Restores the focus to the original tab
  end,
})

-- Preserve last position when opening buffers
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(event)
    local exclude = {
      'gitcommit',
    }
    local buf = event.buf

    -- Ignore excluded filetypes or last buffer
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_buf_edited then
      return
    end

    -- Avoids attempting to restore position again
    vim.b[buf].last_buf_edited = true

    local mark = vim.api.nvim_buf_get_mark(buf, '"') -- Line and column from when buffer was closed
    local lcount = vim.api.nvim_buf_line_count(buf)

    -- Only proceed if line still exists
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- When saving a file, if it's inside not yet existent folders, creates them
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function(event)
    -- Acts normally for protcols like http://
    if event.match:match('^%w%w+:[\\/][\\/]') then
      return
    end

    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

local diagnostics_enabled = true

-- Diagnostic toggle command
vim.api.nvim_create_user_command('ToggleDiagnostics', function()
  diagnostics_enabled = not diagnostics_enabled

  vim.diagnostic.enable(diagnostics_enabled)

  if diagnostics_enabled then
    vim.notify('Diagnostic enabled')
  else
    vim.notify('Diagnostic disabled')
  end
end, {})

-- Disable diagnostics on insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    if diagnostics_enabled then
      vim.diagnostic.enable(false)
    end
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    if diagnostics_enabled then
      vim.diagnostic.enable(true)
    end
  end,
})
