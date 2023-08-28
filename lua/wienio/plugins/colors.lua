local status, hl = pcall(require, "colorizer")

if not status then
	return
end

hl.setup({
	DEFAULT_OPITONS = {
		RRGGBBAA = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
	},
	"css",
	"javascript",
	"javascriptreact",
	"html",
})
