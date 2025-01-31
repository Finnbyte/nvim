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
    vim.keymap.set("n", "<leader>.", function() vim.cmd.Ex() end, { noremap = true })

    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Ex({ args = { vim.fn.stdpath("config") } }) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Ex({ args = { vim.fn.stdpath("data") } }) end, {})
end

local function oil()
    require("oil").setup({
        columns = {
            -- "icon",
            "permissions",
            "size",
            "mtime",
        },
        keymaps = {
            ["cd"] = "actions.cd",
            ["."] = { "actions.cd", mode = "n" },
        }
    })
    vim.keymap.set("n", "<leader>.", function() vim.cmd.Oil() end, { noremap = true })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Oil({ args = { vim.fn.stdpath("config") } }) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Oil({ args = { vim.fn.stdpath("data") } }) end, {})
end


M[2].config = function()
    oil()
end


return M
