 -- https://github.com/nvim-lualine/lualine.nvim

local setup, lualine = pcall(require, "lualine")
if not setup then
    return
end

lualine.setup({
    options = {
        theme = 'onedark',
        icons_enabled = true,
        disabled_filetypes = {
            statusline = {
                'Nvimtree'
            }
        }
    }
})
