--local re = require("re")
local fileinfo = require("galaxyline.provider_fileinfo")
local vcs = require("galaxyline.provider_vcs")

local symbols = require("statusline.symbols")
local util = require("statusline.utilities")
local colors = require("statusline.colors")

local constants = {
  empty_buffer_separator = symbols.generic_separator,
  empty_buffer_highlight = { colors.white, colors.black },
  empty_buffer_provider = function()
    return " /dev/null "
  end,
  empty_buffer_condition = function()
    return not util.buffer_not_empty()
  end,
  empty_buffer_separator_highlight = { colors.white, colors.black },
  minified_meta_padding_provider = function()
    return " "
  end,
  minified_meta_padding_condition = function()
    return not util.checkwidth() and util.buffer_not_empty()
  end,
  minified_meta_padding_highlight = { colors.black, colors.black },
  file_icon_provider = "FileIcon",
  file_icon_condition = util.buffer_not_empty,
  file_icon_highlight = { fileinfo.get_file_icon_color, colors.black },
  file_name_provider = { "FileName" },
  file_name_condition = util.buffer_not_empty,
  file_name_highlight = { colors.white, colors.black },
  file_name_separator = symbols.generic_separator .. " ",
  file_name_separator_highlight = {
    function()
      if util.checkwidth() then
        return colors.white
      end

      return colors.black
    end,
    colors.black
  },
  diff_add_provider = function()
    local diffs = vcs.diff_add()

    if diffs then
      return diffs
    end

    return "0 "
  end,
  diff_add_condition = util.checkwidth,
  diff_add_icon = symbols.diff_add_symbol,
  diff_add_highlight = {
    colors.cyan,
    function()
      if util.checkwidth() then
        return colors.black
      end

      return colors.bg
    end
  },
  diff_modified_provider = function()
    local diffs = vcs.diff_modified()

    if diffs then
      return diffs
    end

    return "0 "
  end,
  diff_modified_condition = util.checkwidth,
  diff_modified_icon = symbols.diff_mod_symbol,
  diff_modified_highlight = {
    colors.green,
    function()
      if util.checkwidth() then
        return colors.black
      end

      return colors.bg
    end
  },
  diff_removed_provider = function()
    local diffs = vcs.diff_remove()

    if diffs then
      return diffs .. " "
    end

    return "0  "
  end,
  diff_removed_condition = util.checkwidth,
  diff_removed_icon = symbols.diff_removed_symbol,
  diff_removed_highlight = {
    colors.red,
    function()
      if util.checkwidth() then
        return colors.black
      end

      return colors.bg
    end
  },
  lsp_error_provider = "DiagnosticError",
  lsp_error_icon = "  " .. symbols.lsp_error_symbol,
  lsp_error_highlight = { colors.red, colors.bg },
  lsp_warnings_provider = "DiagnosticWarn",
  lsp_warnings_icon = "  " .. symbols.lsp_warnings_symbol,
  lsp_warnings_highlight = { colors.blue, colors.bg },
  left_space_provider = util.spacing,
  left_space_highlight = { colors.bg, colors.bg },
  left_space_condition = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 60 then
      return true
    end
    return false
  end,
  space_provider = util.spacing,
  space_highlight = { colors.bg, colors.bg },
  vi_mode_provider = function()
    local alias = {
      n = "Normal",
      i = "Insert",
      c = "Command",
      V = "Visual",
      [""] = "Visual Block",
      v = "Visual",
      R = "Replace"
    }
    local current_Mode = alias[vim.fn.mode()]

    if current_Mode == nil then
      return "  TERM "
    else
      return " " .. current_Mode .. " "
    end
  end,
  vi_mode_highlight = { colors.white, colors.black },
  vi_mode_separator = symbols.generic_separator,
  vi_mode_separator_highlight = { colors.white, colors.black },
  line_percentage_provider = function()
    local current_line = vim.fn.line(".")
    local total_line = vim.fn.line("$")

    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line("$") then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "% "
  end,
  line_percentage_separator = symbols.left_arrow_separator,
  line_percentage_separator_highlight = { colors.white, colors.black },
  line_percentage_highlight = { colors.white, colors.black },
  left_cursor_icon_provider = function()
    return symbols.ln .. " "
  end,
  left_cursor_icon_condition = util.checkwidth,
  left_cursor_icon_highlight = { colors.green, colors.black },
  right_cursor_icon_provider = function()
    return " " .. symbols.ln .. " "
  end,
  right_cursor_icon_condition = function()
    local width = vim.fn.winwidth(0) / 2
    if width < 35 then
      return false
    end
    return not util.checkwidth()
  end,
  right_cursor_icon_highlight = { colors.green, colors.black },
  right_cursor_icon_separator = symbols.left_arrow_separator,
  right_cursor_icon_separator_highlight = { colors.white, colors.black },
  left_cursor_position_provider = function()
    local line_stat = vim.split(fileinfo.line_column(), " :", true)

    local line_row = line_stat[1]:gsub(" ", "")
    local line_column = line_stat[2]:gsub(" ", "")

    return line_row .. ":" .. line_column .. " "
  end,
  left_cursor_position_condition = util.checkwidth,
  left_cursor_position_highlight = { colors.white, colors.black },
  left_cursor_position_separator = symbols.generic_separator,
  left_cursor_position_separator_highlight = { colors.white, colors.black },
  right_cursor_position_provider = function()
    local line_stat = vim.split(fileinfo.line_column(), " :", true)

    local line_row = line_stat[1]:gsub(" ", "")
    local line_column = line_stat[2]:gsub(" ", "")

    return line_row .. ":" .. line_column .. " "
  end,
  right_cursor_position_condition = function()
    local width = vim.fn.winwidth(0) / 2
    if width < 35 then
      return false
    end
    return not util.checkwidth()
  end,
  right_cursor_position_highlight = { colors.white, colors.black },
  branding_provider = function()
    return symbols.peacock .. " peafowl"
  end,
  branding_condition = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 60 then
      return true
    end
    return false
  end,
  branding_highlight = { colors.fg, colors.bg },
  logo_provider = function()
    return "  " .. symbols.logo .. " "
  end,
  logo_highlight = { colors.black, colors.green },
  logo_condition = util.checkwidth,
  logo_separator = symbols.left_upside_down_right_triangle,
  logo_separator_highlight = { colors.green, colors.black },
  workspace_provider = function(truncate)
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

    if not truncate then
      return function()
        return "  " .. symbols.folder .. " " .. dir_name
      end
    end

    return function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      if dir_name:len() > 14 then
        return "  " .. symbols.folder .. " " .. dir_name:sub(0, 12) .. "... "
      end
      return "  " .. symbols.folder .. " " .. dir_name .. " "
    end
  end,
  workspace_highlight = { colors.white, colors.black },
  workspace_condition = util.checkwidth,
  workspace_separator = symbols.left_arrow,
  workspace_separator_highlight = { colors.black, colors.bg },
  operating_system_provider = util.get_operating_system,
  operating_system_condition = util.checkwidth,
  operating_system_highlight = { colors.black, colors.green },
  operating_system_separator = symbols.right_upside_down_right_triangle,
  operating_system_separator_highlight = { colors.green, colors.black },
  left_padding_provider = function()
    return symbols.left_semicircle
  end,
  left_padding_highlight = { colors.green, colors.bg },
  left_padding_condition = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 60 then
      return true
    end
    return false
  end,
  right_padding_provider = function()
    return symbols.right_semicircle .. " "
  end,
  right_padding_highlight = { colors.green, colors.bg },
  right_padding_condition = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 60 then
      return true
    end
    return false
  end,
  space_between_fname_and_cur_pos_provider = util.spacing,
  space_between_fname_and_cur_pos_highlight = { colors.black, colors.black },
  space_between_fname_and_cur_pos_condition = util.checkwidth,
  left_line_ending_provider = function()
    return symbols.right_arrow
  end,
  left_line_ending_highlight = { colors.black, colors.bg },
  refreshes_provider = util.get_refreshes,
  refreshes_highlight = { colors.white, colors.bg }
}

-- local suffix_tokens = {"provider", "separator", "highlight", "separator_highlight", "condition"}
--
-- for k, v in pairs(constants) do
--   local prefix = re:gsub()
-- end

return constants
