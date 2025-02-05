return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require('auto-session')

    -- Recommended options
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

    auto_session.setup({
      suppressed_dirs = { '~/', '/' }, -- Don't restore those
      args_allow_files_auto_save = true, -- Also restore when opening a folder (ex. nvim .)
      bypass_save_filetypes = { 'alpha', 'oil', 'neo-tree' }, -- *Should* bypass those
    })
  end,
}
