local M = {
    "tpope/vim-fugitive",
    lazy = false
}

function M.config()
    Map("n", "<leader>gs", "<CMD>Git<CR>", "Git")
end

return M
