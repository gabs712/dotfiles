local cmp = require('cmp')

return function()
  if vim.fn.reg_recording() ~= '' then
    return
  end

  if cmp.visible() then
    cmp.close()
    return
  end

  cmp.complete()
end
