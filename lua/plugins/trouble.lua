local M = {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
        "<leader>xx", "<cmd>TroubleToggle<cr>",
        "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
        "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
        "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        "gR", "<cmd>TroubleToggle lsp_references<cr>",
    },
    opts = {
        icons = false,
        fold_open = "v",      -- icon used for open folds
        fold_closed = ">",    -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_diagnostic_signs = false
    }
}

return M
