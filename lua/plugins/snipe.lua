return {
  'leath-dub/snipe.nvim',
  config = function()
    local snipe = require('snipe')

    snipe.setup({
      ui = {
        position = 'center',
      },
      hints = {
        dictionary = '-0123456789qwertyuiopasfgzxcvbnm',
      },
      navigate = {
        close_buffer = 'd',
        next_page = 'J',
        prev_page = 'K',
        cancel_snipe = '<esc>',
        under_cursor = '<cr>',
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
