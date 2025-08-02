return {
  'sindrets/diffview.nvim',
  config = function()
    local actions = require('diffview.actions')

    local goto_file_and_close = function()
      actions.goto_file_edit()
      vim.cmd('tabclose #')
    end

    local map = {
      close = '<Esc>',
      nohl = '<C-h>',
      help = 'g?',
      cycle_layout = '-',
      toggle_files = '<C-Space>',
      goto_file = 'gF',
      goto_file_c = 'gf',
      sl_next_entry = 'L',
      sl_prev_entry = 'H',
      scroll_down = 'J',
      scroll_up = 'K',
      restore = 'R',
      open_log = 'gl',

      choose_ours = '<leader>[',
      choose_theirs = '<leader>]',
      choose_both = '<leader>=',
      choose_none = '<leader>-',

      prev_conflict = '[g',
      next_conflict = ']g',
    }

    require('diffview').setup({
      show_help_hints = false, -- Show hints for how to open the help panel

      diff_binaries = false, -- Show diffs for binaries
      enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
      git_cmd = { 'git' }, -- The git executable followed by default args.
      hg_cmd = { 'hg' }, -- The hg executable followed by default args.
      use_icons = true, -- Requires nvim-web-devicons
      watch_index = true, -- Update views and index buffers when the git index changes.
      icons = { -- Only applies when use_icons is true.
        folder_closed = '',
        folder_open = '',
      },
      signs = {
        fold_closed = '',
        fold_open = '',
        done = '✓',
      },
      view = {
        -- Configure the layout and behavior of different types of views.
        -- Available layouts:
        --  'diff1_plain'
        --    |'diff2_horizontal'
        --    |'diff2_vertical'
        --    |'diff3_horizontal'
        --    |'diff3_vertical'
        --    |'diff3_mixed'
        --    |'diff4_mixed'
        -- For more info, see |diffview-config-view.x.layout|.
        default = {
          -- Config for changed files, and staged files in diff views.
          layout = 'diff2_horizontal',
          disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = false, -- See |diffview-config-view.x.winbar_info|
        },
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase.
          layout = 'diff3_horizontal',
          disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = true, -- See |diffview-config-view.x.winbar_info|
        },
        file_history = {
          -- Config for changed files in file history views.
          layout = 'diff2_horizontal',
          disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = false, -- See |diffview-config-view.x.winbar_info|
        },
      },
      file_panel = {
        listing_style = 'tree', -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
          flatten_dirs = true, -- Flatten dirs that only contain one single dir
          folder_statuses = 'only_folded', -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = { -- See |diffview-config-win_config|
          position = 'left',
          width = 35,
          win_opts = {},
        },
      },
      file_history_panel = {
        log_options = { -- See |diffview-config-log_options|
          git = {
            single_file = {
              diff_merges = 'combined',
            },
            multi_file = {
              diff_merges = 'first-parent',
            },
          },
          hg = {
            single_file = {},
            multi_file = {},
          },
        },
        win_config = { -- See |diffview-config-win_config|
          position = 'bottom',
          height = 12,
          win_opts = {},
        },
      },
      commit_log_panel = {
        win_config = {}, -- See |diffview-config-win_config|
      },
      default_args = { -- Default args prepended to the arg-list for the listed commands
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {}, -- See |diffview-config-hooks|
      keymaps = {
        disable_defaults = true,
        view = {
          { 'n', map.toggle_files, actions.toggle_files, { desc = 'Toggle the file panel' } },

          { 'n', map.sl_next_entry, actions.select_next_entry, { desc = 'Open the diff for the next file' } },
          { 'n', map.sl_prev_entry, actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },

          { 'n', map.goto_file_c, goto_file_and_close, { desc = 'Open the file in the previous tabpage and close' } },
          { 'n', map.goto_file, actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },

          { 'n', '-', actions.cycle_layout, { desc = 'Cycle through available layouts.' } },

          { 'n', map.prev_conflict, actions.prev_conflict, { desc = 'Go to the previous conflict' } },
          { 'n', map.next_conflict, actions.next_conflict, { desc = 'Go to the next conflict' } },

          { 'n', map.choose_ours, actions.conflict_choose_all('ours'), { desc = 'Choose current git conflict' } },
          { 'n', map.choose_theirs, actions.conflict_choose_all('theirs'), { desc = 'Choose merged git conflict' } },
          { 'n', map.choose_both, actions.conflict_choose_all('all'), { desc = 'Choose both git conflicts' } },
          { 'n', map.choose_none, actions.conflict_choose_all('none'), { desc = 'Choose neither of git conflicts' } },

          { 'n', 'dx', actions.conflict_choose('none'), { desc = 'Delete the conflict region' } },
          {
            'n',
            '<leader>cO',
            actions.conflict_choose_all('ours'),
            { desc = 'Choose the OURS version of a conflict for the whole file' },
          },
          {
            'n',
            '<leader>cT',
            actions.conflict_choose_all('theirs'),
            { desc = 'Choose the THEIRS version of a conflict for the whole file' },
          },
          {
            'n',
            '<leader>cB',
            actions.conflict_choose_all('base'),
            { desc = 'Choose the BASE version of a conflict for the whole file' },
          },
          {
            'n',
            '<leader>cA',
            actions.conflict_choose_all('all'),
            { desc = 'Choose all the versions of a conflict for the whole file' },
          },
          {
            'n',
            'dX',
            actions.conflict_choose_all('none'),
            { desc = 'Delete the conflict region for the whole file' },
          },

          { 'n', map.nohl, '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' } },
          { 'n', '<C-j>', '<Nop>' },
          { 'n', '<C-k>', '<Nop>' },
          { 'n', '<C-l>', '<Nop>' },

          { 'n', map.close, '<cmd>DiffviewClose<CR>', { desc = 'Close diffview' } },
        },
        diff1 = {
          { 'n', map.help, actions.help({ 'view', 'diff1' }), { desc = 'Open the help panel' } },
        },
        diff2 = {
          { 'n', map.help, actions.help({ 'view', 'diff2' }), { desc = 'Open the help panel' } },
        },
        diff3 = {
          { 'n', map.help, actions.help({ 'view', 'diff3' }), { desc = 'Open the help panel' } },
        },
        diff4 = {
          { 'n', map.help, actions.help({ 'view', 'diff4' }), { desc = 'Open the help panel' } },
        },
        file_panel = {
          { 'n', map.restore, actions.restore_entry, { desc = 'Restore entry to the state on the left side' } },
          { 'n', map.open_log, actions.open_commit_log, { desc = 'Open the commit log panel' } },

          { 'n', map.nohl, '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' } },
          { 'n', '<C-j>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', '<C-k>', actions.close_fold, { desc = 'Collapse fold' } },
          { 'n', '<C-l>', '<Nop>' },

          { 'n', map.scroll_down, actions.scroll_view(0.25), { desc = 'Scroll the view down' } },
          { 'n', map.scroll_up, actions.scroll_view(-0.25), { desc = 'Scroll the view up' } },

          { 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
          { 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },

          { 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', '<Cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', 'l', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', 'h', actions.close_fold, { desc = 'Collapse fold' } },

          { 'n', map.sl_next_entry, actions.select_next_entry, { desc = 'Open the diff for the next file' } },
          { 'n', map.sl_prev_entry, actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },

          { 'n', map.goto_file_c, goto_file_and_close, { desc = 'Open the file in the previous tabpage and close' } },
          { 'n', map.goto_file, actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },

          { 'n', 'g.', actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },

          { 'n', map.toggle_files, actions.toggle_files, { desc = 'Toggle the file panel' } },
          { 'n', map.cycle_layout, actions.cycle_layout, { desc = 'Cycle available layouts' } },

          { 'n', map.prev_conflict, actions.prev_conflict, { desc = 'Go to the previous conflict' } },
          { 'n', map.next_conflict, actions.next_conflict, { desc = 'Go to the next conflict' } },

          { 'n', map.choose_ours, actions.conflict_choose_all('ours'), { desc = 'Choose current git conflict' } },
          { 'n', map.choose_theirs, actions.conflict_choose_all('theirs'), { desc = 'Choose merged git conflict' } },
          { 'n', map.choose_both, actions.conflict_choose_all('all'), { desc = 'Choose both git conflicts' } },
          { 'n', map.choose_none, actions.conflict_choose_all('none'), { desc = 'Choose neither of git conflicts' } },

          { 'n', map.help, actions.help('file_panel'), { desc = 'Open the help panel' } },
          { 'n', map.close, '<cmd>DiffviewClose<CR>', { desc = 'Close diffview' } },
        },
        file_history_panel = {
          { 'n', map.restore, actions.restore_entry, { desc = 'Restore file to the state from the selected entry' } },

          { 'n', 'gd', actions.open_in_diffview, { desc = 'Open the entry under the cursor in a diffview' } },
          { 'n', map.open_log, actions.open_commit_log, { desc = 'Show commit details' } },
          { 'n', 'gy', actions.copy_hash, { desc = 'Copy the commit hash of the entry under the cursor' } },

          { 'n', map.nohl, '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' } },
          { 'n', '<C-j>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', '<C-k>', actions.close_fold, { desc = 'Collapse fold' } },
          { 'n', '<C-l>', actions.options, { desc = 'Open the option panel' } },

          { 'n', map.scroll_down, actions.scroll_view(0.25), { desc = 'Scroll the view down' } },
          { 'n', map.scroll_up, actions.scroll_view(-0.25), { desc = 'Scroll the view up' } },

          { 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
          { 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },

          { 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', '<Cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', 'l', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
          { 'n', 'h', actions.close_fold, { desc = 'Collapse fold' } },

          { 'n', map.sl_next_entry, actions.select_next_entry, { desc = 'Open the diff for the next file' } },
          { 'n', map.sl_prev_entry, actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },

          { 'n', map.goto_file_c, goto_file_and_close, { desc = 'Open the file in the previous tabpage and close' } },
          { 'n', map.goto_file, actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },

          { 'n', map.toggle_files, actions.toggle_files, { desc = 'Toggle the file panel' } },
          { 'n', map.cycle_layout, actions.cycle_layout, { desc = 'Cycle available layouts' } },
          { 'n', map.help, actions.help('file_history_panel'), { desc = 'Open the help panel' } },
          { 'n', map.close, '<cmd>DiffviewClose<CR>', { desc = 'Close diffview' } },
        },
        option_panel = {
          { 'n', '<C-j>', actions.select_entry, { desc = 'Change the current option' } },
          { 'n', '<CR>', actions.select_entry, { desc = 'Change the current option' } },
          { 'n', map.help, actions.help('option_panel'), { desc = 'Open the help panel' } },
          { 'n', map.nohl, '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' } },
          { 'n', map.close, actions.close, { desc = 'Close the panel' } },
        },
        help_panel = {
          { 'n', map.nohl, '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' } },
          { 'n', map.close, actions.close, { desc = 'Close help menu' } },
        },
      },
    })

    vim.keymap.set('n', '<leader>G', '<cmd>DiffviewOpen<CR>', { desc = 'Open git diffview for file changes' })
    vim.keymap.set('n', '<leader>v', '<cmd>DiffviewFileHistory<CR>', { desc = 'Open git diffview history' })
    vim.keymap.set('n', '<leader>V', '<cmd>DiffviewFileHistory %<CR>', { desc = 'Open git diffview history for file' })
  end,
}
