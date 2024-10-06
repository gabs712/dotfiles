return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  config = function()
    local flash = require('flash')

    flash.setup({
      search = {
        multi_window = true,
        exclude = {
          'notify',
          'cmp_menu',
          'noice',
          'flash_prompt',
          function(win)
            -- exclude non-focusable windows
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      highlight = {
        backdrop = true, -- When searching, fade out text
        matches = true, -- Highlights text as you type
        groups = {
          current = 'FlashMatch', -- Does not show different color to first match
        },
      },
      modes = {
        char = {
          enabled = false,
          highlight = {
            backdrop = false, -- Fade out text with f/t
          },
        },
        treesitter_search = {
          label = {
            rainbow = {
              enabled = true,
            },
          },
        },
      },
    })

    vim.keymap.set({ 'n', 'x', 'o' }, 's', flash.jump, { desc = 'Flash jump' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', flash.treesitter_search, { desc = 'Flash jump to range' })
    vim.keymap.set('o', 'r', flash.remote, { desc = 'Flash realocate' })
  end,
}
