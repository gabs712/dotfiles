return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = {
        'TelescopePrompt',
        'spectre_panel',
        'harpoon',
      },
      map_c_h = true,
      map_c_w = true,
    })

    -- Indent with C-l
    vim.keymap.set('!', '<C-l>', '<C-m>', {remap = true})
  end
}

