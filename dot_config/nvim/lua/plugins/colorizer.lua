-- https://github.com/norcalli/nvim-colorizer.lua

local setup, colorizer = pcall(require, "colorizer")
if not setup then
    return
end

colorizer.setup()
