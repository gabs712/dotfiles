-- Must be set before plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 -- Disable aditional netrw features

-- True colors suport
vim.opt.termguicolors = true

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
vim.opt.scrolloff = 13

-- Tabs
local tab_size = 2
vim.opt.shiftwidth = tab_size -- Tailing tabs
vim.opt.tabstop = tab_size -- Leading tabs
vim.opt.expandtab = true -- Spaces instead of tabs

-- Use status bar globally
vim.opt.laststatus = 3

-- Extend timeout to use custom keybinds - Default is 1000
vim.o.timeoutlen = 4000

-- Turn off swapfile
vim.opt.swapfile = false

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Change some icons
vim.opt.fillchars = {
  eob = " ", -- End of buffer (normally '~')
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
}

