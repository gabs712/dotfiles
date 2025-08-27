return {
  'brenoprata10/nvim-highlight-colors',
  keys = function()
    local enabled = false

    return {
      {
        '<leader>a',
        function()
          require('nvim-highlight-colors').toggle()
          enabled = not enabled

          if enabled then
            vim.notify('Color highlight enabled')
          else
            vim.notify('Color highlight disabled')
          end
        end,
        desc = 'Alternate color highlight',
      },
    }
  end,
  config = function()
    local hl_colors = require('nvim-highlight-colors')

    hl_colors.setup()
    hl_colors.turnOff()
  end,
}
