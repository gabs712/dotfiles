return {
  enabled = true,
  'zaldih/themery.nvim',
  config = function()
    -- Minimal config
    require('themery').setup({
      themes = {
        'dracula',
        'dracula-soft',
        'catppuccin',
        'catppuccin-frappe',
        'tokyonight',
        'tokyonight-storm',
        'tokyonight-night',
      },
      livePreview = true,
    })

    vim.keymap.set('n', '<leader>t', '<cmd>Themery<cr>')
  end,
}
