local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "-", ":Ex<cr>", {})

vim.cmd(":nnoremap <Leader>w <C-w>")
vim.cmd(":nnoremap <C-w> :close<cr>")
vim.cmd(":nnoremap <C-s> :split<cr>")
vim.cmd(":nnoremap <C-o> :only<cr>")


