return {
  'windwp/nvim-autopairs',
  config = function()
    local pairs = require('nvim-autopairs')

    pairs.setup({
      disable_filetype = {
        'TelescopePrompt',
        'harpoon',
        'dap-repl',
        'dapui_watches',
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

    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')

    pairs.add_rules({
      Rule('<!--', '-->', { 'ejs' }):with_cr(cond.none()),
      Rule('>[%w%s]*$', '^%s*</', { 'ejs' }):only_cr():use_regex(true),
    })

    -- Indent pairs with C-j
    vim.keymap.set('i', '<C-j>', '<CR>', { remap = true })
  end,
}
