return {
  'mbbill/undotree',
  config = function()
    require('custom.helpers').map_ctrl_j_hl('undotree')

    vim.g.undotree_WindowLayout = 3
    vim.g.undotree_SplitWidth = 44
    vim.g.undotree_DiffAutoOpen = 0 -- 0, 1
    vim.g.undotree_SetFocusWhenToggle = 0
    vim.g.undotree_ShortIndicators = 0 -- s, h, m, etc
    vim.g.undotree_HighlightChangedText = 0
    vim.g.undotree_HelpLine = 0

    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'undotree',
      callback = function()
        vim.keymap.set('n', 'g-', '<plug>UndotreePreviousState', { buffer = true })
        vim.keymap.set('n', 'g+', '<plug>UndotreeNextState', { buffer = true })

        vim.keymap.set('n', require('custom.bindings').timeline_undo, '<plug>UndotreePreviousState', { buffer = true })
        vim.keymap.set('n', require('custom.bindings').timeline_redo, '<plug>UndotreeNextState', { buffer = true })

        vim.keymap.set('n', '<Esc>', function()
          vim.cmd('UndotreeHide')
        end, { buffer = true })
      end,
    })
  end,
}
