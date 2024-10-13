return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      local icons = require('custom.icons')

      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = false, -- Enable hidden files when opening a window
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {},
            hide_by_pattern = {}, -- Glob syntax
            always_show = {},
          },
        },
        close_if_last_window = true,
        window = {
          width = 32,
          mappings = {
            ['<space>'] = 'none',
            ['<C-f>'] = 'none',
            ['<C-e>'] = 'none',
            ['<bs>'] = 'none',
            ['s'] = 'none',
            ['S'] = 'none',
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['<C-s>'] = 'open_split',
            ['<C-v>'] = 'open_vsplit',
            ['<C-u>'] = { 'scroll_preview', config = { direction = 10 } },
            ['<C-d>'] = { 'scroll_preview', config = { direction = -10 } },
            ['<Left>'] = { 'scroll_preview', config = { direction = 10 } },
            ['<Right>'] = { 'scroll_preview', config = { direction = -10 } },
          },
        },
        default_component_configs = {
          modified = {
            symbol = '',
            highlight = 'NeoTreeModified',
          },
          indent = {
            with_markers = true, -- Enable indentation
            indent_marker = '│',
            last_indent_marker = '└',
            indent_size = 2,

            with_expanders = false,
            expander_collapsed = '',
            expander_expanded = '',
          },
          enable_git_status = true,
          git_status = {
            symbols = {
              -- Change type
              added = icons.git.added,
              deleted = icons.git.deleted,
              modified = icons.git.modified,
              renamed = icons.git.renamed,
              -- Status type
              untracked = icons.git.untracked,
              ignored = '', -- 
              unstaged = '', -- 󰄱
              staged = '', -- 
              conflict = '', -- 
            },
          },
          diagnostics = {
            symbols = {
              hint = icons.diagnostics.hint, -- 󰌵
              info = icons.diagnostics.info, -- 
              warn = icons.diagnostics.warn, -- 
              error = icons.diagnostics.error, -- 
            },
          },
        },
      })

      -- Toggle window, highlight current file, move cursor
      vim.keymap.set({ 'n', 'x' }, '<leader>e', '<cmd>Neotree toggle reveal focus left<CR>', { desc = 'Explore tree' })
    end,
  },
}
