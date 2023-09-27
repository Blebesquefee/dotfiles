local lsp_config_status, lsp_config = pcall(require, "lspconfig")
if not lsp_config_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

-- Enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }
    -- Set keybinds
    keymap.set('n', 'gm', ':Lspsaga hover_doc<CR>', opts)                       -- Jump to man
    keymap.set('n', 'gf', ':Lspsaga lsp_finder<CR>', opts)                      -- Additional finder
    keymap.set('n', 'gd', ':Lspsaga peek_definition<CR>', opts)                 -- Jump to definition
    keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)           -- Jump to declaration
    keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)        -- Jump to implementation
    keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)             -- Enable code action
    keymap.set('n', '<leader>rn', ':Lspsaga rename<CR>', opts)                  -- Rename selected words
    keymap.set('n', '<leader>o', ':Lspsaga outline<CR>', opts)                  -- Toggle outline
    keymap.set('n', '<leader>D', ':Lspsaga show_line_diagnostics<CR>', opts)    -- Show line diagnostic
    keymap.set('n', '<leader>d', ':Lspsaga show_cursor_diagnostics<CR>', opts)  -- Show cursor diagnostic
    keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)            -- Jump to previous diagnostic
    keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)            -- Jump to next diagnostic
end

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = ""
    })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  severity_sort = true,
  update_in_insert = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- Bash server
lsp_config["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- C type language server
lsp_config["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Cmake server
lsp_config["cmake"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- LateX server
lsp_config["ltex"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Lua server
lsp_config["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {        -- custom settings for lua
        Lua = {
            -- Make language server recognize "vim" global
            diagnostics = {
                globals = { "vim" }
            },
            -- Make language server aware of runtime files
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                }
            }
        }
    }
})

-- Markdown server
lsp_config["marksman"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Python server
lsp_config["jedi_language_server"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- SQL server
lsp_config["sqlls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
