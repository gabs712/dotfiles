return function()
  local co = coroutine.running()
  return coroutine.create(function()
    vim.ui.input({ prompt = 'Enter URL: ', default = 'http://localhost:' }, function(url)
      if url == nil or url == '' then
        return
      else
        coroutine.resume(co, url)
      end
    end)
  end)
end
