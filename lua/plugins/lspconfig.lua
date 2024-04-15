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
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    local builtin = require("telescope.builtin")
    local on_attach = function(client, bufnr)
        -- Enable signatures
        require("lsp_signature").on_attach({}, bufnr)

        -- Mappings when LSP has connected to a client
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
        vim.keymap.set('n', '<leader>sd', builtin.lsp_document_symbols, bufopts)
        vim.keymap.set('n', '<leader>sw', builtin.lsp_workspace_symbols, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    require'lspconfig'.dartls.setup({ on_attach = on_attach })

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
            require("lspconfig").luau_lsp.setup { settings = { Lua = {
                workspace = { checkThirdParty = false },
                diagnostics = { globals = { 'vim', 'Map' } } } } } -- don't complain about vim
        end
    }
end

return M

