return function()
  local harpoon = require('harpoon')

  for _, item in pairs(harpoon:list().items) do
    local item_path = vim.fs.normalize(item.value)

    if not vim.startswith(item_path, '/') then
      local root = vim.fn.getcwd()
      item_path = vim.fs.normalize(root .. '/' .. item_path)
    end

    local buf_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))

    if buf_path == item_path then
      vim.notify('Mark already settled')
      return
    end
  end

  harpoon:list():add()
  local last_index = #harpoon:list().items

  vim.notify('Mark added at index ' .. last_index)
end
