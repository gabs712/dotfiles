return {
  'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.g.mkdp_auto_close = 0 -- Closes tab afer exiting buffer
    vim.g.mkdp_refresh_slow = 0 -- Refreshes only after exiting insert mode
    vim.g.mkdp_page_title = '「${name}」' -- Page title
    vim.g.mkdp_combine_preview = 0 -- Uses single page when calling multiple times
  end,
}
