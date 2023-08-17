local dap_status, dap = pcall(require, "dap")

if not dap_status then return end

local dapui_status, dapui = pcall(require, "dapui")

if not dapui_status then return end

local mason_dap_status, mason_dap = pcall(require, "mason-nvim-dap")

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

dapui.setup()
mason_dap.setup({
  ensure_installed = {
    "codelldb",
  }
})
