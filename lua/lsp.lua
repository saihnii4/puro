local lsp = require 'lspconfig'
local map = require 'cartographer'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local config = {
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "Lua 5.4.4",
          path = {
            '?.lua',
            '?/init.lua',
            vim.fn.expand '~/.luarocks/share/lua/5.4/?.lua',
            vim.fn.expand '~/.luarocks/share/lua/5.4/?/init.lua',
            '/usr/share/5.4/?.lua',
            '/usr/share/lua/5.4/?/init.lua'
          }
        }
      }
    },
    --cmd = { vim.g.HOME .. ".local/bin/lua-language-server", "-E", vim.g.HOME .. ".local/lib/lua-language-server" },
    cmd = { "/usr/bin/lua-language-server", "-E", "/usr/lib/lua-language-server" },
    diagnostics = {
      globals = { "vim" }, unusedLocalExclude = { "_*" }
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true)
    },
    telemetry = {
      enable = false
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
      print("Hello World")
      map.n.nore.silent['<Leader>h'] = function() (require 'notify')('TODO: load Haskell REPL') end -- TODO: load Haskell REPL
    end
  },
  ccls = true,
}


for k, v in pairs(config) do
  lsp["capabilities"] = capabilities

  if type(v) ~= "boolean" then
    lsp[k].setup(v)
    goto continue
  end

  lsp[k].setup {}

  ::continue::
end
