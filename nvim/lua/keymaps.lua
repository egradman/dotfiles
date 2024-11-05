local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("", "-", ":Ex<cr>", {})

vim.cmd(":nnoremap <C-s> :split<cr>")
--vim.cmd(":nnoremap <C-o> :only<cr>")

vim.api.nvim_create_user_command(
    'Plugins',
    function (opts)
      vim.api.nvim_command('edit ' .. '~/.dotfiles/nvim/lua/plugins.lua')
    end,
    {}
)

