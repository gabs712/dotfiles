local M = {}

local HEIGHT_RATIO = 0.80
local WIDTH_RATIO = 0.78

local screen_w = vim.opt.columns:get()
local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local window_w = screen_w * WIDTH_RATIO
local window_h = screen_h * HEIGHT_RATIO

local window_w_int = math.floor(window_w)
local window_h_int = math.floor(window_h)
local center_x = (screen_w - window_w) / 2
local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

M.width = window_w_int
M.height = window_h_int
M.row = center_x
M.col = center_y

return M
