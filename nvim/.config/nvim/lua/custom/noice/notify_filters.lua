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
  -- {
  --   filter = {
  --     event = 'notify',
  --     find = 'Debug adapter disconnected$',
  --   },
  --   opts = { skip = true },
  -- },
  -- {
  --   filter = {
  --     warning = true,
  --     find = 'Adapter reported a frame in .* but: Cursor position outside buffer%. Ensure executable is up2date and if using a source mapping ensure it is correct',
  --   },
  --   opts = { skip = true },
  -- },
  -- {
  --   filter = {
  --     error = true,
  --     find = '^No stopped threads. Cannot move$',
  --   },
  --   opts = { skip = true },
  -- },
}
