local cmp = require('cmp')

cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, require('custom.nvim-cmp.completions.dap'))

cmp.setup.filetype({ 'javascriptreact', 'typescriptreact' }, require('custom.nvim-cmp.completions.jsx-tsx'))
cmp.setup.filetype('html', require('custom.nvim-cmp.completions.html'))
cmp.setup.filetype('css', require('custom.nvim-cmp.completions.css'))
cmp.setup.filetype('ejs', require('custom.nvim-cmp.completions.ejs'))
