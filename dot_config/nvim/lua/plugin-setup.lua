-- Instal/ Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

-- Install plugins here - `use ...`
return packer.startup(function(use)

    -- Packer 
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plenary
    -- Lua functions that many plugins use
    use 'nvim-lua/plenary.nvim'

    -- Nvim web devicons
    -- Icons that many plugins use
    use 'nvim-tree/nvim-web-devicons'

    -- Onedark
    -- Color scheme
    use 'navarasu/onedark.nvim'

    -- Lualine
    -- Status bar
    use ({
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    })

    -- Barbar
    -- Tab bar manager
    use ({
        'romgrk/barbar.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    })

    -- Maximizer
    -- Maximize split window
    use 'szw/vim-maximizer'

    -- Indent-blankline
    -- Blank line identer with symbols
    use 'lukas-reineke/indent-blankline.nvim'

    -- Telescope
    -- File or word finder
    use ({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    })

    -- Use with fzf
    use ({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    })

    -- Toggleterm
    -- Terminal toggler
    use ({
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    })

    -- Gitsigns
    -- Shows git diff in the sign column
    use 'lewis6991/gitsigns.nvim'

    -- Bbye
    -- Delete buffers without closing your windows
    use 'moll/vim-bbye'

    -- Markdown Preview
    -- Markdown previewer
    use 'iamcco/markdown-preview.nvim'

    -- Colorizer
    -- Color code colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Comment
    -- Comment tool
    use 'numToStr/Comment.nvim'

    -- Alpha Nvim
    -- Nvim launch board
    use ({
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    })

    -- Nvim-tree
    -- File explorer
    use 'nvim-tree/nvim-tree.lua'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'      -- Main autocompletion tool
    use 'hrsh7th/cmp-buffer'    -- Enable cmp to recommand from current buffer
    use 'hrsh7th/cmp-path'      -- Enable cmp to recommand from current path

    -- Snippets
    use 'L3MON4D3/LuaSnip'              -- Main snippet tool
    use 'saadparwaiz1/cmp_luasnip'      -- Enable cmp to use snippet
    use 'rafamadriz/friendly-snippets'  -- Collection of multi-language snippets

    -- LSP servers
    use 'williamboman/mason.nvim'               -- Main LSP servers manager
    use 'williamboman/mason-lspconfig.nvim'     -- Linker between mason and nvim-lspconfig plugins

    -- Configuring LSP servers
    use 'neovim/nvim-lspconfig'         -- Main LSP servers configurator
    use 'hrsh7th/cmp-nvim-lsp'          -- Enable LSP servers configurations to appear in cmp autocompletion
    use ({                              -- Enable UI to LSP
        'glepnir/lspsaga.nvim',
        branch = "main"
    })
    use 'onsails/lspkind.nvim'          -- Enable VSCode Icons

    -- Formatting & Linting
    use 'rhysd/vim-clang-format'            -- Clang Format
    use 'jose-elias-alvarez/null-ls.nvim'   -- Universal formatting
    use 'jay-babu/mason-null-ls.nvim'       -- Linker between mason and null-ls

    -- Treesitter
    -- Parser generator tool
    use ({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require("nvim-treesitter.install").update({
                with_sync = true
            })
        end
    })

    -- Autopairs
    -- Auto closing parenthesis
    use 'windwp/nvim-autopairs'

    -- Presence
    -- Discord plugin for Neovim
    use 'andweeb/presence.nvim'


    if packer_bootstrap then
        require("packer").sync()
    end
end)
