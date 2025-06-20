return {
  'leath-dub/snipe.nvim',
  config = function()
    require('custom.helpers').map_ctrl_j('snipe-menu')
    local snipe = require('snipe')
    local toggle_binding = '<leader>o'

    snipe.setup({
      ui = {
        position = 'center',
      },
      hints = {
        dictionary = '-qwertyuiopasdfghlzxcvbnm,.;/QWERTYUIOPASFGHLZXCVBNM',
      },
      navigate = {
        close_buffer = 'D',
        next_page = 'J',
        prev_page = 'K',
        cancel_snipe = toggle_binding,
      },
      sort = 'last', -- last / default
    })

    vim.keymap.set('n', toggle_binding, snipe.open_buffer_menu, { desc = 'Open snipe (out)' })
  end,
}
