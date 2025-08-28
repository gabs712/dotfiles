return {
  'danymat/neogen',
  dependencies = {
    'L3MON4D3/LuaSnip',
  },
  keys = {
    { 'gaa', '<cmd>Neogen func<CR>', desc = 'Annotate function' },
    { 'gaf', '<cmd>Neogen func<CR>', desc = 'Annotate function' },
    { 'gad', '<cmd>Neogen file<CR>', desc = 'Annotate document' },
    { 'gat', '<cmd>Neogen type<CR>', desc = 'Annotate type' },
    { 'gao', '<cmd>Neogen class<CR>', desc = 'Annotate class (object)' },
    { 'gaD', '<cmd>Neogen declaration<CR>', desc = 'Annotate declaration' },
    { 'gap', '<cmd>Neogen property<CR>', desc = 'Annotate property' },
  },
  config = function()
    require('neogen').setup({
      snippet_engine = 'luasnip',
      placeholders_hl = 'None',
      enable_placeholders = false,

      -- Exemple for changing annotation:
      -- languages = {
      --   lua = {
      --     template = {
      --       annotation_convention = 'emmylua',
      --     },
      --   },
      -- },
    })
  end,
}
