-- Hint: use `:h <option>` to figure out the meaning if needed

local opt = vim.opt

-- Line numbers
opt.number = true                   -- show absolute number
opt.relativenumber = true           -- add numbers to each line on the left side

-- Tabs and Indentation
opt.tabstop = 4                     -- number of visual spaces per tab
opt.shiftwidth = 4                  -- insert 4 spaces on a tab
opt.softtabstop = 4                 -- number of spacesin tab when editing
opt.expandtab = true                -- tabs are spaces, mainly because of python
opt.autoindent = true               -- autoindentation of the code

-- Line wrapping
opt.wrap = false                    -- endline wrapping

-- Line search
opt.incsearch = true                -- search as characters are entered
opt.hlsearch = true                 -- do not highlight matches
opt.ignorecase = false              -- ignore case in searches by default
opt.smartcase = true                -- but make it case sensitive if an uppercase is entered

-- Cursor line
opt.cursorline = true               -- highlight cursor line underneath the cursor horizontally
vim.opt.colorcolumn = "80"          -- show a column at 80 characters

-- UI config
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false            -- disable showmode because lualine already shows the current mode.

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Split windows
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.splitbelow = true           -- open new vertical split bottom

-- Characters config
vim.opt.list = true                 -- enable characters list
vim.opt.listchars:append "eol:¬"    -- add symbol to eol
vim.opt.listchars:append "tab:>-"   -- add symbol to tab
