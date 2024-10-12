return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local undotree = require('undotree')

    undotree.setup({
      position = 'right',
      keymaps = {
        ['j'] = 'move_next',
        ['k'] = 'move_prev',
        ['gj'] = 'move2parent',
        ['<Esc>'] = 'move2parent',
        ['u'] = 'move_change_next',
        ['<C-r>'] = 'move_change_prev',
        ['<C-n>'] = 'move_change_next',
        ['<C-p>'] = 'move_change_prev',
        ['J'] = 'move_change_next',
        ['K'] = 'move_change_prev',
        ['<cr>'] = 'action_enter',
        ['<C-j>'] = 'action_enter',
        ['p'] = 'enter_diffbuf',
        ['q'] = 'quit',
      },
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>u', undotree.toggle)
  end,
}
