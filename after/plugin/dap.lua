--bindings
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require("dapui").open()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>db', 'DapToggleBreakpoint<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dapui").close()<CR>', {noremap=true})
local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
  print("nvim-dap not installed!")
  return
end 
require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
 
dap.configurations = {
    cpp = {
      {
        type = "cpp", -- Which adapter to use
        name = "Debug", -- Human readable name
        request = "attach", -- Whether to "launch" or "attach" to program
        program = "${file}", -- The buffer you are focused on when running nvim-dap
      },
    }
}
dap.adapters.cpp = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    args = {},
  },
}
