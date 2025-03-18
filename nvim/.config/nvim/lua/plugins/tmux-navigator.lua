return {
  'christoomey/vim-tmux-navigator',
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,

  config = function()
    vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<A-h>', '<cmd>TmuxNavigateLeft<cr>')
    vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<A-j>', '<cmd>TmuxNavigateDown<cr>')
    vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<A-k>', '<cmd>TmuxNavigateUp<cr>')
    vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 't', 'c' }, '<A-l>', '<cmd>TmuxNavigateRight<cr>')
  end,
}
