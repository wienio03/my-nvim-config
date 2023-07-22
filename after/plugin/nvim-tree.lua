vim.g.loaded_netrw =1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle)

vim.keymap.set('n', '<leader>ct', vim.cmd.NvimTreeClose)
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
