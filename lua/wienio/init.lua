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
local polish = function()
    require("notify").setup{
        background_colour = "#1a1b26"   
    }
end
polish()
vim.notify = require('notify')
require("notify")("init.lua loaded successfully")
vim.cmd('colorscheme NeoSolarized')



