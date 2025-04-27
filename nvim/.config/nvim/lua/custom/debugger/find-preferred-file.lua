return function(preferred_files)
  local default_path = ''

  for _, file in ipairs(preferred_files) do
    local normalized_path = vim.fs.normalize(file)

    if vim.fn.filereadable(normalized_path) == 1 then
      default_path = normalized_path
      break
    end
  end

  local co = coroutine.running()

  return coroutine.create(function()
    vim.ui.input({ prompt = 'Enter File', default = default_path }, function(input)
      if input == nil then
        vim.notify('No file provided')
        return
      end

      if input == '' then
        local relative_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
        vim.notify('Initializing on ' .. relative_path)

        coroutine.resume(co, '${file}')
        return
      end

      local normalized_input_path = vim.fs.normalize(input)
      if vim.fn.filereadable(normalized_input_path) == 1 then
        vim.notify('Initializing on ' .. normalized_input_path)

        coroutine.resume(co, normalized_input_path)
        return
      end

      vim.notify('Cannot find ' .. normalized_input_path, vim.log.levels.ERROR)
    end)
  end)
end
