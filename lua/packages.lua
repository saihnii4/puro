return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    '/home/pur0/Code/everforest',
    --'saihnii4/everforest',
    config = function()
      vim.g.everforest_background = 'hard'
      vim.opt.termguicolors = true
      vim.g.everforest_underline_error = 0
      vim.g.everforest_diagnostic_text_highlight = 1

      vim.cmd [[ colorscheme everforest ]]
    end
  }

  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'Iron-E/nvim-cartographer' -- probably superfluous
    },
    tag = 'nightly',
  }

  use {
    'rcarriga/nvim-notify',
    opt = true,
    module = 'notify'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    opt = true,
    cmd = { "Telescope" }
  }

  use 'Iron-E/nvim-cartographer'

  use {
    '~/Code/galaxyline.nvim',
    config = function() require('statusline') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp') end
  }

  use '~/Code/ls3p'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "haskell", "json", "html", "javascript", "tsx" },
        highlight = {
          enable = true
        }
      }
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require 'nvim-autopairs'
      local Rule = require 'nvim-autopairs.rule'

      npairs.setup {}

      npairs.add_rules({
        Rule("function", " end", { "lua" }),
        Rule("module", " where", { "haskell" }),
      })
    end
  }

  use {
    '~/Code/lspsaga.nvim',
    requires = { 'Iron-E/nvim-cartographer' },
    config = function()
      local saga = require 'lspsaga'
      saga.init_lsp_saga()
    end
  }

  use {
    'andweeb/presence.nvim',
    config = function()
      local config_files = { "packages.lua", ".luacheck.rc", "compile-commands.json", "Makefile", "PKGCONFIG", ".sxhkdrc",
        ".bspwmrc", "mpd.conf" }
      local file_assets = {
        rs = { "the language of furries",
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyt3.ggpht.com%2Fa%2FAATXAJz6FDErjZ9jf-UdRbZt8fdx3aTW-858496gmg%3Ds900-c-k-c0xffffffff-no-rj-mo&f=1&nofb=1" },
        hs = { "the language of chads",
          "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/haskell.png" },
        lua = { "the language of 8 year olds",
          "https://raw.githubusercontent.com/smokes/vscode-discord-assets/master/lua.png" },
        python = { "the language of larpers", "python" },
      }

      for _, v in ipairs(config_files) do
        file_assets[v] = { "help me i'm dying inside",
          "https://cdn.discordapp.com/app-assets/1010139243160555560/1010140595777437696.png" }
      end

      require("presence"):setup({
        auto_update = true,
        neovim_image_text = "Better than Emacs!",
        main_image = "file",
        file_assets = file_assets
      })
    end
  }

  use 'purescript-contrib/purescript-vim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip'
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end
  }

  use {
    'luukvbaal/nnn.nvim',
    config = function()
      require('nnn').setup()
    end,
    opt = true,
    cmd = { "NnnPicker" }
  }

  use_rocks 'lpeg'
end)
