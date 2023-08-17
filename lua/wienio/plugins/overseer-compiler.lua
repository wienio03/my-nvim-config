local os_status, os = pcall(require, "overseer")

if not os_status then return end

local compiler_status, compiler = pcall(require, "compiler")

if not compiler_status then return end

os.setup()

compiler.setup()
