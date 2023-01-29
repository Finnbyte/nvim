require("telescope").setup {
    defaults = {
        disable_devicons = true,
        multi_icon = " ",
        color_devicons = false,
    },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        }
    }
}

-- Handle builtins
local builtin = require('telescope.builtin')
map('n', '<leader>fr', builtin.oldfiles, {})
map('n', '<leader>fg', function() builtin.grep_string({ search = vim.fn.input("Grep > "), regex = true }) end, {})
map('n', '<leader>bb', builtin.buffers, {})
map('n', '<leader>h', builtin.help_tags, {})
