return {
  enabled = true,
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup({
      routes = {
        -- Disable popups for undos
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = '(%d+)%s*.-;%s*.-#(%d+)',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'Already at newest change',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'Already at oldest change',
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
      views = {
        -- Notification fallback if notify not present
        mini = {
          timeout = 1500, -- 2000
          reverse = false, -- true
          position = {
            row = 0, -- -1
          },
          -- size = 80
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
    vim.keymap.set({ 'n', 'x' }, '<leader>n', '<cmd>Noice telescope<CR>', { desc = 'Notifications' })
  end,
}
