-- Harpoon sometimes jumps to a previously indexed position when using a mark
-- that leads to the same file currently being displayed. This will only run
-- when the mark leads to a different file.
return function(selection)
  local harpoon = require('harpoon')

  for i, item in pairs(harpoon:list().items) do
    if i ~= selection then
      goto continue
    end

    local item_path = vim.fs.normalize(item.value)

    if not vim.startswith(item_path, '/') then
      local root = vim.fn.getcwd()
      item_path = vim.fs.normalize(root .. '/' .. item_path)
    end

    local buf_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))

    if buf_path == item_path then
      return
    end

    harpoon:list():select(selection)

    ::continue::
  end
end
