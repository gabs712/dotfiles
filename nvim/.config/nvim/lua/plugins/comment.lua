return {
  'numToStr/Comment.nvim', -- Enhances comment motions
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring', -- Context aware comments (ex. jsx)
  },
  config = function()
    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })

    require('Comment').setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
}
