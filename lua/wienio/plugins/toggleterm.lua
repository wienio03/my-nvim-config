local status, tt = pcall(require, "toggleterm")

if not status then
	return
end

tt.setup({
	shell = "powershell",
})
