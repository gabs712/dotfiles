-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Disable default behavior of Space in normal mode
vim.keymap.set('n', '<Space>', '<Nop>')

-- Window resize
vim.keymap.set("n", "=", '<cmd>vertical resize +5<cr>')
vim.keymap.set("n", "-", '<cmd>vertical resize -5<cr>')
vim.keymap.set("n", "+", '<cmd>horizontal resize +2<cr>')
vim.keymap.set("n", "_", '<cmd>horizontal resize -2<cr>')
