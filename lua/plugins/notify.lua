return {
  'rcarriga/nvim-notify',
  config = {
    require('notify').setup({
      timeout = 3000,
      stages = 'static', -- static, fade, fade_in_slide_out, slide
      render = 'minimal', -- minimal, wrapped-compact, compact, simple, default
      minimum_width = 0, -- 43

      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    }),
  },
}
