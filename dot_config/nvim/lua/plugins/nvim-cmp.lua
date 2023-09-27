local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

-- load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

-- Enable autocompletion
vim.opt.completeopt = "menu,menuone,noselect"

-- Configuratiom
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),       -- previous suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(),         -- next suggestion
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-CR>"] = cmp.mapping.complete(),                -- show completion suggestions
        ["<C-x>"] = cmp.mapping.abort(),                    -- close completion window
        ["<CR>"] = cmp.mapping.confirm({select = false})    -- confirm selection
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- lsp
        { name = "luasnip" },   -- snippets
        { name = "buffer" },    -- text within current buffer
        { name = "path" }       -- file system path
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "..."
        })
    }
})
