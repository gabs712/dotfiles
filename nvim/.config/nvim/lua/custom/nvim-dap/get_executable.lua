return function(candidates)
  for _, exe in ipairs(candidates) do
    if vim.fn.executable(exe) == 1 then
      return exe
    end
  end
  return candidates[#candidates]
end
