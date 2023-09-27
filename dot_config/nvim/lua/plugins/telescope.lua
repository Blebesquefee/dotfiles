-- https://github.com/nvim-telescope/telescope.nvim

local setup, telescope = pcall(require, "telescope")
if not setup then
    return
end

local setup, actions = pcall(require, "telescope.actions")
if not setup then
    return
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.close
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.close
            }
        }
    }
})

telescope.load_extension('fzf')
