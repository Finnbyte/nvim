local M = {
    {
        "tpope/vim-vinegar",
        name = "vinegar",
        lazy = false,
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional 
    }
}

local function vinegar()
    Map("n", "<leader>.", function() vim.cmd.Ex() end, { noremap = true })

    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Ex({ args = { vim.fn.stdpath("config") }}) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Ex({ args = { vim.fn.stdpath("data") }}) end, {})
end

local function oil()
    require("oil").setup()
    Map("n", "<leader>.", function() vim.cmd.Oil() end, { noremap = true })
    Map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Oil({ args = { vim.fn.stdpath("config") }}) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Oil({ args = { vim.fn.stdpath("data") }}) end, {})
end


M[2].config = function()
    oil()
end


return M

