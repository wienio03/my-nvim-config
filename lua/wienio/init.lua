require('wienio.remap')
require('wienio.set')
print('init loaded')
--lightbulb
require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})
--vsc theme
vim.o.background = "dark"
local c = require('vscode.colors').get_colors()
require('vscode').setup({

    transparent = true,

    italic_comments = true,

    disable_nvimtree_bg = true,

    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
require('vscode').load()
require("mason").setup()
require("mason-nvim-dap").setup()
require("dapui").setup()
