local actions = require('telescope.actions')
require("telescope").setup {
    defaults = {
        disable_devicons = true,
        multi_icon = " ",
        color_devicons = false,
        file_ignore_patterns = {
            "node_modules"
        },
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
Map("n", "<leader>f,", builtin.git_files)
Map("n", "<leader>f.", builtin.find_files)
Map("n", "<leader>fr", builtin.oldfiles)
Map("n", "<leader>fg", function() builtin.live_grep() end)
Map("n", "<leader>/", function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p")}}) end)
Map("n", "<leader><leader>", builtin.buffers)
Map("n", "<leader>h", builtin.help_tags)
Map("n", "<leader>:", builtin.commands)
