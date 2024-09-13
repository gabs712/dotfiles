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

vim.cmd('nmap <c-w>h <c-w>h<c-w>')
vim.cmd('xmap <c-w>h <c-w>h<c-w>')
vim.cmd('nmap <c-w>j <c-w>j<c-w>')
vim.cmd('xmap <c-w>j <c-w>j<c-w>')
vim.cmd('nmap <c-w>k <c-w>k<c-w>')
vim.cmd('xmap <c-w>k <c-w>k<c-w>')
vim.cmd('nmap <c-w>l <c-w>l<c-w>')
vim.cmd('xmap <c-w>l <c-w>l<c-w>')

vim.cmd('nmap <c-w>H <c-w>H<c-w>')
vim.cmd('xmap <c-w>H <c-w>H<c-w>')
vim.cmd('nmap <c-w>J <c-w>J<c-w>')
vim.cmd('xmap <c-w>J <c-w>J<c-w>')
vim.cmd('nmap <c-w>K <c-w>K<c-w>')
vim.cmd('xmap <c-w>K <c-w>K<c-w>')
vim.cmd('nmap <c-w>L <c-w>L<c-w>')
vim.cmd('xmap <c-w>L <c-w>L<c-w>')

vim.cmd('nmap <C-w>. <cmd>vertical resize +5<cr><C-w>')
vim.cmd('xmap <C-w>. <cmd>vertical resize +5<cr><C-w>')
vim.cmd('nmap <C-w>, <cmd>vertical resize -5<cr><C-w>')
vim.cmd('xmap <C-w>, <cmd>vertical resize -5<cr><C-w>')
vim.cmd('nmap <C-w>> <cmd>horizontal resize +5<cr><C-w>')
vim.cmd('xmap <C-w>> <cmd>horizontal resize +5<cr><C-w>')
vim.cmd('nmap <C-w>< <cmd>horizontal resize -5<cr><C-w>')
vim.cmd('xmap <C-w>< <cmd>horizontal resize -5<cr><C-w>')

-- Free space for s
vim.keymap.set({'n', 'x'}, 'R', 's')
vim.keymap.set({'n', 'x'}, 'gR', 'R')

-- Add relative jumps to jump list
vim.cmd("nnoremap <expr> j v:count ? (v:count > 1 ? \"m'\" . v:count : '') . 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? (v:count > 1 ? \"m'\" . v:count : '') . 'k' : 'gk'")

-- Alternative to scroll
vim.keymap.set({'n', 'x'}, '<Up>', '<C-y>')
vim.keymap.set({'n', 'x'}, '<Down>', '<C-e>')
vim.keymap.set({'n', 'x'}, '<Left>', '<C-u>')
vim.keymap.set({'n', 'x'}, '<Right>', '<C-d>')

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

