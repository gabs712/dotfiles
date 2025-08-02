-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear keys (keep close to top to avoid side effects)
vim.keymap.set({ 'n', 'x' }, '<Space>', '<Nop>')
vim.keymap.set('c', '<C-d>', '<Nop>') -- Causes conflicts with completion
vim.keymap.set({ 'n', 'x' }, '<C-w><C-w>', '<Nop>')
vim.keymap.set('i', '<C-Space>', '<Nop>')
vim.keymap.set('n', 'H', '<Nop>')
vim.keymap.set('n', 'L', '<Nop>')
vim.keymap.set('i', '<C-n>', '<Nop>')
vim.keymap.set('i', '<C-p>', '<Nop>')
vim.keymap.set({ 'n', 'x' }, '<leader><Esc>', '<Nop>')

-- Defualt lsp bindings
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gri')

vim.keymap.set('n', '<Esc>', function()
  local hl_active = vim.v.hlsearch ~= 0
  local ext_win_closed = false

  for _, win in pairs(vim.api.nvim_list_wins()) do
    local is_float_win = vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_config(win).relative ~= ''

    if is_float_win then
      local is_notification = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'filetype') == 'notify'

      if is_notification and hl_active then
        vim.cmd('nohlsearch')
        goto continue
      end

      local on_win = win == vim.api.nvim_get_current_win()

      if on_win and hl_active then
        return vim.cmd('nohlsearch')
      end

      if on_win then
        return vim.api.nvim_win_close(win, false)
      end

      vim.api.nvim_win_close(win, false)
      ext_win_closed = true
    end
    ::continue::
  end

  if hl_active and not ext_win_closed then
    vim.cmd('nohlsearch')
  end
end, { desc = 'Clear highlights and popups' })

vim.keymap.set(
  'n',
  '<C-Space>',
  require('custom.helpers').switch_to_previous_buffer,
  { desc = 'Switch to the previous buffer' }
)

-- <C-j> works with plugins that remap <CR> (ie. autopairs)
vim.keymap.set('i', '<C-j>', '<CR>', { remap = true })

-- Don't indent when using the registers with c-r
vim.keymap.set('i', '<C-r>', '<C-r><C-o>', { remap = true })

