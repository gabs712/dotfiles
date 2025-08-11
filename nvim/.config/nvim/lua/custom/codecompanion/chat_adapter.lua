local M = {}

local path = vim.fs.normalize(vim.fn.stdpath('data') .. '/adapter.json')

M.save = function(opts)
  if opts.match == 'CodeCompanionRequestFinished' or opts.match == 'CodeCompanionAgentFinished' then
    local chat_module = require('codecompanion.strategies.chat')
    local bufnr = opts.data.bufnr

    local chat = chat_module.buf_get_chat(bufnr)

    local name = chat.adapter and chat.adapter.name
    local model = chat.settings and chat.settings.model

    local json = vim.json.encode({ name = name, model = model })

    local file = io.open(path, 'w')
    if file then
      file:write(json)
      file:close()
    end
  end
end

M.get = function()
  local file = io.open(path, 'r')
  if not file then
    return {}
  end

  local file_content = file:read('*a')
  file:close()

  local ok, parsed_json = pcall(vim.json.decode, file_content)

  if not ok then
    return {}
  end

  return { name = parsed_json.name, model = parsed_json.model }
end

return M
