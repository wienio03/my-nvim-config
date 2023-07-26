require('compiler').setup()
vim.keymap.set('n', '<leader>co', vim.cmd.CompilerOpen)
vim.keymap.set('n', '<leader>ct', vim.cmd.CompilerToggleResults)
