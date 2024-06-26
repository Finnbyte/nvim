local M = {
    "folke/trouble.nvim",
    keys = {
        { "<leader>xx", function() require("trouble").toggle() end },
        { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end },
        { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end },
        { "<leader>xq", function() require("trouble").toggle("quickfix") end },
        { "<leader>xl", function() require("trouble").toggle("loclist") end },
        { "gR",         function() require("trouble").toggle("lsp_references") end }
    }
}

return M
