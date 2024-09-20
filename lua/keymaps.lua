vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

-- Window navigation
vim.keymap.set({'n', 'x'}, '<A-h>', '<C-w><C-h>', { desc = 'Window left' })
vim.keymap.set({'n', 'x'}, '<A-j>', '<C-w><C-j>', { desc = 'Window bottom' })
vim.keymap.set({'n', 'x'}, '<A-k>', '<C-w><C-k>', { desc = 'Window top' })
vim.keymap.set({'n', 'x'}, '<A-l>', '<C-w><C-l>', { desc = 'Window right' })

vim.keymap.set({'n', 'x'}, '<Space>', '<Nop>')
vim.keymap.set('c', '<C-d>', '<Nop>') -- Can cause some weird behavior with plugins

-- With strings, when using "a" on operator-pending mode or visual modes, not include extra whitespace
vim.keymap.set({'o', 'x'}, "a'", "2i'")
vim.keymap.set({'o', 'x'}, 'a"', "2i\"")
vim.keymap.set({'o', 'x'}, 'a`', "2i`")

-- Make underscore behavior consistent
vim.keymap.set({'n', 'o', 'x'}, '_', '^')
vim.keymap.set({'n', 'o', 'x'}, 'g_', 'g^')

-- Move through wrap and use normal j/k when providing a counter
vim.keymap.set({'n', 'x'}, "v:count == 0 ? 'gj' : 'j'", 'gj')
vim.keymap.set({'n', 'x'}, "v:count == 0 ? 'gk' : 'k'", 'gk')

-- Add relative jumps to jump list
vim.cmd("nnoremap <expr> j v:count ? (v:count > 0 ? \"m'\" . v:count : '') . 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? (v:count > 0 ? \"m'\" . v:count : '') . 'k' : 'gk'")

-- Clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Yank to OS'})
vim.keymap.set({'n', 'x'}, 'gY', '"+y$', {desc = 'Yank remaining line to OS'})

vim.keymap.set({'n', 'x'}, '<C-\'>', '<cmd>buffer #<CR>', {desc = 'Go to most recent buffer'})

-- Weird tab bug. When mapping something to tab, <c-i> is also mapped to it.
-- To fix it, <c-i> is mapped to tab (it doesn't really make any sense).
vim.keymap.set('n', '<c-i>', '<tab>', { desc = 'To fix bug. Has no effect.' })

-- The same happens with <CR>
vim.keymap.set('n', '<CR>', '<C-m>', { desc = 'To fix bug. Has no effect.' })

-- Improve repetitive window movements
vim.keymap.set({'n', 'x'}, '<C-w><C-w>', '<Nop>')

vim.keymap.set({ 'n', 'x' }, '<c-w>h', '<c-w>h<c-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<c-w>j', '<c-w>j<c-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<c-w>k', '<c-w>k<c-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<c-w>l', '<c-w>l<c-w>', {remap = true})

vim.keymap.set({ 'n', 'x' }, '<c-w>H', '<c-w>H<c-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<c-w>J', '<c-w>J<c-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<c-w>K', '<c-w>K<c-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<c-w>L', '<c-w>L<c-w>', {remap = true})

vim.keymap.set({ 'n', 'x' }, '<C-w>.', '<cmd>vertical resize +5<cr><C-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<C-w>,', '<cmd>vertical resize -5<cr><C-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<C-w>>', '<cmd>horizontal resize +5<cr><C-w>', {remap = true})
vim.keymap.set({ 'n', 'x' }, '<C-w><', '<cmd>horizontal resize -5<cr><C-w>', {remap = true})

-- Free gr keys
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grn')

-- Free space for s
vim.keymap.set({'n', 'x'}, 'R', 's')

-- Alternatives to scroll also keeping cursor at center
vim.keymap.set({'n', 'x'}, '<Left>', '<C-y>0M')
vim.keymap.set({'n', 'x'}, '<Right>', '<C-e>0M')
vim.keymap.set({'n', 'x'}, '<Up>', '<C-u>0M')
vim.keymap.set({'n', 'x'}, '<Down>', '<C-d>0M')
vim.keymap.set({'n', 'x'}, '<ScrollWheelUp>', '<ScrollWheelUp>0M')
vim.keymap.set({'n', 'x'}, '<ScrollWheelDown>', '<ScrollWheelDown>0M')

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Write file (save)' })

-- Fix indentation absence with autopairs when using C-j
vim.keymap.set({'i', 'o'}, '<C-j>', '<CR>', {remap = true})

-- Alternative to ':'
vim.keymap.set({ 'n', 'x' }, '<C-p>', ':', {desc = 'Command mode (pallete)'})

-- Quick comments
vim.keymap.set('n', '<C-c>', 'gcc', {remap = true})
vim.keymap.set('x', '<C-c>', 'gc', {remap = true})

