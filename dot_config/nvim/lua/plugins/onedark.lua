-- https://github.com/navarasu/onedark.nvim

local setup, onedark = pcall(require, "onedark")
if not setup then
    return
end

onedark.setup({
    style = 'warmer',
    code_style = {
        comments = 'italic',
        functions = 'italic,bold'
    }
})

onedark.load()
