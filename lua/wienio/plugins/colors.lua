local status, hl = pcall(require, "nvim-highlight-colors")

if not status then return end

hl.setup({	render = 'background',
	enable_named_colors = true,
	enable_tailwind = true,
	custom_colors = {},
})
