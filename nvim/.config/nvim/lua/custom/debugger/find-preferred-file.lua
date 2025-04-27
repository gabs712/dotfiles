return function(preferred_files)
  local root = vim.fn.getcwd()
  local default_path = ''

  for _, file in ipairs(preferred_files) do
    local path = vim.fs.normalize(root .. '/' .. file)

    if vim.fn.filereadable(path) == 1 then
      default_path = file
      break
    end
  end

  local co = coroutine.running()

  return coroutine.create(function()
    vim.ui.input({ prompt = 'Enter Port', default = default_path }, function(input)
      if input == nil then
        return
      end

      if input == '' then
        local current_file = vim.fn.expand('%:t')
        vim.notify('Initializing on ' .. current_file)

        coroutine.resume(co, '${file}')
        return
      end

      if vim.fn.filereadable(input) == 1 then
        vim.notify('Initializing on ' .. input)

        coroutine.resume(co, input)
        return
      end

      vim.notify('Cannot find module ' .. vim.fs.normalize(root .. '/' .. input), vim.log.levels.WARN)
    end)
  end)
end
