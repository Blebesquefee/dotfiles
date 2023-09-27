-- Hint: see `:h vim.map.set()`
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local keymap = vim.keymap -- for conciseness

-------------------------------------------------------------------------------
------                            Normal mode                            ------
-------------------------------------------------------------------------------

-- Basic keymaps
vim.g.mapleader = " "
keymap.set('n', 'o', 'o<esc>', opts)                -- create new line under current one
keymap.set('n', 'O', 'O<esc>', opts)                -- create new line upper current one
keymap.set('n', '<leader>nh', ':nohl<CR>', opts)     -- clear search highlight

-- Window split
keymap.set('n', '<leader>sv', '<C-w>v', opts)         -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', opts)         -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', opts)         -- make split window equal width
keymap.set('n', '<leader>sx', ':close<CR>', opts)     -- close current split window

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h', opts)        -- go to left window
keymap.set('n', '<C-j>', '<C-w>j', opts)        -- go to down window
keymap.set('n', '<C-k>', '<C-w>k', opts)        -- go to up window
keymap.set('n', '<C-l>', '<C-w>l', opts)        -- go to right window

-- Tab managment
keymap.set('n', '<leader>to', ':tabnew<CR>', opts)      -- open new tab

-- Maximizer ------------------------------------------------------------------
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', opts) -- maximize split window

-- Barbar ---------------------------------------------------------------------
keymap.set('n', 't1', ':BufferGoto 1<CR>', opts)            -- go to buffer 1
keymap.set('n', 't2', ':BufferGoto 2<CR>', opts)            -- go to buffer 2
keymap.set('n', 't3', ':BufferGoto 3<CR>', opts)            -- go to buffer 3
keymap.set('n', 't4', ':BufferGoto 4<CR>', opts)            -- go to buffer 4
keymap.set('n', 't5', ':BufferGoto 5<CR>', opts)            -- go to buffer 5
keymap.set('n', 't6', ':BufferGoto 6<CR>', opts)            -- go to buffer 6
keymap.set('n', 't7', ':BufferGoto 7<CR>', opts)            -- go to buffer 7
keymap.set('n', 't8', ':BufferGoto 8<CR>', opts)            -- go to buffer 8
keymap.set('n', 't9', ':BufferGoto 9<CR>', opts)            -- go to buffer 9
keymap.set('n', 't0', ':BufferLast<CR>', opts)              -- go to last buffer
keymap.set('n', '<leader>tn', ':BufferNext<CR>', opts)      -- go to next tab
keymap.set('n', '<leader>tp', ':BufferPrevious<CR>', opts)  -- go to previous tab

-- Bbye -----------------------------------------------------------------------
keymap.set('n', '<leader>tx', ':Bdelete<CR>', opts)             -- close current buffer

-- Telescope ------------------------------------------------------------------
keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<cr>', opts)                  -- find file in current working directory
keymap.set('n', '<leader>fg', '<Cmd>Telescope builtin.git_files<cr>', opts)                  -- find file in current git
keymap.set('n', '<leader>fd', '<Cmd>Telescope diagnostics<cr>', opts)                 -- find diagnostic errors 
keymap.set('n', '<leader>fs', '<Cmd>Telescope current_buffer_fuzzy_find<cr>', opts)   -- find word in current file

-- Clang-format ---------------------------------------------------------------
keymap.set('n', '<leader>cf', ':<C-u>ClangFormat<CR>', opts)     -- clang format line


-- Nvim-Tree ------------------------------------------------------------------
keymap.set('n', '<leader>eo', ':NvimTreeOpen<CR>', opts)       -- open nvim tree
keymap.set('n', '<leader>ex', ':NvimTreeClose<CR>', opts)       -- close nvim tree


-------------------------------------------------------------------------------
------                            Visual mode                            ------
-------------------------------------------------------------------------------

-- Clang-format ---------------------------------------------------------------
keymap.set('v', '<leader>cf', ':ClangFormat<CR>', opts)     -- clang format selected lines


-------------------------------------------------------------------------------
------                            Insert mode                            ------
-------------------------------------------------------------------------------

-- Simple escape
keymap.set('i', 'ii', '<ESC>', opts)
