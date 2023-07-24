--bindings
vim.api.nvim_set_keymap('n', '<leader>dt', ':DapUIToggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>db', 'DapToggleBreakpoint<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':DapContinue<CR>', {noremap=true})
