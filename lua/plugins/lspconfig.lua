local M = {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = { "neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim" }
}

My_on_attach = function(client, bufnr)
    print("On attached!!!")
    -- Enable signatures

    -- local map = function(keys, func, desc)
    --     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. (desc or "No info") })
    -- end
    --
    vim.keymap.set("n", 'K', vim.lsp.buf.hover)
    vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
    vim.keymap.set("n", 'gd', require('telescope.builtin').lsp_definitions)
    vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set("n", 'gI', require('telescope.builtin').lsp_implementations)
    vim.keymap.set("n", '<leader>D', require('telescope.builtin').lsp_type_definitions)
    vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols)
    vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    vim.keymap.set("n", '<leader>rn', function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", '<leader>ff', function() vim.lsp.buf.format { async = true } end)
    vim.keymap.set("n", '<leader>ca', function()
        print("yeyy")
        vim.lsp.buf.code_action()
    end)
end

function M.config()
    require("mason-lspconfig").setup {
        ensure_installed = {
            "html",
            "cssls",
            "ts_ls",
            "eslint",
            "lua_ls",
            "pyright",
        },
        automatic_installation = true,
    }

    -- Diagnostics configuration
    vim.diagnostic.config({ signs = false })

    -- Mappings
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set("n", 'K', vim.lsp.buf.hover)
    vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
    vim.keymap.set("n", 'gd', require('telescope.builtin').lsp_definitions)
    vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set("n", 'gI', require('telescope.builtin').lsp_implementations)
    vim.keymap.set("n", '<leader>D', require('telescope.builtin').lsp_type_definitions)
    vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols)
    vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    vim.keymap.set("n", '<leader>rn', function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", '<leader>ff', function() vim.lsp.buf.format { async = true } end)
    vim.keymap.set("n", '<leader>ca', function()
        print("yeyy")
        vim.lsp.buf.code_action()
    end)

    local builtin = require("telescope.builtin")


    local capabilities = function() end
    require("mason-lspconfig").setup_handlers {
        function(server_name)                                           -- global handler
            require("lspconfig")[server_name].setup {
                on_attach = My_on_attach,
                capabilities = capabilities,
            }
        end,
        -- override for lua server
        ["luau_lsp"] = function()
            require("lspconfig").lua_ls.setup { settings = { Lua = {
                workspace = { checkThirdParty = false },
                diagnostics = { globals = { 'vim', 'Map' } } } } } -- don't complain about vim
        end
    }
end

return M
