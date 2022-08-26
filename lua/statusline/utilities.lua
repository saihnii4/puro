local colors = require("statusline.colors")
local symbols = require("statusline.symbols")

local _OPERATING_SYSTEM = nil
local _REFRESHES = 0

local _capture = function(cmd)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

local _get_os_icon = function(os)
  if os == "Linux" then
    return symbols.linux_logo
  elseif os == "Darwin" then
    return symbols.darwin_logo
  elseif os == "Windows" then
    return symbols.windows_logo
  else
    return symbols.unknown_logo
  end
end

local M = {}

M.buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

M.checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

M.check_for_git = function()
  if M.buffer_not_empty() and require("galaxyline.condition").check_git_workspace() then
    return colors.blue
  end
  return colors.bg
end

M.buffer_check = function()
  if M.buffer_not_empty() then
    return colors.fg
  end
  return colors.white
end

M.git_patch = function()
  if M.buffer_not_empty() then
    return M.check_for_git()
  end
  return colors.bg
end

M.spacing = function()
  return " "
end

M.get_refreshes = function()
  _REFRESHES = _REFRESHES + 1
  return "  Refreshes: " .. _REFRESHES
end

M.get_operating_system = function()
  if _OPERATING_SYSTEM == nil then
    local separator = package.config:sub(1, 1)

    if separator == "/" then
      _OPERATING_SYSTEM = _capture("uname")
    else
      _OPERATING_SYSTEM = "Windows"
    end
  end

  local concat = _get_os_icon(_OPERATING_SYSTEM)

  if vim.g.statusline_disable_icons then
    concat = "  " .. concat .. "  "
  end

  return concat
end

M.split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}

  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end

  return t
end


M.compile_pattern = function(variable)
  local _get_next_pos = function(i, capital)
    local unadulterated, _ = string.gsub(variable, "%b[]", "")
    local _, loc = string.find(unadulterated, capital)
    return loc + 4 * (i - 1) -- offset for the already compiled letters
  end

  local i = 0

  for capital in string.gmatch(variable, "[A-Z]") do
    i = i + 1

    local loc = _get_next_pos(i, capital)

    if i ~= 1 or string.find(variable:sub(0, loc - 1), "[A-Z]") then
      variable = variable:sub(0, loc - 1) .. "_?" .. variable:sub(loc, variable:len())
    end

    -- variable was altered so we need to update position
    loc = _get_next_pos(i, capital)

    variable = variable:sub(0, loc - 1) ..
        string.gsub(variable:sub(loc, loc + 1), "[A-Z]", "[" .. capital:lower() .. capital .. "]") ..
        variable:sub(loc + 2, variable:len())
  end

  return variable
end

return M
