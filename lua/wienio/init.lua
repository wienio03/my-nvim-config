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
require("nvim-highlight-colors").setup {
	render = 'background', -- or 'foreground' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = false,
	custom_colors = {
		-- label property will be used as a pattern initially(string.gmatch), therefore you need to escape the special characters by yourself with % 
		{label = '%-%-theme%-font%-color', color = '#fff'},
		{label = '%-%-theme%-background%-color', color = '#23222f'},
		{label = '%-%-theme%-primary%-color', color = '#0f1219'},
		{label = '%-%-theme%-secondary%-color', color = '#5a5d64'},
		{label = '%-%-theme%-contrast%-color', color = '#fff'},
		{label = '%-%-theme%-accent%-color', color = '#55678e'},
	}
}
require("nvim-highlight-colors").toggle()

