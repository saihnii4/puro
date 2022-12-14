local lsp = require 'lspconfig'
local map = require 'cartographer'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local _js_attach = function()
end

local merge = function(t1, t2)
  for i, val in ipairs(t1) do
    table.insert(t2, val)
  end
  return t2
end

local config = {
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "Lua 5.4",
          path = {
            '?.lua',
            '?/init.lua',
            vim.fn.expand '~/.luarocks/share/lua/5.4/?.lua',
            vim.fn.expand '~/.luarocks/share/lua/5.4/?/init.lua',
            '/usr/share/5.4/?.lua',
            '/usr/share/lua/5.4/?/init.lua'
          }
        },
        cmd = { "/usr/bin/lua-language-server", "-E", "/usr/lib/lua-language-server" },
        diagnostics = {
          globals = { "vim" },
          unusedLocalExclude = { "_*" }
        },
        workspace = {
          library = merge(vim.api.nvim_get_runtime_file("", true), {
            vim.fn.expand '~/.luarocks/share/lua/5.4',
          })
        },
        telemetry = {
          enable = false
        }
      }
    }
  },
  purescriptls = {
    settings = {
      purescript = {
        addSpagoSources = true
      }
    }
  },
  pyright = true,
  gopls = true,
  hls = {
    on_attach = function()
      map.n.nore.silent['<Leader>h'] = function() (require 'notify')('TODO: load Haskell REPL') end -- TODO: load Haskell REPL
    end,
  },
  ccls = true,
  diagnosticls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    on_attach = function()
      map.n.silent['<Leader>p'] = _js_attach
    end,
  },
  tsserver = {
    on_attach = function()
      map.n.silent['<Leader>p'] = _js_attach
    end,
  },
  emmet_ls = {
    filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    init_options = {
      html = {
        options = {
          ["jsx.enabled"] = true,
        }
      }
    }
  }
}

lsp["capabilities"] = capabilities

for k, v in pairs(config) do
  if type(v) ~= "boolean" then
    lsp[k].setup(v)
    goto continue
  end

  lsp[k].setup {}

  ::continue::
end
