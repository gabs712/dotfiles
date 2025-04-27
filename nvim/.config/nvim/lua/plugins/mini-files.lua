return {
  'echasnovski/mini.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  config = function()
    local mini_files = require('mini.files')
    mini_files.setup({
      -- content = { filter = new_filter },
      mappings = {
        close = '<esc>',
        go_in = '',
        go_in_plus = '<C-j>', -- Close buffer when opening file
        go_out = '',
        go_out_plus = '<C-k>', -- Close previous buffer when going out
        mark_goto = "'",
        mark_set = 'm',
        reset = '=',
        reveal_cwd = '',
        show_help = 'g?',
        synchronize = '<C-s>',
        trim_left = '<',
        trim_right = '>',
      },
      windows = {
        preview = false,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 25,
      },
      options = {
        use_as_default_explorer = false,
        permanent_delete = false,
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'minifiles',
      callback = function()
        vim.keymap.set('i', '<C-s>', function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
          vim.schedule(function()
            mini_files.synchronize()
          end)
        end, { buffer = true })
        vim.keymap.set('n', '-', function()
          mini_files.set_branch({ vim.fn.getcwd() })
        end)
      end,
    })

    vim.keymap.set('n', '<leader>e', function()
      if not mini_files.close() then
        mini_files.open(--[[ vim.api.nvim_buf_get_name(0), false ]]) -- Open on current file
      end
    end)

    local show_dotfiles = true

    local filter_show = function()
      return true
    end

    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, '.')
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      mini_files.refresh({ content = { filter = new_filter } })
    end

    -- Set focused directory as current working directory
    local set_cwd = function()
      local path = (mini_files.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify('Cursor is not on valid entry')
      end
      local dir = vim.fs.dirname(path)
      vim.fn.chdir(dir)
      mini_files.close()

      vim.notify('CWD changed to ' .. dir)
    end

    -- Yank in register full path of entry under cursor
    local yank_path = function()
      local path = (mini_files.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify('Cursor is not on valid entry')
      end
      vim.fn.setreg('+', path)
      mini_files.close()

      vim.notify('Path copied to system clipboard')
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })

        vim.keymap.set('n', 'gd', set_cwd, { buffer = buf_id, desc = 'Set cwd' })
        vim.keymap.set('n', '<C-y>', yank_path, { buffer = buf_id, desc = 'Copy path to system clipboard' })
      end,
    })
  end,
}
