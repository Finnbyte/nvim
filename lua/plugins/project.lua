local M = {
    "ahmedkhalf/project.nvim",
    keys = {
        { "<leader>ps", function() require("telescope").extensions.projects.projects {} end }
    }
}

function M.config()
    require("project_nvim").setup()
end

return M
