require('wienio.remap')
require('wienio.set')
--lightbulb
require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})
vim.o.background = "dark"
require("mason").setup()
require("mason-nvim-dap").setup()
require("dapui").setup()
-- Lua
vim.opt.termguicolors = true
vim.cmd('colorscheme NeoSolarized')
print('init.lua loaded')



