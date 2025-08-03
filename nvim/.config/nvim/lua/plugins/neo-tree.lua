-- NOTE: file-operations doesn't work if updating neotree

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'antosha417/nvim-lsp-file-operations', -- Lsp rename
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local icons = require('utils.icons')

    require('utils.ft').clear_c_hjkl('neo-tree', { bind_c_j = true })
    require('utils.ft').bind_shell_movements('neo-tree-popup')

    require('neo-tree').setup({
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'disabled', -- Wheater to use neo-tree as default file explorer
        filtered_items = {
          visible = true, -- Enable hidden files initially
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_by_name = {},
          hide_by_pattern = {}, -- Glob syntax
          always_show = {},
        },
      },
      close_if_last_window = true,
      window = {
        width = 36,
        mappings = {
          ['<C-e>'] = 'none',
          ['<bs>'] = 'none',
          ['s'] = 'none',
          ['S'] = 'none',
          ['H'] = 'none',
          ['/'] = 'none',
          ['?'] = 'none',
          ['<C-f>'] = 'none',
          ['<C-b>'] = 'none',
          ['<Esc>'] = 'none',
          ['.'] = 'none',

          ['g?'] = 'show_help',
          ['g.'] = 'toggle_hidden',

          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<C-k>'] = 'close_node',
          ['<C-s>'] = 'open_split',
          ['<C-v>'] = 'open_vsplit',
          ['K'] = { 'scroll_preview', config = { direction = 10 } },
          ['J'] = { 'scroll_preview', config = { direction = -10 } },
          ['<Left>'] = { 'scroll_preview', config = { direction = 10 } },
          ['<Right>'] = { 'scroll_preview', config = { direction = -10 } },
        },
      },
      default_component_configs = {
        modified = {
          symbol = icons.buffer.modified,
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
            hint = icons.diagnostics.hint,
            info = icons.diagnostics.info,
            warn = icons.diagnostics.warn,
            error = icons.diagnostics.error,
          },
        },
      },
    })
    require('lsp-file-operations').setup()

    local preview = require('neo-tree.sources.common.preview')
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'neo-tree',
      callback = function()
        vim.keymap.set('n', '<Esc>', function()
          if preview.is_active() then
            preview.hide()
          else
            require('utils.close_win')('Neotree close')
          end
        end, { buffer = true })
      end,
    })

    -- Toggle window, highlight current file, move cursor
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle focus left<CR>', { desc = 'Explore tree (neo-tree)' })
  end,
}
