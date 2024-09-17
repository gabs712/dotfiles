vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

-- Window navigation
vim.keymap.set({'n', 'x'}, '<A-h>', '<C-w><C-h>', { desc = 'Window left' })
vim.keymap.set({'n', 'x'}, '<A-j>', '<C-w><C-j>', { desc = 'Window bottom' })
vim.keymap.set({'n', 'x'}, '<A-k>', '<C-w><C-k>', { desc = 'Window top' })
vim.keymap.set({'n', 'x'}, '<A-l>', '<C-w><C-l>', { desc = 'Window right' })

vim.keymap.set({'n', 'x'}, '<Space>', '<Nop>')

-- With strings, when using "a" on operator-pending mode or visual modes, not include extra whitespace
vim.keymap.set({'o', 'x'}, "a'", "2i'")
vim.keymap.set({'o', 'x'}, 'a"', "2i\"")
vim.keymap.set({'o', 'x'}, 'a`', "2i`")

-- Make underscore behavior consistent
vim.keymap.set({'n', 'o', 'x'}, '_', '^')
vim.keymap.set({'n', 'o', 'x'}, 'g_', 'g^')

-- Move through wrap 
vim.keymap.set({'n', 'x'}, 'j', 'gj')
vim.keymap.set({'n', 'x'}, 'k', 'gk')
vim.keymap.set({'n', 'x'}, 'gj', 'j')
vim.keymap.set({'n', 'x'}, 'gk', 'k')

-- Clipboard
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste from OS after'})
vim.keymap.set({'n', 'x'}, 'gP', '"+P', {desc = 'Paste from OS before'})

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

-- Free space for s
vim.keymap.set({'n', 'x'}, 'R', 's')
vim.keymap.set({'n', 'x'}, '<C-r>', 'R')

vim.keymap.set({'n', 'x'}, 'U', '<C-r>')

-- Add relative jumps to jump list
vim.cmd("nnoremap <expr> j v:count ? (v:count > 1 ? \"m'\" . v:count : '') . 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? (v:count > 1 ? \"m'\" . v:count : '') . 'k' : 'gk'")

-- Alternatives to scroll
vim.keymap.set({'n', 'x'}, '<Left>', '<C-y>')
vim.keymap.set({'n', 'x'}, '<Right>', '<C-e>')
vim.keymap.set({'n', 'x'}, '<Up>', '<C-u>')
vim.keymap.set({'n', 'x'}, '<Down>', '<C-d>')

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Write file (save)' })

-- Fix indentation absence with autopairs when using C-j
vim.keymap.set('i', '<C-j>', '<CR>', {remap = true})

-- Alternative to ':'
vim.keymap.set({ 'n', 'x' }, '<C-p>', ':', {desc = 'Command mode (pallete)'})

vim.keymap.set('n', '<F1>', 'K', { desc = 'Original manual entry, can jump through table of contents on help pages'} )

-- Quick comments
vim.keymap.set('n', '<C-c>', 'gcc', {remap = true})
vim.keymap.set('x', '<C-c>', 'gc', {remap = true})

