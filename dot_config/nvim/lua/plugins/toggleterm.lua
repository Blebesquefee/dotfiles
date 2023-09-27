-- https://github.com/akinsho/toggleterm.nvim

local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
    return
end

toggleterm.setup({
    open_mapping = '<C-s>',
    direction = 'float',
    shade_terminals = false
})
