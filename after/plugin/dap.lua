--bindings
require("dapui").setup()
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require("dapui").open()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>db', 'DapToggleBreakpoint<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dapui").close()<CR>', {noremap=true})

