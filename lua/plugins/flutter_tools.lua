local M = {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    opts = {
        lsp = {
            on_attach = My_on_attach
        }
    }
}

return M
