local M = {
    "jiaoshijie/undotree",
    keys = { { "<leader>u" } },
    config = function()
        vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
        require("undotree").setup()
    end
}

return M
