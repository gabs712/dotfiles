-- TODO: Enhance config
return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set({ 'n', 'x' }, '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
  end,
}
