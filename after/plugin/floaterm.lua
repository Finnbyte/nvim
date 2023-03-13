vim.g.floaterm_autoinsert = true

Map({"n", "t"}, "<leader>t", vim.cmd.FloatermToggle)
Map({"n", "t"}, "<leader>tn", vim.cmd.FloatermNew)

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "floaterm",
    callback = function()
        BufMap("t", "<Esc>", [[<C-\><C-n>]])
        BufMap("t", "<C-h>", vim.cmd.FloatermPrev)
        BufMap("t", "<C-l>", vim.cmd.FloatermNext)
        BufMap("t", "<C-k>", vim.cmd.FloatermKill)
    end
})
