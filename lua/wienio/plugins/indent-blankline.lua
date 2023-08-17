
local status, ib = pcall(require, "indent_blankline")

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

ib.setup({
    show_end_of_line = true,
    space_char_blankline = " ",
})
