vim.keymap.set("", "<Space>", "<Nop>", {noremap=true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.python3_host_prog=vim.fn.expand("~/.dotfiles/nvim_venv/.venv/bin/python3")


require "keymaps"
require "options"
require "lazy-config"
require "lualine-config"
require "telescope-config"
local keymap = vim.api.nvim_set_keymap

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function() builtin.find_files({path_display="truncate"}) end, {})
vim.keymap.set('n', '\\', builtin.buffers, {})

vim.keymap.set('n', '<leader><Space>', ':w<cr>')

vim.api.nvim_set_keymap('c', '<Up>', 'wildmenumode() ? "<Left>" : "<Up>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<Down>', 'wildmenumode() ? "<Right>" : "<Down>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<Left>', 'wildmenumode() ? "<Up>" : "<Left>"', {expr = true, noremap=true})
vim.api.nvim_set_keymap('c', '<Right>', 'wildmenumode() ? "<Down>" : "<Right>"', {expr = true, noremap=true})

vim.api.nvim_set_keymap(
  "n",
  "<space>d",
  ":Telescope file_browser<CR>",
  { noremap = true }
)



--vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
--vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
--vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
--vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })


vim.cmd("let g:gruvbox_transparent_bg = 1")
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
