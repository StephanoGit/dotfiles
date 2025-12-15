require('FTerm').setup({
  border = 'double',
  dimensions = {
    height = 0.6,
    width = 0.75,
  },
})

-- Keybindings for Control + minus
vim.keymap.set('n', '<C-->', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-->', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
