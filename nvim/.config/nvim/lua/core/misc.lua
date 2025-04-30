-- Sets extensions for ejs and treat's it as html on treesitter (lsp is configured separately)
vim.filetype.add({
  extension = {
    ejs = 'ejs',
  },
})

vim.treesitter.language.register('html', 'ejs')
