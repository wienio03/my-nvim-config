require('wienio.remap')
require('wienio.set')
vim.o.background = "dark"
require("mason").setup()
require("mason-nvim-dap").setup()
require("dapui").setup()
vim.opt.termguicolors = true
print('init.lua loaded')

--LAZY.NVIM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
            "folke/neodev.nvim",
        },
    },

    { -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
        dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- Git related plugins
    { "tpope/vim-fugitive",             lazy = true },
    { "tpope/vim-rhubarb",              lazy = true },
    { "lewis6991/gitsigns.nvim",        lazy = true },

    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim" },

    -- null_ls
    { "jose-elias-alvarez/null-ls.nvim" },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'akinsho/toggleterm.nvim',            version = "*", config = true },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        version = "nightly",
    },
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'lewis6991/gitsigns.nvim',
    'romgrk/barbar.nvim',
    'nvim-tree/nvim-web-devicons',
    'kosayoda/nvim-lightbulb',
    'ellisonleao/gruvbox.nvim',
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    'barrett-ruth/live-server.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'Mofiqul/vscode.nvim',
    'stevearc/dressing.nvim',
    'Dhanus3133/LeetBuddy.nvim',
    'neanias/everforest-nvim',
    'mhinz/vim-startify',
    'tomasiser/vim-code-dark',
    'overcache/NeoSolarized',
    'Zeioth/compiler.nvim',
    'ellisonleao/gruvbox.nvim',

    { "lukas-reineke/indent-blankline.nvim" },

    { "windwp/nvim-autopairs" },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html" },
        lazy = true,
        config = true,
    },

    {
        "brenoprata10/nvim-highlight-colors",
        ft = { "css" },
        config = true,
        lazy = true,
    },


    { "rafamadriz/friendly-snippets" },

    { "RRethy/vim-illuminate" },

    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({
                highlight = {
                    after = "",
                },
            })
        end,
    },

    { "kdheepak/lazygit.nvim" },
    { "stevearc/overseer.nvim" }

})


require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                [ "if"] = "@function.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
})
vim.cmd('colorscheme gruvbox')
require("nvim-lightbulb").setup({
    autocmd = { enabled = true }
})

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end
    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
end

local servers = {}
require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
})

mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        })
    end,
})


require("nvim-autopairs").setup({
    disable_in_replace_mode = false,
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
        end,
    },
})

require("luasnip/loaders/from_vscode").lazy_load()

local _border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = _border,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = _border,
})
vim.diagnostic.config({
    float = { border = _border },
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        bufnr = bufnr,
    })
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }), -- "--no-semi",
        -- formatting.black,
        formatting.autopep8.with({
            extra_args = { "--indent-size=2", "--ignore=E121", "--ignore=E305" },
        }),
        formatting.stylua,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
})

require("illuminate").configure({
    filetypes_denylist = {
        "NvimTree",
        "lazy",
        "norg",
        "toggleterm",
        "TelescopePrompt",
    },
})

require("nvim-tree").setup({
    renderer = {
        indent_markers = { enable = true },
    },
})

require("indent_blankline").setup({
    char = "┊",
    bufname_exclude = { ".*.norg" },
})

require("Comment").setup({
    toggler = { line = "<leader>/" },
    opleader = { line = "<leader>/" },
})

require('compiler').setup()
vim.keymap.set('n', '<leader>co', vim.cmd.CompilerOpen)
vim.keymap.set('n', '<leader>ct', vim.cmd.CompilerToggleResults)

--bindings
vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require("dapui").open()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require("dapui").close()<CR>', { noremap = true })
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
require('dressing').setup({
    input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = "Input:",

        -- Can be 'left', 'right', or 'center'
        title_pos = "left",

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        border = "rounded",
        -- 'editor' and 'win' will default to being centered
        relative = "cursor",

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        buf_options = {},
        win_options = {
            -- Window transparency (0-100)
            winblend = 10,
            -- Disable line wrapping
            wrap = false,
            -- Indicator for when text exceeds window
            list = true,
            listchars = "precedes:…,extends:…",
            -- Increase this for more context when text scrolls off the window
            sidescrolloff = 0,
        },

        -- Set to `false` to disable
        mappings = {
            n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
                ["<Up>"] = "HistoryPrev",
                ["<Down>"] = "HistoryNext",
            },
        },

        override = function(conf)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
        end,

        -- see :help dressing_get_config
        get_config = nil,
    },
    select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

        -- Trim trailing `:` from prompt
        trim_prompt = true,

        -- Options for telescope selector
        -- These are passed into the telescope picker directly. Can be used like:
        -- telescope = require('telescope.themes').get_ivy({...})
        telescope = nil,

        -- Options for fzf selector
        fzf = {
            window = {
                width = 0.5,
                height = 0.4,
            },
        },

        -- Options for fzf-lua
        fzf_lua = {
            -- winopts = {
            --   height = 0.5,
            --   width = 0.5,
            -- },
        },

        -- Options for nui Menu
        nui = {
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
                style = "rounded",
            },
            buf_options = {
                swapfile = false,
                filetype = "DressingSelect",
            },
            win_options = {
                winblend = 10,
            },
            max_width = 80,
            max_height = 40,
            min_width = 40,
            min_height = 10,
        },

        -- Options for built-in selector
        builtin = {
            -- These are passed to nvim_open_win
            border = "rounded",
            -- 'editor' and 'win' will default to being centered
            relative = "editor",

            buf_options = {},
            win_options = {
                -- Window transparency (0-100)
                winblend = 10,
                cursorline = true,
                cursorlineopt = "both",
            },

            -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- the min_ and max_ options can be a list of mixed types.
            -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },

            -- Set to `false` to disable
            mappings = {
                ["<Esc>"] = "Close",
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
            },

            override = function(conf)
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                return conf
            end,
        },

        -- Used to override format_item. See :help dressing-format
        format_item_override = {},

        -- see :help dressing_get_config
        get_config = nil,
    },

})
-- local c = require('vscode.colors').get_colors()
-- require('vscode').setup({
--     -- Alternatively set style in setup
--     -- style = 'light'
--
--     -- Enable transparent background
--     transparent = true,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },
--
--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--     }
-- })
-- require('vscode').load()

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

require("leetbuddy").setup({})
vim.keymap.set("n", "<leader>lq", vim.cmd.LBQuestions)
vim.keymap.set("n", "<leader>ll", vim.cmd.LBQuestion)
vim.keymap.set("n", "<leader>lr", vim.cmd.LBReset)
vim.keymap.set("n", "<leader>lt", vim.cmd.LBTest)
vim.keymap.set("n", "<leader>ls", vim.cmd.LBSubmit)



require('lualine').setup {
    options = {
        theme = 'vscode',
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
require('overseer').setup()
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set('n', '<leader>tt', vim.cmd.ToggleTerm)
vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle)
