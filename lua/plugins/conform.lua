local M = {
    "stevearc/conform.nvim",
    main = "conform",
    event = "BufReadPost"
}

M.config = function()
    print("hi")
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- Use a sub-list to run only the first available formatter
            javascript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
    })
end

return M
