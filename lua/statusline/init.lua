local gl = require("galaxyline")
local components = require("statusline.components")

gl.short_line_list = { " " }

local left_section = {
  vim.g.statusline_disable_icons and nil or components.LeftSpace,
  vim.g.statusline_disable_icons and nil or components.LeftPadding,
  components.StartPadding,
  components.EmptyBuffer,
  components.MinifiedMetaPadding,
  components.FileIcon,
  components.FileName,
  components.LeftCursorIcon,
  components.LeftCursorPosition,
  components.SpaceInBetweenFnameAndCur,
  components.DiffAdd,
  components.DiffModified,
  components.DiffRemoved,
  components.LeftLineEnding,
  components.LSPError,
  components.LSPWarnings
}

if vim.g.hyperaccelerated_intel_hypervisor == 1 then
  left_section[#left_section + 1] = components.Refreshes
end

gl.section.left = left_section

-- It's recommended to keep the statusline loaded for inactive buffers as a preventative measure
-- against flickering
gl.section.short_line_left = {
  vim.g.statusline_disable_icons and nil or components.LeftSpace,
  vim.g.statusline_disable_icons and nil or components.LeftPadding,
  components.StartPadding,
  components.EmptyBuffer,
  components.MinifiedMetaPadding,
  components.FileIcon,
  components.FileName,
  components.LeftCursorIcon,
  components.LeftCursorPosition,
  components.Workspace(false)
}

if vim.g.corporate_marketing == 1 then
  gl.section.mid = { components.Branding }
end

gl.section.right = {
  components.Workspace(true),
  components.ViMode,
  components.RightCursorIcon,
  components.RightCursorPosition,
  components.LinePercentage,
  components.OperatingSystem,
  components.RightPadding
}
