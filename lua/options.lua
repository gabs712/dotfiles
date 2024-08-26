-- Must be set before plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.relativenumber = true
vim.opt.number = true

-- Highlight selected line
-- vim.opt.cursorline = true

-- Follow identation on wrap
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Open space to line symbols
vim.opt.signcolumn = 'yes'

-- Decrease custom mapped sequence wait time -- Default is 1000
vim.opt.timeoutlen = 1000

-- Change position of new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show empty chars
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = ' ' }

-- Visual feedback when using :s
vim.opt.inccommand = 'split'

-- How many lines keep around cursor when moving vertically
vim.opt.scrolloff = 12

-- Convert tabs to spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Use status bar globally
vim.opt.laststatus = 3

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Extend timeout to use custom keybinds - Default is 1000
vim.o.timeoutlen = 4000

-- Turn off swapfile
vim.opt.swapfile = false

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Disable comment insertion when pressing 'o' or '<CR>' next to it
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

