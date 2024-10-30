return {
  'christoomey/vim-tmux-navigator',
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,

  config = function()
    vim.keymap.set({ 'n', 'x' }, '<A-h>', '<cmd>TmuxNavigateLeft<cr>')
    vim.keymap.set({ 'n', 'x' }, '<A-j>', '<cmd>TmuxNavigateDown<cr>')
    vim.keymap.set({ 'n', 'x' }, '<A-k>', '<cmd>TmuxNavigateUp<cr>')
    vim.keymap.set({ 'n', 'x' }, '<A-l>', '<cmd>TmuxNavigateRight<cr>')
  end,
}
