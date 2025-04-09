return function(preferred_files)
  local root = vim.fn.getcwd()
  for _, file in ipairs(preferred_files) do
    local safe_path = vim.fs.normalize(root .. '/' .. file)

    if vim.fn.filereadable(safe_path) == 1 then
      vim.notify('Initializing on ' .. file)
      return file
    end
  end

  local current_file = vim.fn.expand('%:t')
  vim.notify('No default - Initializing on ' .. current_file)
  return '${file}'
end
