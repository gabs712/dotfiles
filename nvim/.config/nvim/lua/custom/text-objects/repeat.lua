local M = {}

--- @param cb function
--- @param forward boolean
local repeat_move = function(cb, forward)
  local ts_repeat = require('nvim-treesitter.textobjects.repeatable_move')
  local move = ts_repeat.make_repeatable_move(cb)

  move({ forward = forward })
end

--- @param forward boolean
M.git_conflict = function(forward)
  repeat_move(function(opts)
    if require('git-conflict').conflict_count() > 0 then
      vim.cmd("normal! m'")
    end

    if opts.forward then
      vim.cmd('GitConflictNextConflict')
    else
      vim.cmd('GitConflictPrevConflict')
    end
  end, forward)
end

--- @param forward boolean
M.git_hunk = function(forward)
  repeat_move(function(opts)
    local gitsigns = require('gitsigns')

    if opts.forward then
      gitsigns.nav_hunk('next', { target = 'all' })
    else
      gitsigns.nav_hunk('prev', { target = 'all' })
    end
  end, forward)
end

--- @param forward boolean
M.diagnostic = function(forward)
  repeat_move(function(opts)
    local count = vim.v.count > 0 and vim.v.count or 1

    if vim.diagnostic.get_next() then
      vim.cmd("normal! m'")
    end

    if opts.forward then
      vim.diagnostic.jump({ count = count })
    else
      vim.diagnostic.jump({ count = -count })
    end
  end, forward)
end

M.quickfix = function(forward)
  repeat_move(function(opts)
    local count = vim.v.count > 0 and vim.v.count or 1

    if opts.forward then
      pcall(function()
        vim.cmd('cnext ' .. count)
      end)
    else
      pcall(function()
        vim.cmd('cprev ' .. count)
      end)
    end
  end, forward)
end

M.quickfix_file = function(forward)
  repeat_move(function(opts)
    local count = vim.v.count > 0 and vim.v.count or 1

    if opts.forward then
      pcall(function()
        vim.cmd('cnfile ' .. count)
      end)
    else
      pcall(function()
        vim.cmd('cpfile ' .. count)
      end)
    end
  end, forward)
end

M.indent = function(forward)
  repeat_move(function(opts)
    if opts.forward then
      require('mini.indentscope').operator('bottom', true)
    else
      require('mini.indentscope').operator('top', true)
    end
  end, forward)
end

M.mark = function(forward)
  repeat_move(function(opts)
    if opts.forward then
      pcall(function()
        vim.cmd('norm! ' .. "]'")
      end)
    else
      pcall(function()
        vim.cmd('norm! ' .. "['")
      end)
    end
  end, forward)
end

M.paragraph = function(forward)
  repeat_move(function(opts)
    local count = vim.v.count > 0 and vim.v.count or 1

    if opts.forward then
      vim.cmd('norm! ' .. count .. '}')
    else
      vim.cmd('norm! ' .. count .. '{')
    end
  end, forward)
end

M.todo = function(forward)
  repeat_move(function(opts)
    vim.cmd("normal! m'")

    if opts.forward then
      require('todo-comments').jump_next()
    else
      require('todo-comments').jump_prev()
    end
  end, forward)
end

return M
