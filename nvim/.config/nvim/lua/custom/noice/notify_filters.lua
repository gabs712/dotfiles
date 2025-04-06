return {
  {
    filter = {
      event = 'msg_show',
      find = 'written$',
    },
    opts = { skip = true },
  },
  -- Popups for undos
  {
    filter = {
      event = 'msg_show',
      find = '(%d+)%s.-;%s.-%s#(%d+)%s%s',
    },
    opts = { skip = true },
  },
  -- Popups when using "*" or "#" on visual mode
  {
    filter = {
      event = 'msg_show',
      find = '^%s*W?%s?%[%d+/%d+%]$',
    },
    opts = { skip = true },
  },
  -- cnext/cprev throws errors when reaching last item, annoying call stack with repeatable movements
  {
    filter = {
      event = 'msg_show',
      find = 'E553: No more items',
    },
    opts = { skip = true },
  },
  -- DAP
  { -- Warning when avancing steps outside of main buffer
    filter = {
      warning = true,
      find = 'Adapter reported a frame in .* but: Cursor position outside buffer%. Ensure executable is up2date and if using a source mapping ensure it is correct',
    },
    opts = { skip = true },
  },
  -- NOTE: Telescope go to definition currently drops deprecated warnings
  {
    filter = {
      warning = true,
      find = 'position_encoding param is required in vim%.lsp%.util%.make_position_params%. Defaulting to position encoding of the first client%.',
    },
    opts = { skip = true },
  },
  {
    event = 'notify',
    filter = {
      find = 'vim%.lsp%.util%.jump_to_location is deprecated%. Run ":checkhealth vim%.deprecated" for more information',
    },
    opts = { skip = true },
  },
}
