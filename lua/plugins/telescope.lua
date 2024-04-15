local M = {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
}

function M.config()
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
    Map("n", "<leader>f,", function()
        local success = pcall(builtin.git_files)
        if not success then
            print("You need to be in a directory with .git/ for builtin.git_files!")
        end
    end)
    Map("n", "<leader>f.", builtin.find_files)
    Map("n", "<leader>fr", builtin.oldfiles)
    Map("n", "<leader>fg", builtin.live_grep, "Grep text in current working directory")
    Map("n", "<leader>/", function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p")}}) end, "Grep text in current file")
    Map("n", "<leader><leader>", builtin.buffers)
    Map("n", "<leader>h", builtin.help_tags)
    Map("n", "<leader>:", builtin.commands)
end

return M

