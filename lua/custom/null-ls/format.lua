local M = {}

-- Formats only using null_ls sources
local null_format = function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'null-ls'
    end,
  })
end

M.default = function()
  -- Don't format if there isn't any lsp clients attached
  local buffer_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  if #buffer_clients == 0 then
    return
  end

  null_format()
end

-- Format and sort with tailwind
M.sort = function()
  local buffer_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  if #buffer_clients == 0 then
    return
  end

  null_format()
  for _, client in ipairs(buffer_clients) do
    if client.name == 'tailwindcss' then
      vim.cmd('TailwindSort')
      return
    end
  end
end

return M
