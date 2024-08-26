vim.keymap.set('n', '<Esc>', '<cmd>stopinsert<CR><cmd>nohlsearch<CR>', { desc = 'Clean notifications and highlights' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Window left' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Window bottom' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Window top' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Window right' })

vim.keymap.set('n', '<Space>', '<Nop>')

-- Window resize
vim.keymap.set("n", "<C-Up>", '<cmd>vertical resize +5<cr>', { desc = 'Window vertical increase' })
vim.keymap.set("n", "<C-Down>", '<cmd>vertical resize -5<cr>', { desc = 'Window vertical decrease' })
vim.keymap.set("n", "<C-Right>", '<cmd>horizontal resize +2<cr>', { desc = 'Window horizontal increase' })
vim.keymap.set("n", "<C-Left>", '<cmd>horizontal resize -2<cr>', { desc = 'Window horizontal decrease' })

-- With strings, when using "a" on operator-pending mode or visual modes, not include extra whitespace
vim.keymap.set({'o', 'x'}, "a'", "2i'")
vim.keymap.set({'o', 'x'}, 'a"', "2i\"")
vim.keymap.set({'o', 'x'}, 'a`', "2i`")

-- Make underscore behavior consistent
vim.keymap.set('o', '_', '^')

-- Move through wrap 
vim.keymap.set({'n', 'x'}, 'j', 'gj')
vim.keymap.set({'n', 'x'}, 'k', 'gk')

-- Clipboard
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste from OS after'})
vim.keymap.set({'n', 'x'}, 'gP', '"+P', {desc = 'Paste from OS before'})

vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Yank to OS'})
vim.keymap.set({'n', 'x'}, 'gY', '"+y$', {desc = 'Yank remaining line to OS'})

vim.keymap.set('n', '<C-\'>', '<cmd>buffer #<CR>', {desc = 'Go to most recent buffer'})

