require "keymaps"
require "options"
require "lazy-config"
require "lualine-config"
require "telescope-config"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function() builtin.find_files({path_display="truncate"}) end, {})
vim.keymap.set('n', '\\', builtin.buffers, {})

vim.keymap.set('n', '<leader><Space>', ':w<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
