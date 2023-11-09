local status, tt = pcall(require, "toggleterm")

if not status then
	return
end

local function return_shell()
	if package.config:sub(1, 1) == "\\" then
		return "powershell"
	elseif package.config:sub(1, 1) == "/" then
		return "bash"
	end
end

tt.setup({
	shell = return_shell(),
})
