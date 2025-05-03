local cmp = require('cmp')

return function()
  if cmp.visible() then
    cmp.close()
    return
  end

  cmp.complete()
end
