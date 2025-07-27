return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require('auto-session')

    -- Recommended options
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

    auto_session.setup({
      suppressed_dirs = { '~/', '/' }, -- Don't restore those
      bypass_save_filetypes = { 'alpha' },
      auto_restore = true,
      args_allow_files_auto_save = true,
    })
  end,
}
