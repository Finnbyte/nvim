local M = {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = { "neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim" }
}

function M.config()
    require("mason-lspconfig").setup {
        ensure_installed = {
            "html",
            "cssls",
            "tsserver",
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
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

    local builtin = require("telescope.builtin")
    local on_attach = function(client, bufnr)
        -- Enable signatures
        require("lsp_signature").on_attach({}, bufnr)

        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. (desc or "No info") })
        end

        map('K', vim.lsp.buf.hover, "")
        map('gD', vim.lsp.buf.declaration, "")
        map('gd', require('telescope.builtin').lsp_definitions, "")
        map('gr', require('telescope.builtin').lsp_references, "")
        map('gI', require('telescope.builtin').lsp_implementations, "")
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, "")
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, "")
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, "")
        map('<leader>rn', vim.lsp.buf.rename, "")
        map('<leader>ff', function() vim.lsp.buf.format { async = true } end, "")
        map('<leader>ca', vim.lsp.buf.code_action, "")
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Integrate cmp with LSP
    require("mason-lspconfig").setup_handlers {
        function(server_name) -- global handler
            require("lspconfig")[server_name].setup {
                on_attach = on_attach,
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

        require("lspconfig").dartls.setup({ on_attach = on_attach })

    end

    return M

