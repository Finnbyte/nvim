local M = {
	"tpope/vim-vinegar",
    lazy = false,
    priority = 1000,
	name = "vinegar"
}

function M.config()
    Map("n", "<leader>.", function() vim.cmd.Ex() end, { noremap = true })

    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Ex({ args = { vim.fn.stdpath("config") }}) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Ex({ args = { vim.fn.stdpath("data") }}) end, {})
end

return M

