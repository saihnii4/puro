-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/pur0/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/pur0/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/pur0/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/pur0/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/pur0/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  everforest = {
    config = { "\27LJ\2\në\1\0\0\3\0\n\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\29 colorscheme everforest \bcmd)everforest_diagnostic_text_highlight\31everforest_underline_error\18termguicolors\bopt\thard\26everforest_background\6g\bvim\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/everforest",
    url = "/home/pur0/Code/everforest"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "/home/pur0/Code/galaxyline.nvim"
  },
  ls3p = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/ls3p",
    url = "/home/pur0/Code/ls3p"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "/home/pur0/Code/lspsaga.nvim"
  },
  ["nnn.nvim"] = {
    commands = { "NnnPicker" },
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bnnn\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/opt/nnn.nvim",
    url = "https://github.com/luukvbaal/nnn.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÜ\1\0\0\n\0\v\1\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0004\4\0\0B\2\2\0019\2\4\0004\4\3\0\18\5\1\0'\a\5\0'\b\6\0005\t\a\0B\5\4\2>\5\1\4\18\5\1\0'\a\b\0'\b\t\0005\t\n\0B\5\4\0?\5\0\0B\2\2\1K\0\1\0\1\2\0\0\fhaskell\v where\vmodule\1\2\0\0\blua\t end\rfunction\14add_rules\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5€€À™\4\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cartographer"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-cartographer",
    url = "https://github.com/Iron-E/nvim-cartographer"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire \1\0\1\3\1\5\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€6\1\2\0009\1\3\1B\1\1\2\15\0\1\0X\2\4€6\1\2\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\19expand_or_jump\23expand_or_jumpable\fluasnip\21select_next_item\fvisible”\1\0\1\4\1\5\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€6\1\2\0009\1\3\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€6\1\2\0009\1\4\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\tjump\rjumpable\fluasnip\21select_prev_item\fvisibleÕ\3\1\0\v\0 \00086\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\0049\4\n\0045\6\f\0009\a\b\0009\a\v\a)\tüÿB\a\2\2=\a\r\0069\a\b\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\b\0009\a\15\aB\a\1\2=\a\16\0069\a\b\0009\a\17\a5\t\20\0009\n\18\0009\n\19\n=\n\21\tB\a\2\2=\a\22\0069\a\b\0003\t\23\0005\n\24\0B\a\3\2=\a\25\0069\a\b\0003\t\26\0005\n\27\0B\a\3\2=\a\28\6B\4\2\2=\4\b\0034\4\3\0005\5\29\0>\5\1\0045\5\30\0>\5\2\4=\4\31\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n­\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\6c\blua\fhaskell\tjson\thtml\15javascript\btsx\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n‡\a\0\0\t\0\17\0\0275\0\0\0005\1\2\0005\2\1\0=\2\3\0015\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0016\2\n\0\18\4\0\0B\2\2\4X\5\2€5\a\v\0<\a\6\1E\5\3\3R\5ü6\2\f\0'\4\r\0B\2\2\2\18\4\2\0009\2\14\0025\5\15\0=\1\16\5B\2\3\1K\0\1\0\16file_assets\1\0\3\16auto_update\2\15main_image\tfile\22neovim_image_text\23Better than Emacs!\nsetup\rpresence\frequire\1\3\0\0\29help me i'm dying insideVhttps://cdn.discordapp.com/app-assets/1010139243160555560/1010140595777437696.png\vipairs\vpython\1\3\0\0\28the language of larpers\vpython\blua\1\3\0\0 the language of 8 year oldsRhttps://raw.githubusercontent.com/smokes/vscode-discord-assets/master/lua.png\ahs\1\3\0\0\26the language of chadsVhttps://raw.githubusercontent.com/smokes/vscode-discord-assets/master/haskell.png\ars\1\0\0\1\3\0\0\28the language of furriesª\1https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyt3.ggpht.com%2Fa%2FAATXAJz6FDErjZ9jf-UdRbZt8fdx3aTW-858496gmg%3Ds900-c-k-c0xffffffff-no-rj-mo&f=1&nofb=1\1\t\0\0\17packages.lua\17.luacheck.rc\26compile-commands.json\rMakefile\14PKGCONFIG\r.sxhkdrc\r.bspwmrc\rmpd.conf\0" },
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["purescript-vim"] = {
    loaded = true,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/start/purescript-vim",
    url = "https://github.com/purescript-contrib/purescript-vim"
  },
  ["telescope.nvim"] = {
    after = { "plenary.nvim" },
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/pur0/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^notify"] = "nvim-notify"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\n‡\a\0\0\t\0\17\0\0275\0\0\0005\1\2\0005\2\1\0=\2\3\0015\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0016\2\n\0\18\4\0\0B\2\2\4X\5\2€5\a\v\0<\a\6\1E\5\3\3R\5ü6\2\f\0'\4\r\0B\2\2\2\18\4\2\0009\2\14\0025\5\15\0=\1\16\5B\2\3\1K\0\1\0\16file_assets\1\0\3\16auto_update\2\15main_image\tfile\22neovim_image_text\23Better than Emacs!\nsetup\rpresence\frequire\1\3\0\0\29help me i'm dying insideVhttps://cdn.discordapp.com/app-assets/1010139243160555560/1010140595777437696.png\vipairs\vpython\1\3\0\0\28the language of larpers\vpython\blua\1\3\0\0 the language of 8 year oldsRhttps://raw.githubusercontent.com/smokes/vscode-discord-assets/master/lua.png\ahs\1\3\0\0\26the language of chadsVhttps://raw.githubusercontent.com/smokes/vscode-discord-assets/master/haskell.png\ars\1\0\0\1\3\0\0\28the language of furriesª\1https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyt3.ggpht.com%2Fa%2FAATXAJz6FDErjZ9jf-UdRbZt8fdx3aTW-858496gmg%3Ds900-c-k-c0xffffffff-no-rj-mo&f=1&nofb=1\1\t\0\0\17packages.lua\17.luacheck.rc\26compile-commands.json\rMakefile\14PKGCONFIG\r.sxhkdrc\r.bspwmrc\rmpd.conf\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: everforest
time([[Config for everforest]], true)
try_loadstring("\27LJ\2\në\1\0\0\3\0\n\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\29 colorscheme everforest \bcmd)everforest_diagnostic_text_highlight\31everforest_underline_error\18termguicolors\bopt\thard\26everforest_background\6g\bvim\0", "config", "everforest")
time([[Config for everforest]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n­\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\6c\blua\fhaskell\tjson\thtml\15javascript\btsx\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\n\0\v\1\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0004\4\0\0B\2\2\0019\2\4\0004\4\3\0\18\5\1\0'\a\5\0'\b\6\0005\t\a\0B\5\4\2>\5\1\4\18\5\1\0'\a\b\0'\b\t\0005\t\n\0B\5\4\0?\5\0\0B\2\2\1K\0\1\0\1\2\0\0\fhaskell\v where\vmodule\1\2\0\0\blua\t end\rfunction\14add_rules\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5€€À™\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire \1\0\1\3\1\5\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€6\1\2\0009\1\3\1B\1\1\2\15\0\1\0X\2\4€6\1\2\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\19expand_or_jump\23expand_or_jumpable\fluasnip\21select_next_item\fvisible”\1\0\1\4\1\5\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€6\1\2\0009\1\3\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€6\1\2\0009\1\4\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\tjump\rjumpable\fluasnip\21select_prev_item\fvisibleÕ\3\1\0\v\0 \00086\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\0049\4\n\0045\6\f\0009\a\b\0009\a\v\a)\tüÿB\a\2\2=\a\r\0069\a\b\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\b\0009\a\15\aB\a\1\2=\a\16\0069\a\b\0009\a\17\a5\t\20\0009\n\18\0009\n\19\n=\n\21\tB\a\2\2=\a\22\0069\a\b\0003\t\23\0005\n\24\0B\a\3\2=\a\25\0069\a\b\0003\t\26\0005\n\27\0B\a\3\2=\a\28\6B\4\2\2=\4\b\0034\4\3\0005\5\29\0>\5\1\0045\5\30\0>\5\2\4=\4\31\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NnnPicker lua require("packer.load")({'nnn.nvim'}, { cmd = "NnnPicker", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
