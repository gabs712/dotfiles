return function()
  local storage = require('utils.storage')
  local default_url = storage.get_field('last_url') or ''

  local co = coroutine.running()
  return coroutine.create(function()
    vim.ui.input({ prompt = 'Enter Port', default = default_url }, function(port)
      if port == nil or port == '' then
        return
      end

      storage.set_field('last_url', port)
      coroutine.resume(co, 'http://localhost:' .. port)
    end)
  end)
end
