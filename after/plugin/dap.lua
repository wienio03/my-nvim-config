--bindings
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require("dapui").open()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dapui").close()<CR>', {noremap=true})
vim.keymap.set('n', '<leader>db', vim.cmd.DapToggleBreakpoint)
vim.keymap.set('n', '<leader><F8>', vim.cmd.DapContinue)
vim.keymap.set('n', '<leader><F7>', vim.cmd.DapStepInto)
vim.keymap.set('n', '<leader><F6>', vim.cmd.DapStepOver)
vim.keymap.set('n', '<leader><F5>', vim.cmd.DapStepOut)
vim.keymap.set('n', '<leader>dx', vim.cmd.DapTerminate)
--configuration of CPP debugger
local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim-dap not installed!")
    return
end

require('dap').set_log_level('INFO')
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

