local work_wiki_path = vim.fn.expand("$HOME") .. "/work_wiki"
local personal_wiki_path = vim.fn.expand("$HOME") .. "/personal_wiki"

local M = {
    'serenevoid/kiwi.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        {
            name = "work",
            path = work_wiki_path
        },
        {
            name = "personal",
            path = personal_wiki_path
        }
    },
    keys = {
        { "<leader>ww", ":lua require(\"kiwi\").open_wiki_index()<cr>",             desc = "Open Wiki index" },
        { "<leader>wp", ":lua require(\"kiwi\").open_wiki_index(\"personal\")<cr>", desc = "Open index of personal wiki" },
        { "T",          ":lua require(\"kiwi\").todo.toggle()<cr>",                 desc = "Toggle Markdown Task" } },
    lazy = true
}

return M
