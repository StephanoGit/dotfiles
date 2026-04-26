vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window', remap = false })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window', remap = false })
vim.keymap.set('n', '<leader>fe', ':Neotree reveal<CR>', { desc = 'Reveal file in explorer', silent = true })
