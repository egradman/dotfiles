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

vim.cmd([[colorscheme gruvbox]])

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

vim.api.nvim_set_keymap(
  "n",
  "<space>t",
  ":TagbarToggle<CR>",
  { noremap = true }
)

vim.cmd("let g:tagbar_type_ansible = { 'ctagstype' : 'ansible', 'kinds' : [ 't:tasks' ], 'sort' : 0 }")

require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
require("nvim-surround").setup()

vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })
