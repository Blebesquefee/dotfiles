-- https://github.com/rhysd/vim-clang-format

local setup, _ = pcall(require, "Clangformat")
if not setup then
    return
end

-- Enable autoformating on saving for c and cpp type files
vim.cmd([[autocmd FileType c,cpp ClangFormatAutoEnable]])
