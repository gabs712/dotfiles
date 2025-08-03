return function()
  local hl_active = vim.v.hlsearch ~= 0
  local ext_win_closed = false

  for _, win in pairs(vim.api.nvim_list_wins()) do
    local is_float_win = vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_config(win).relative ~= ''

    if is_float_win then
      local is_notification = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'filetype') == 'notify'

      if is_notification and hl_active then
        vim.cmd('nohlsearch')
        goto continue
      end

      local on_win = win == vim.api.nvim_get_current_win()

      if on_win and hl_active then
        return vim.cmd('nohlsearch')
      end

      if on_win then
        return vim.api.nvim_win_close(win, false)
      end

      vim.api.nvim_win_close(win, false)
      ext_win_closed = true
    end
    ::continue::
  end

  if hl_active and not ext_win_closed then
    vim.cmd('nohlsearch')
  end
end
