local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "ltex",
        "lua_ls",
        "marksman",
        "jedi_language_server",
        "sqlls"
    }
})

mason_null_ls.setup({
    ensure_installed = {
        "beautysh",         -- All sh types files
        "black",            -- Python files
        "cbfmt",            -- Markdown files
        "clang_format",     -- All C types files
        "cmakelang",        -- Cmake files
        "latexindent",      -- LateX files
        "stylua",           -- Lua files
        "sqlfmt"            -- SQL files
    }
})
