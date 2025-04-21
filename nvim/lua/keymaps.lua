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

vim.cmd('unmap Y')

vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<M-Tab>', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '>>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<M-Tab>', '<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<M-Tab>', '<C-d>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-t>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<PageDown>', '<C-d>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<PageUp>', '<C-u>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w-', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ww', '<C-w>c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wo', '<C-w>o', { noremap = true, silent = true })


