local M = {}

-- Formats only using null_ls sources
local null_format = function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'null-ls'
    end,
  })
end

local format_on_save = true
vim.api.nvim_create_user_command('ToggleFormatOnSave', function()
  format_on_save = not format_on_save

  if format_on_save then
    vim.notify('FormatOnSave enabled')
  else
    vim.notify('FormatOnSave disabled')
  end
end, {})

M.on_save = function()
  if not format_on_save then
    return
  end

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
