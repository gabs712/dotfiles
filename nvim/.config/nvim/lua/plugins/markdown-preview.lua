return {
  'iamcco/markdown-preview.nvim',
  config = function()
    vim.fn['mkdp#util#install']() -- Install dependencies

    vim.g.mkdp_auto_close = 0 -- Closes tab afer exiting buffer
    vim.g.mkdp_refresh_slow = 0 -- Refreshes only after exiting insert mode
    vim.g.mkdp_page_title = '「${name}」' -- Page title
    vim.g.mkdp_combine_preview = 0 -- Uses single page when calling multiple times
  end,
}
