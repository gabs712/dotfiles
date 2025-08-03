return {
  'leath-dub/snipe.nvim',
  config = function()
    require('utils.ft').clear_c_hjkl('snipe-menu', { bind_c_j = true })
    require('utils.ft').bind_close_win('snipe-menu', 'close')

    local snipe = require('snipe')
    local toggle_binding = '<leader>o'

    snipe.setup({
      ui = {
        position = 'center',
      },
      hints = {
        dictionary = '-qwertyuiopasdfhlzxcvbnm,.;/QWERTYUIOPASFGHLZXCVBNM',
      },
      navigate = {
        close_buffer = 'D',
        next_page = 'J',
        prev_page = 'K',
        cancel_snipe = { toggle_binding },
      },
      sort = 'last', -- last / default
    })

    vim.keymap.set('n', toggle_binding, function()
      snipe.open_buffer_menu()
      vim.cmd('norm! gg0')
    end, { desc = 'Show oldfiles for buffers' })
  end,
}
