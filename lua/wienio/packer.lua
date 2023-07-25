vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/vscode.nvim'
    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    use 'nvim-tree/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'romgrk/barbar.nvim'
    use 'tpope/vim-fugitive'
    use 'nvim-tree/nvim-web-devicons'
    use 'kosayoda/nvim-lightbulb'
    use 'ellisonleao/gruvbox.nvim'
     use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }

    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function() require("toggleterm").setup() end}
    use 'alvan/vim-closetag'
    use 'tpope/vim-surround'
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'barrett-ruth/live-server.nvim'
    use {'jay-babu/mason-nvim-dap.nvim', config =
    function()
        local dapui = require("dapui")
        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_initialized["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_initialized["dapui_config"] = function()
            dapui.close()
        end
    end
    }
    use 'brenoprata10/nvim-highlight-colors'
end)
