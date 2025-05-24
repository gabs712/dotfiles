local cmp = require('cmp')

return function(config)
  if cmp.visible() then
    if cmp.visible_docs() then
      cmp.close_docs()
    else
      cmp.open_docs()
    end
    return
  end

  if not config then
    cmp.complete()
    return
  end

  cmp.complete({
    config = config,
  })
end
