local tree = require 'nvim-tree'
local map = require 'cartographer'
local commands = require 'lspsaga.command'

vim.g.mapleader = ' '
map:hook(function(buffer, _mode, lhs, rhs, opts)
require('notify')(vim.inspect(lhs) .. ' was mapped to ' .. vim.inspect(rhs))
end)
map.n.silent['<Leader>f'] = ':NvimTreeFocus<CR>'
map.n.silent['<Leader>r'] = function() require('lspsaga.command').load_command("rename") end


map.n.nore.silent['<Leader>r'] = function(...) commands.load_command("rename", ...) end
map.n.nore.silent['<C-j>'] = function(...) commands.load_command("diagnostic_jump_next", ...) end
map.n.nore.silent['<C-k>'] = function(...) commands.load_command("diagnostic_jump_prev", ...) end
map.n.silent['<Leader>p'] = vim.lsp.buf.formatting


tree.setup(vim.g.nvimtree_config or {})
map.n.nore.silent['<Leader>fr'] = function() require('nvim-tree.actions.root.change-dir').fn(vim.fn.expand("%:h"), 0) end

map.n.nore.silent['<Leader>o'] = ':Telescope oldfiles<CR>'
map.n.nore.silent['<Leader>n'] = ':NnnPicker<CR>'
