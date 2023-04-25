vim.g.floaterm_autoinsert = true

Map("n", "<leader>t", vim.cmd.FloatermToggle)
Map("n", "<leader>tn", vim.cmd.FloatermNew)

local floaterm_custom_kill = function (id)
    vim.cmd(string.format("%sFloatermKill", id))
    local newId = vim.fn["floaterm#buflist#curr"]()
    vim.cmd("FloatermToggle")
end

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "floaterm",
    callback = function()
        BufMap("t", "<Esc>", [[<C-\><C-n>]])
        BufMap("t", "<C-h>", vim.cmd.FloatermPrev)
        BufMap("t", "<C-l>", vim.cmd.FloatermNext)
        BufMap("t", "<C-k>", vim.cmd.FloatermKill)
        BufMap("t", "<leader>t", vim.cmd.FloatermToggle)
        BufMap("t", "<leader>tn", vim.cmd.FloatermNew)
        BufMap("t", "<leader>td", function ()
            floaterm_custom_kill(vim.fn["floaterm#buflist#curr"]())
        end)
    end
})
