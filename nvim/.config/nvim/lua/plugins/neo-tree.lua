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
    local icons = require('custom.icons')

    require('custom.helpers').map_ctrl_j({ 'neo-tree', 'neo-tree-popup' })
    require('neo-tree').setup({
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'disabled', -- Wheater to use neo-tree as default file explorer
        filtered_items = {
          visible = true, -- Enable hidden files initially
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
          ['<C-e>'] = 'none',
          ['<bs>'] = 'none',
          ['s'] = 'none',
          ['S'] = 'none',
          ['<C-f>'] = 'none',
          ['<C-b>'] = 'none',

          ['l'] = 'open',
          ['<C-k>'] = 'close_node',
          ['h'] = 'close_node',
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

    -- Toggle window, highlight current file, move cursor
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle focus left<CR>', { desc = 'Explore tree (neo-tree)' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'neo-tree-popup',
      callback = function()
        vim.keymap.set('i', '<C-f>', '<Right>', { buffer = true })
        vim.keymap.set('i', '<C-b>', '<Left>', { buffer = true })
        vim.keymap.set('i', '<C-a>', '<Home>', { buffer = true })
        vim.keymap.set('i', '<C-e>', '<End>', { buffer = true })
      end,
    })
  end,
}
