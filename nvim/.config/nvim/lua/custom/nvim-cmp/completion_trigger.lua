local cmp = require('cmp')

return function(sources)
  return cmp.mapping(function()
    if cmp.visible() then
      if cmp.visible_docs() then
        cmp.close_docs()
      else
        cmp.open_docs()
      end
      return
    end

    cmp.complete({
      config = {
        sources = sources,
      },
    })
  end, { 'i', 'c' })
end
