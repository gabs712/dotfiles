local cmp = require('cmp')

vim.keymap.set('c', '<Tab>', function() -- <S-Tab> automatically mapped by nvim, couldn't change behavior
  if not cmp.visible() then
    cmp.complete()
    cmp.select_next_item()

    if #cmp.get_entries() == 1 then -- Only works with noselect completeopt for some reason. Therefore the extra select
      cmp.close()
    end
  else
    cmp.select_next_item()
  end
end)

vim.keymap.set('c', '<C-Space>', function()
  if cmp.visible() then
    if cmp.visible_docs() then
      cmp.close_docs()
    else
      cmp.open_docs()
    end
    return
  end

  cmp.complete()
end)

vim.keymap.set('c', '<C-n>', function()
  if cmp.visible() then
    cmp.select_next_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', false)
  end
end)

vim.keymap.set('c', '<C-p>', function()
  if cmp.visible() then
    cmp.select_prev_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n', false)
  end
end)

vim.keymap.set('c', '<C-c>', cmp.abort)
