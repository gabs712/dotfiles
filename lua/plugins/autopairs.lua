return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = {
        'TelescopePrompt',
        'spectre_panel',
        'harpoon',
      },
      -- Avoid buggy / iconsistent behavior on those modes
      disable_in_macro = true,
      disable_in_replace_mode = true,
      disable_in_visualblock = true,

      -- Delete pairs with those
      map_cr = true,
      map_bs = true,
      map_c_h = true,
      map_c_w = true,
    })
  end,
}
