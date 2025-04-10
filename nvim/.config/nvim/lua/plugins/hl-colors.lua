return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    local hl_colors = require('nvim-highlight-colors')
    hl_colors.setup()

    hl_colors.turnOff()

    local enabled = false
    vim.keymap.set('n', '<leader>c', function()
      hl_colors.toggle()
      enabled = not enabled

      if enabled then
        vim.notify('Color highlight enabled')
      else
        vim.notify('Color highlight disabled')
      end
    end, { desc = 'Toggle colors highlight' })
  end,
}
