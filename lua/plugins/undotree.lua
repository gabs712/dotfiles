return {
  'mbbill/undotree',
  config = function()
    vim.g.undotree_WindowLayout = 3
    vim.g.undotree_SplitWidth = 44
    vim.g.undotree_DiffAutoOpen = 0 -- 0, 1
    vim.g.undotree_SetFocusWhenToggle = 0
    vim.g.undotree_ShortIndicators = 0 -- s, h, m, etc
    vim.g.undotree_HighlightChangedText = 0
    vim.g.undotree_HelpLine = 1

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'undotree',
      callback = function()
        vim.keymap.set('n', '<C-->', '<plug>UndotreePreviousState', { buffer = vim.api.nvim_get_current_buf() })
        vim.keymap.set('n', '<C-=>', '<plug>UndotreeNextState', { buffer = vim.api.nvim_get_current_buf() })
      end,
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
  end,
}
