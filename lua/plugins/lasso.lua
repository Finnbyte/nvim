local M = {
    "niqodea/lasso.nvim",
    lazy = false,
    config = function()
        local lasso = require("lasso")
        lasso.setup {}

        -- Mark current file
        vim.keymap.set('n', vim.g.mapleader .. 'm', function() lasso.mark_file() end)

        -- Go to marks tracker (editable, use `gf` to go to file under cursor)
        vim.keymap.set('n', vim.g.mapleader .. 'M', function() lasso.open_marks_tracker() end)

        -- Moving to marks
        vim.keymap.set("n", "<C-b>", function() lasso.open_marked_file(1) end)
        vim.keymap.set("n", "<C-n>", function() lasso.open_marked_file(2) end)
        vim.keymap.set("n", "<C-m>", function() lasso.open_marked_file(3) end)
        vim.keymap.set("n", "<C-,>", function() lasso.open_marked_file(4) end)
    end
}

return M
