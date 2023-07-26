--bindings
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require("dapui").open()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>db', 'DapToggleBreakpoint<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dapui").close()<CR>', {noremap=true})
--configuration of CPP debugger
local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim-dap not installed!")
    return
end

require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

dap.configurations = {
    cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            runInTerminal = true,

        },
    }
}
dap.adapters.executable = {
    type = 'executable',
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
    name = 'lldb1',
    host = '127.0.0.1',
    port = 13000
}
dap.adapters.lldb = {
    name = "codelldb server",
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

