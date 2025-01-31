local M = {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
    config = function()
        local actions = require('telescope.actions')
        require("telescope").setup {
            defaults = {
                mappings = { i = { ["<esc>"] = actions.close } },
                disable_devicons = true,
                multi_icon = " ",
                color_devicons = false,
                file_ignore_patterns = {
                    "node_modules"
                },
            },
        }

        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>f,", function()
            local success = pcall(builtin.git_files)
            if not success then
                print("You need to be in a directory with .git/ for builtin.git_files!")
            end
        end)
        vim.keymap.set("n", "<leader>f.", builtin.find_files)
        vim.keymap.set("n", "<leader>f:", function() builtin.find_files() end)
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>/", function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } }) end)
        vim.keymap.set("n", "<leader><leader>", builtin.buffers)
        vim.keymap.set("n", "<leader>h", builtin.help_tags)
        vim.keymap.set("n", "<leader>:", builtin.commands)
    end
}

return M
