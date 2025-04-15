-- Defaults:
-- cmp.config.compare.offset,
-- cmp.config.compare.exact,
-- -- cmp.config.compare.scopes,
-- cmp.config.compare.score,
-- cmp.config.compare.recently_used,
-- cmp.config.compare.locality,
-- cmp.config.compare.kind,
-- cmp.config.compare.sort_text,
-- cmp.config.compare.length,
-- cmp.config.compare.order,

local cmp = require('cmp')
return {
  cmp.config.compare.offset,
  cmp.config.compare.exact,
  cmp.config.compare.score,
  cmp.config.compare.recently_used,
  cmp.config.compare.locality,
  cmp.config.compare.order,
  cmp.config.compare.kind,
  cmp.config.compare.sort_text,
  cmp.config.compare.length,
}
