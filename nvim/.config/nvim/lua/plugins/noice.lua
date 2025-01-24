return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('custom.helpers').clear_ctrl('noice')
    require('noice').setup({
      routes = {
        -- Disable popups for undos
        {
          filter = {
            event = 'msg_show',
            find = '(%d+)%s.-;%s.-%s#(%d+)%s%s',
          },
          opts = { skip = true },
        },
        -- Popups when using "*" or "#" on visual mode
        {
          filter = {
            event = 'msg_show',
            find = '^%s*W?%s?%[%d+/%d+%]$',
          },
          opts = { skip = true },
        },
        -- cnext/cprev throws errors when reaching last item, annoying call stack with repeatable movements
        {
          filter = {
            event = 'msg_show',
            find = 'E553: No more items',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            find = 'written$',
          },
          opts = { skip = true },
        },
      },

      lsp = {
        progress = { enabled = false }, -- Disable lsp notifications
        hover = { silent = true }, -- Disable hover notification when not avaliable
        signature = {
          auto_open = { enabled = false },
        },
      },
      cmdline = {
        view = 'cmdline', -- cmdline, cmdline_popup

        -- Basically ligatures for commands
        format = {
          -- cmdline = false,
          -- search_down = false,

          -- Change search icon
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' }, --  

          lua = false,
          help = false,
          filter = false, -- ! (bang)
        },
      },
      messages = {
        view_search = false,
      },
    })

    require('telescope').load_extension('noice')
    --BUG: "Noice telescope" not working. Currently using "messages" instead
    -- vim.keymap.set('n', '<leader>n', '<cmd>Noice telescope<CR>', { desc = 'Notifications' })
    vim.keymap.set('n', '<leader>n', '<cmd>messages<CR>', { desc = 'Notifications' })
  end,
}
