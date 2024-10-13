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
        'rose-pine',
        'kanagawa',
        'nightfox',
        'github_dark',
        'onedark',
      },
      livePreview = true,
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>t', '<cmd>Themery<cr>')
  end,
}
