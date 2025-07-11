local cmp = require('cmp')

cmp.setup.filetype('oil', { enabled = false })
cmp.setup.filetype('harpoon', { sources = cmp.config.sources({ { name = 'path' } }) })
cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, require('custom.nvim-cmp.completions.nvim-dap'))

cmp.setup.filetype({ 'javascriptreact', 'typescriptreact' }, require('custom.nvim-cmp.completions.jsx-tsx'))
cmp.setup.filetype('html', require('custom.nvim-cmp.completions.html'))
cmp.setup.filetype({ 'css', 'scss' }, require('custom.nvim-cmp.completions.css'))
cmp.setup.filetype('ejs', require('custom.nvim-cmp.completions.ejs'))

cmp.setup.filetype('prisma', {
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  }),
})
