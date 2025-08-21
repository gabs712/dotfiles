local storage_path = vim.fn.stdpath('data') .. '/storage.json'

local function read_data()
  local file = io.open(storage_path, 'r')
  if not file then
    return {}
  end

  local content = file:read('*a')
  file:close()

  local ok, data = pcall(vim.json.decode, content)
  if not ok then
    return {}
  end

  return data
end

local function write_data(tbl)
  local file = io.open(storage_path, 'w')
  if not file then
    vim.notify('Could not open file for writing: ' .. storage_path, vim.log.levels.ERROR)
    return
  end

  file:write(vim.json.encode(tbl, { indent = true }))
  file:close()
end

local function set_field(key, value)
  local data = read_data()
  data[key] = value
  write_data(data)
end

local function get_field(key)
  local data = read_data()
  return data[key]
end

return {
  set_field = set_field,
  get_field = get_field,
}
