vim.g.floaterm_autoinsert = true

Map("n", "<C-n>", vim.cmd.FloatermToggle)
Map("n", "<C-S-n>", vim.cmd.FloatermNew)

local floaterm_custom_kill = function (id)
    vim.cmd(string.format("%sFloatermKill", id))
    local newId = vim.fn["floaterm#buflist#curr"]()
    vim.cmd("FloatermToggle")
end

vim.api.nvim_create_autocmd({ "VimLeavePre "}, {
    pattern = "*",
    callback = function()
        local ids = vim.fn["floaterm#buflist#gather"]()
        for _, id in ipairs(ids) do
            vim.cmd(string.format("%sFloatermKill", id))
        end
    end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "floaterm",
    callback = function()
        BufMap("t", "<Esc>", [[<C-\><C-n>]])
        BufMap("t", "<C-h>", vim.cmd.FloatermPrev)
        BufMap("t", "<C-l>", vim.cmd.FloatermNext)
        BufMap("t", "<C-k>", vim.cmd.FloatermKill)
        BufMap("t", "<C-n>", vim.cmd.FloatermToggle)
        BufMap("t", "<C-S-n>", vim.cmd.FloatermNew)
        BufMap("t", "<C-S-->", function ()
            floaterm_custom_kill(vim.fn["floaterm#buflist#curr"]())
        end)
    end
})
