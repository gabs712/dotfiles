return function()
  local input_file = vim.fn.stdpath('data') .. '/last_url.txt'
  input_file = vim.fs.normalize(input_file)

  local default_url = ''
  if vim.fn.filereadable(input_file) == 1 then
    local lines = vim.fn.readfile(input_file)
    if #lines > 0 then
      default_url = lines[1]
    end
  else
    vim.fn.writefile({}, input_file)
  end

  local co = coroutine.running()

  return coroutine.create(function()
    vim.ui.input({ prompt = 'Enter Port', default = default_url }, function(port)
      if port == nil or port == '' then
        return
      end

      vim.fn.writefile({ port }, input_file)

      coroutine.resume(co, 'http://localhost:' .. port)
    end)
  end)
end
