local opt = vim.opt

--line numbers
opt.number = true
opt.relativenumber = true

--indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

--cursor line
opt.cursorline = true

--looks
opt.termguicolors = true
opt.background = "dark"
opt.colorcolumn = "0"
opt.signcolumn = "yes"

--clipboard (forces neovim to paste from some different window)
opt.clipboard:append("unnamedplus")

--windows
opt.splitright = true
opt.splitbelow = true


--this considers the - sign as part of a word in neovim now
opt.iskeyword:append("-")
