local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    code_action = {
        extend_gitsigns = true
    },
    definition = {
        keys = {
            edit = 'e',
            vsplit = '<C-v>',
            split = '<C-h>',
            tabe = '<C-t>',
            quit = 'q',
            close = '<C-x>'
        }
    },
    diagnostic = {
        keys = {
            exec_action = '<CR>',
            quit = 'q',
            toggle_or_jump = '<CR>',
            quit_in_show = '<C-x>'
        }
    },
     finder = {
        keys = {
            toggle_or_open = '<CR>',
            vsplit = '<C-v>',
            split = '<C-h>',
            tabnew = '<C-t>',
            quit = 'q',
            close = '<C-x>'
        }
    },
    hover = {
        open_cmd = '!chrome'
    },
    lightbulb = {
        virtual_text = false
    },
    rename = {
        keys = {
            quit = 'q'
        }
    },
    ui = {
        border = 'rounded',
        code_action = '',
        keys = {
            scroll_down = '<C-j>',
            scroll_up = '<C-k>'
        }
    }
})
