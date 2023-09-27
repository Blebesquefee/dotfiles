-- https://github.com/nvim-tree/nvim-tree.lua

local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- Recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Change indent marker color
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#bb70d2" ]])

-- Configuration
nvimtree.setup({
    sort_by = "filetype",
    view = {
        cursorline = true,
        width = {
            min = 30,
            max = 45
        },
        number = true,
        relativenumber = true,
    },
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "💥",
                    renamed = "󰜥",
                    untracked = "",
                    deleted = "✗",
                }
            }
        }
    }
})
