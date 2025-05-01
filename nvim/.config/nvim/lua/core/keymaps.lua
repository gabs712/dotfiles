-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear keys (keep close to top to avoid side effects)
vim.keymap.set({ 'n', 'x', 's' }, '<C-b>', '<Nop>')
vim.keymap.set({ 'n', 'x', 's' }, '<C-f>', '<Nop>')
vim.keymap.set('c', '<C-d>', '<Nop>') -- Causes conflicts with completion
vim.keymap.set({ 'n', 'x' }, '<Space>', '<Nop>')
vim.keymap.set({ 'n', 'x' }, '<C-w><C-w>', '<Nop>')

vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gri')

-- Dismiss highlights and floating windows
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohlsearch')

  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = 'Clear highlights and popups' })

vim.keymap.set(
  'n',
  '<C-Space>',
  require('custom.helpers').switch_to_previous_buffer,
  { desc = 'Switch to the previous buffer' }
)

vim.keymap.set(
  'n',
  '<BS>',
  require('custom.helpers').switch_to_previous_buffer,
  { desc = 'Switch to the previous buffer' }
)

-- <C-j> works with plugins that remap <CR> (ie. autopairs)
vim.keymap.set('i', '<C-j>', '<CR>', { remap = true })

-- Lsp
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol across project' })
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Diagnostics popup' })

-- Undo
vim.keymap.set('n', '(', 'g-', { desc = 'Undo non-lineraly' })
vim.keymap.set('n', ')', 'g+', { desc = 'Redo non-lineraly' })

-- Shell-like command movements
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

-- Facilitate indent
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

-- Alternative to ge
vim.keymap.set({ 'n', 'x', 'o' }, '<C-b>', 'ge', { desc = 'Go to the end of last word', remap = true })

-- With strings, when using "a" on operator-pending mode or visual modes, not include extra whitespace
vim.keymap.set({ 'o', 'x' }, "a'", "2i'")
vim.keymap.set({ 'o', 'x' }, 'a"', '2i"')
vim.keymap.set({ 'o', 'x' }, 'a`', '2i`')

-- Make underscore behavior consistent
vim.keymap.set({ 'n', 'o', 'x' }, '_', '^')
vim.keymap.set({ 'n', 'o', 'x' }, 'g_', 'g^')

-- Move through wrap and use normal j/k when providing a counter
vim.keymap.set({ 'n', 'x' }, 'k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true })

vim.keymap.set({ 'n', 'x' }, 'j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true })

-- Add relative jumps to jump list
vim.cmd("nnoremap <expr> j v:count ? (v:count > 0 ? \"m'\" . v:count : '') . 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? (v:count > 0 ? \"m'\" . v:count : '') . 'k' : 'gk'")

-- Clipboard to OS
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Yank to OS' })
vim.keymap.set('n', '<C-y>', '"+yy', { desc = 'Yank line to OS' })
vim.keymap.set('x', '<C-y>', '"+y', { desc = 'Yank selection to OS' })
vim.keymap.set({ 'n', 'x' }, 'gY', '"+y$', { desc = 'Yank remaining line to OS' })

-- Use 'x' as alternative to black hole register
-- vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
-- vim.keymap.set('n', 'X', '"_X')
-- vim.keymap.set('x', 'X', '"_d') -- Also substitutes behavior of deleting line when using 'X' on 'v' mode

vim.keymap.set({ 'n', 'x' }, '<c-w>t', '<cmd>tabnew<CR>', { desc = 'Create tab' })

-- Improve repetitive window movements
vim.keymap.set({ 'n', 'x' }, '<c-w>H', '<c-w>H<c-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<c-w>J', '<c-w>J<c-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<c-w>K', '<c-w>K<c-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<c-w>L', '<c-w>L<c-w>', { remap = true })

vim.keymap.set({ 'n', 'x' }, '<C-w>l', '<cmd>vertical resize +5<cr><C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>h', '<cmd>vertical resize -5<cr><C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>k', '<cmd>horizontal resize +5<cr><C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>j', '<cmd>horizontal resize -5<cr><C-w>', { remap = true })

-- Alternatives to scroll while also keeping cursor at center
vim.keymap.set({ 'n', 'x' }, '<Up>', '2<C-y>0M')
vim.keymap.set({ 'n', 'x' }, '<Down>', '2<C-e>0M')
vim.keymap.set({ 'n', 'x' }, '<Left>', '<C-u>0M')
vim.keymap.set({ 'n', 'x' }, '<Right>', '<C-d>0M')
vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<ScrollWheelUp>', '4<C-y>0M')
vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<ScrollWheelDown>', '4<C-e>0M')

vim.keymap.set({ 'n', 'i', 'x', 's' }, '<C-s>', '<cmd>w<CR>', { desc = 'Write file (save)' })
vim.keymap.set({ 'n', 'x' }, '<C-e>', '<cmd>e!<CR>', { desc = 'Discard changes' })

-- Shortcuts to ':' and '/'
vim.keymap.set({ 'n', 'x' }, '<C-p>', ':', { desc = 'Command mode (pallete)' })
vim.keymap.set({ 'n', 'x' }, '<C-n>', '/', { desc = 'Search next' })

-- Quick comments remapped to work with comment plugins (ie. Comment.nvim)
vim.keymap.set('n', '<C-c>', 'gcc', { remap = true })
vim.keymap.set('x', '<C-c>', 'gc', { remap = true })

-- Marks go to col
vim.keymap.set('n', "'", '`')

vim.keymap.set('n', '[t', 'gT', { desc = 'Go to previous tab' })
vim.keymap.set('n', ']t', 'gt', { desc = 'Go to next tab' })

-- Quickfix popup keymaps
require('custom.helpers').map_ctrl_j('qf', false)
