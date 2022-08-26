require("vars")
require("packages")

-- TODO: Give autocmds their own separate file

require("lsp")
require("statusline")
require("maps")

vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "lua", "javascript", "json", "purescript" },
    callback = function()
      vim.o.expandtab = true
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
      vim.o.softtabstop = 2
    end
  }
)

vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "c", "cpp" },
    callback = function()
      vim.o.expandtab = true
      vim.o.tabstop = 4
      vim.o.shiftwidth = 4
      vim.o.softtabstop = 4
    end
  }
)

vim.o.relativenumber = true
