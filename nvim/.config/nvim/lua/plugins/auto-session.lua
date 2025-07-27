return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require('auto-session')

    -- When 'buffers' is abscent, it restores only the current and the "alt" (#) buffer, wich avoids stacking too much and messing up the buffer order.
    vim.o.sessionoptions = ''

    auto_session.setup({
      suppressed_dirs = { '~/', '/' }, -- Don't restore those
      bypass_save_filetypes = { 'alpha' },
      auto_restore = true,
      args_allow_files_auto_save = true,
    })
  end,
}
