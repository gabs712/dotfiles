vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'hide highlight' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'window left' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'window bottom' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'window top' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'window right' })

vim.keymap.set('n', '<Space>', '<Nop>', { desc = 'Disable default space' })

-- window resize
vim.keymap.set("n", "<C-Right>", '<cmd>vertical resize +5<cr>', { desc = 'vertical increase' })
vim.keymap.set("n", "<C-Left>", '<cmd>vertical resize -5<cr>', { desc = 'vertical decrease' })
vim.keymap.set("n", "<C-Up>", '<cmd>horizontal resize +2<cr>', { desc = 'horizontal increase' })
vim.keymap.set("n", "<C-Down>", '<cmd>horizontal resize -2<cr>', { desc = 'horizontal decrease' })

