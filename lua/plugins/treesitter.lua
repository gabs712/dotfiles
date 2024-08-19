return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    require("nvim-treesitter.configs").setup({
      ensure_installed = { 'lua', 'html', 'javascript', 'css', 'bash', 'c', 'markdown', 'markdown_inline', 'csv', 'json', 'python', 'scss', 'typescript' },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
