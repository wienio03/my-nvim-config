require('wienio.remap')
require('wienio.set')
print('init loaded')
--lightbulb
require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})
--gruvbox
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
