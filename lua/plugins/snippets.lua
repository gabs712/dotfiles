return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets", -- Extra snippets
  },
  config = function ()
    -- Loads snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local luasnip = require("luasnip")

    vim.keymap.set({'i', 's'}, '<C-l>', function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { desc = 'Jump to next snippet' })
    vim.keymap.set({'i', 's'}, '<C-k>', function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { desc = 'Jump to previous snippet' })
  end
}

