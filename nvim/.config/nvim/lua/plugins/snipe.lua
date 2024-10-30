return {
  'leath-dub/snipe.nvim',
  config = function()
    require('custom.helpers').map_ctrl_j('snipe-menu')
    local snipe = require('snipe')

    snipe.setup({
      ui = {
        position = 'center',
      },
      hints = {
        dictionary = '-0123456789qwertyuiopasdfghlzxcvbnm,.;/',
      },
      navigate = {
        close_buffer = 'D',
        next_page = 'J',
        prev_page = 'K',
        cancel_snipe = '-',
      },
      sort = 'last', -- last / default
    })

    vim.keymap.set('n', '-', function()
      snipe.open_buffer_menu({
        max_path_width = 2, -- Displayed path depth
      })
    end, { desc = 'Open snipe' })
  end,
}