-- Lsp
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol across project' })
vim.keymap.set('n', '<leader>z', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Diagnostics popup' })

-- Undo
vim.keymap.set('n', require('custom.bindings').timeline_undo, 'g-', { desc = 'Timeline undo' })
vim.keymap.set('n', require('custom.bindings').timeline_redo, 'g+', { desc = 'Timeline redo' })

-- Shell-like command movements
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

-- Facilitate indent
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

-- Alternatives to ge
vim.keymap.set({ 'n', 'x', 'o' }, '<C-b>', 'ge', { remap = true })
vim.keymap.set({ 'n', 'x', 'o' }, '<M-b>', 'gE', { remap = true })

-- Alternatives to scroll
vim.keymap.set({ 'n', 'x' }, '<M-d>', '<cmd>norm! 4<CR>')
vim.keymap.set({ 'n', 'x' }, '<M-u>', '<cmd>norm! 4<CR>')

vim.keymap.set({ 'n', 'x' }, '<Down>', '<cmd>norm! 40M<CR>')
vim.keymap.set({ 'n', 'x' }, '<Up>', '<cmd>norm! 40M<CR>')
vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<ScrollWheelDown>', '<cmd>norm! 40M<CR>')
vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<ScrollWheelUp>', '<cmd>norm! 40M<CR>')

vim.keymap.set({ 'n', 'x' }, '<Left>', '<C-u>0M')
vim.keymap.set({ 'n', 'x' }, '<Right>', '<C-d>0M')

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
vim.keymap.set({ 'n', 'x' }, '<C-y>', '"+y', { desc = 'Yank to OS' })

-- Use 'x' as alternative to black hole register
-- vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
-- vim.keymap.set('n', 'X', '"_X')
-- vim.keymap.set('x', 'X', '"_d') -- Also substitutes behavior of deleting line when using 'X' on 'v' mode

-- Tab
vim.keymap.set({ 'n', 'x' }, '<C-t>', '<cmd>tabnew<CR>', { desc = 'Create tab' })
vim.keymap.set({ 'n', 'x' }, '<C-w>O', '<cmd>tabo<CR>', { desc = 'Tab only' })
vim.keymap.set({ 'n', 'x' }, '<C-w>C', '<cmd>tabclose<CR>', { desc = 'Tab close' })

vim.keymap.set({ 'n', 'x' }, 'g1', '<cmd>tabn 1<CR>', { desc = 'Go to tab n1' })
vim.keymap.set({ 'n', 'x' }, 'g2', '<cmd>tabn 2<CR>', { desc = 'Go to tab n2' })
vim.keymap.set({ 'n', 'x' }, 'g3', '<cmd>tabn 3<CR>', { desc = 'Go to tab n3' })
vim.keymap.set({ 'n', 'x' }, 'g4', '<cmd>tabn 4<CR>', { desc = 'Go to tab n4' })
vim.keymap.set({ 'n', 'x' }, 'g5', '<cmd>tabn 5<CR>', { desc = 'Go to tab n5' })
vim.keymap.set({ 'n', 'x' }, 'g6', '<cmd>tabn 6<CR>', { desc = 'Go to tab n6' })
vim.keymap.set({ 'n', 'x' }, 'g7', '<cmd>tabn 7<CR>', { desc = 'Go to tab n7' })
vim.keymap.set({ 'n', 'x' }, 'g8', '<cmd>tabn 8<CR>', { desc = 'Go to tab n8' })
vim.keymap.set({ 'n', 'x' }, 'g9', '<cmd>tabn 9<CR>', { desc = 'Go to tab n9' })

-- Improve repetitive window movements
vim.keymap.set({ 'n', 'x' }, '<C-w>H', '<C-w>H<C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>J', '<C-w>J<C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>K', '<C-w>K<C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>L', '<C-w>L<C-w>', { remap = true })

vim.keymap.set({ 'n', 'x' }, '<C-w>h', '<C-w>h<C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>j', '<C-w>j<C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>k', '<C-w>k<C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>l', '<C-w>l<C-w>', { remap = true })

vim.keymap.set({ 'n', 'x' }, '<C-w>.', '<cmd>vertical resize +5<cr><C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>,', '<cmd>vertical resize -5<cr><C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w>>', '<cmd>horizontal resize +5<cr><C-w>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<C-w><', '<cmd>horizontal resize -5<cr><C-w>', { remap = true })

vim.keymap.set({ 'n', 'i', 'x', 's' }, '<C-s>', '<cmd>w<CR>', { desc = 'Write file (save)' })
vim.keymap.set({ 'n', 'x' }, '<C-e>', '<cmd>e!<CR>', { desc = 'Discard changes' })

-- Shortcuts to ':' and '/'
vim.keymap.set({ 'n', 'x' }, '<C-p>', ':', { desc = 'Command mode (pallete)' })
vim.keymap.set({ 'n', 'x', 'o' }, '<C-n>', '/', { desc = 'Search next' })
vim.keymap.set({ 'n', 'x', 'o' }, '<M-n>', '?', { desc = 'Search prev' })

-- Quick comments remapped to work with comment plugins (ie. Comment.nvim)
vim.keymap.set('n', '<C-c>', 'gcc', { remap = true })
vim.keymap.set('x', '<C-c>', 'gc', { remap = true })

-- Marks go to col
vim.keymap.set('n', "'", '`')

-- Swap gf and gF
vim.keymap.set('n', 'gf', 'gF') -- goes to line if any
vim.keymap.set('n', 'gF', 'gf')

-- Quickfix popup keymaps
require('custom.helpers').map_ctrl_j_hl('qf', false)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', '<Esc>', '<cmd>cclose<CR>', { buffer = true })
  end,
})

-- inspectTree
require('custom.helpers').map_ctrl_j('query')
