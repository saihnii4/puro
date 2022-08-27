local colors = require("statusline.colors")
local util = require("statusline.utilities")
local constants = require("statusline.constants")

local M = {}

M.register_component = function(component_name, component)
  local compiled_name = util.compile_pattern(component_name)
  if type(component) ~= "table" then
    M[compiled_name] = component
    return
  end

  M[compiled_name] = {}
  M[compiled_name][component_name] = component
end

M.list_components = function(opts)
  if not opts then
    opts = { include_mangled = false }
  end

  local components = {}

  for k, v in pairs(M) do
    if type(v) == "table" then
      for k2, _v2 in pairs(v) do
        if opts.include_mangled then
          table.insert(components, { k, k2 })
        else
          table.insert(components, k2)
        end
      end
    end
  end

  return components
end

M.register_component("Refreshes",
  { provider = constants.refreshes_provider, constants.refreshes_highlight })

M.register_component("StartPadding",
  { provider = util.spacing, highlight = { colors.black, colors.black } })

M.register_component("EmptyBuffer", {
  condition = constants.empty_buffer_condition,
  provider = constants.empty_buffer_provider,
  highlight = constants.empty_buffer_highlight,
  separator = constants.empty_buffer_separator,
  separator_highlight = constants.empty_buffer_separator_highlight
})

M.register_component("FileIcon", {
  provider = constants.file_icon_provider,
  condition = constants.file_icon_condition,
  highlight = constants.file_icon_highlight
})

M.register_component("FileName", {
  provider = constants.file_name_provider,
  condition = constants.file_name_condition,
  highlight = constants.file_name_highlight,
  separator = constants.file_name_separator,
  separator_highlight = constants.file_name_separator_highlight
})

M.register_component("DiffAdd", {
  provider = constants.diff_add_provider,
  condition = constants.diff_add_condition,
  icon = constants.diff_add_icon,
  highlight = constants.diff_add_highlight
})

M.register_component("DiffModified", {
  provider = constants.diff_modified_provider,
  condition = constants.diff_modified_condition,
  icon = constants.diff_modified_icon,
  highlight = constants.diff_modified_highlight
})

M.register_component("DiffRemoved", {
  provider = constants.diff_removed_provider,
  condition = constants.diff_removed_condition,
  icon = constants.diff_removed_icon,
  highlight = constants.diff_removed_highlight
})

M.register_component("LSPError", {
  provider = constants.lsp_error_provider,
  icon = constants.lsp_error_icon,
  highlight = constants.lsp_error_highlight
})

M.register_component("LeftSpace", {
  provider = constants.left_space_provider,
  highlight = constants.left_space_highlight,
  condition = constants.left_space_condition
})

M.register_component("Space", {
  provider = constants.space_provider,
  highlight = constants.space_highlight
})

M.register_component("LSPWarnings", {
  provider = constants.lsp_warnings_provider,
  icon = constants.lsp_warnings_icon,
  highlight = constants.lsp_warnings_highlight
})

M.register_component("ViMode", {
  provider = constants.vi_mode_provider,
  highlight = constants.vi_mode_highlight,
  separator = constants.vi_mode_separator,
  separator_highlight = constants.vi_mode_separator_highlight
})

M.register_component("LinePercentage", {
  provider = constants.line_percentage_provider,
  separator = constants.line_percentage_separator,
  separator_highlight = constants.line_percentage_separator_highlight,
  highlight = constants.line_percentage_highlight
})

M.register_component("LeftCursorIcon", {
  provider = constants.left_cursor_icon_provider,
  condition = constants.left_cursor_icon_condition,
  highlight = constants.left_cursor_icon_highlight
})

M.register_component("RightCursorIcon", {
  provider = constants.right_cursor_icon_provider,
  condition = constants.right_cursor_icon_condition,
  highlight = constants.right_cursor_icon_highlight,
  separator = constants.right_cursor_icon_separator,
  separator_highlight = constants.right_cursor_icon_separator_highlight
})

M.register_component("LeftCursorPosition", {
  provider = constants.left_cursor_position_provider,
  condition = constants.left_cursor_position_condition,
  highlight = constants.left_cursor_position_highlight,
  separator = constants.left_cursor_position_separator,
  separator_highlight = constants.left_cursor_position_separator_highlight
})

M.register_component("RightCursorPosition", {
  provider = constants.right_cursor_position_provider,
  condition = constants.right_cursor_position_condition,
  highlight = constants.right_cursor_position_highlight
})

M.register_component("Branding", {
  provider = constants.branding_provider,
  condition = constants.branding_condition,
  highlight = constants.branding_highlight
})

M.register_component("Logo", {
  provider = constants.logo_provider,
  highlight = constants.logo_highlight,
  condition = constants.logo_condition,
  separator = constants.logo_separator,
  separator_highlight = constants.logo_separator_highlight
})

M.register_component("Workspace", function(truncate)
  return {
    Workspace = {
      provider = constants.workspace_provider(truncate),
      highlight = constants.workspace_highlight,
      separator = constants.workspace_separator,
      separator_highlight = constants.workspace_separator_highlight
    }
  }
end)

M.register_component("OperatingSystem", {
  provider = constants.operating_system_provider,
  condition = constants.operating_system_condition,
  highlight = constants.operating_system_highlight,
  separator = constants.operating_system_separator,
  separator_highlight = constants.operating_system_separator_highlight
})

M.register_component("LeftPadding", {
  provider = constants.left_padding_provider,
  highlight = constants.left_padding_highlight,
  condition = constants.left_padding_condition
})

M.register_component("RightPadding", {
  provider = constants.right_padding_provider,
  highlight = constants.right_padding_highlight,
  condition = constants.right_padding_condition
})

M.register_component("SpaceInBetweenFnameAndCur", {
  provider = constants.space_between_fname_and_cur_pos_provider,
  highlight = constants.space_between_fname_and_cur_pos_highlight,
  condition = constants.space_between_fname_and_cur_pos_condition
})

M.register_component("LeftLineEnding", {
  provider = constants.left_line_ending_provider,
  highlight = constants.left_line_ending_highlight
})

M.register_component("MinifiedMetaPadding", {
  provider = constants.minified_meta_padding_provider,
  highlight = constants.minified_meta_padding_highlight,
  conition = constants.minified_meta_padding_condition
})

return setmetatable(M, {
  __index = function(t, i)
    for k, v in pairs(t) do
      local start, _end = string.find(i, k)
      -- ensure exact match
      if (start == 1) and (_end == i:len()) then
        return v
      end
    end

    vim.notify(string.format('Component "%s" does not match any registered component', i), vim.log.levels.WARN,
      { title = "statusline/components.lua" })

    return nil
  end,
})
