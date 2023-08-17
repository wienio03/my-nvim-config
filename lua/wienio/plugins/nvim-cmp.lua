local cmp_status, cmp = pcall(require, "cmp")

if not cmp_status then return end

local lsnip_status, lsnip = pcall(require, "luasnip")

if not lsnip_status then return end

local lspkind_status , lspkind = pcall(require, "lspkind")

if not lspkind_status then return end


require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      lsnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), 
    ["<C-e>"] = cmp.mapping.abort(), 
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
 sources = cmp.config.sources({
    { name = "nvim_lsp" }, 
    { name = "luasnip" }, 
    { name = "buffer" }, 
    { name = "path" }, 
  }),
  formatting= {
    format = lspkind.cmp_format({
      maxwidth= 50,
      ellipsis_char = "...",
    }),
  },
})
