require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "html",
        "cssls",
        "tsserver",
        "omnisharp",
        "omnisharp_mono",
        "eslint",
        "gopls",
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
    require "lsp_signature".on_attach(signature_setup, bufnr)

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

-- {{ Available language servers: }}
--
-- AWK => awk_ls
-- Ada => als
-- Angular => angularls
-- Ansible => ansiblels
-- Apex => apex_ls
-- Arduino => arduino_language_server
-- Assembly => GAS/NASM, GO) 	asm_lsp
-- Astro => astro
-- Bash => bashls
-- Beancount => beancount
-- Bicep => bicep
-- BrighterScript => bright_script
-- Buf => bufls
-- C => clangd
-- C# => csharp_ls
-- C# => docs) 	omnisharp_mono
-- C# => docs) 	omnisharp
-- C++ => clangd
-- CMake => cmake
-- CMake => neocmake
-- CSS => cssls
-- CSS => cssmodules_ls
-- Clarity => clarity_lsp
-- Clojure => clojure_lsp
-- CodeQL => codeqlls
-- Crystal => crystalline
-- Cucumber => cucumber_language_server
-- Cue => dagger
-- Deno => denols
-- Dhall => dhall_lsp_server
-- Diagnostic => general purpose server) 	diagnosticls
-- Dlang => serve_d
-- Docker => dockerls
-- Dot => dotls
-- Drools => drools_lsp
-- EFM => general purpose server) 	efm
-- ESLint => eslint
-- Elixir => elixirls
-- Elm => elmls
-- Ember => ember
-- Emmet => emmet_ls
-- Erg => erg_language_server
-- Erlang => erlangls
-- F# => fsautocomplete
-- Flux => flux_lsp
-- Foam => OpenFOAM) 	foam_ls
-- Fortran => fortls
-- Glint => glint
-- Go => golangci_lint_ls
-- Go => gopls
-- Gradle => gradle_ls
-- Grammarly => grammarly
-- GraphQL => graphql
-- Groovy => groovyls
-- HTML => html
-- Haskell => hls
-- Haxe => haxe_language_server
-- Hoon => hoon_ls
-- JSON => jsonls
-- Java => jdtls
-- JavaScript => quick_lint_js
-- JavaScript => tsserver
-- JavaScript => vtsls
-- Jsonnet => jsonnet_ls
-- Julia => docs) 	julials
-- Kotlin => kotlin_language_server
-- LaTeX => ltex
-- LaTeX => texlab
-- Lelwel => lelwel_ls
-- Lua => sumneko_lua
-- Luau => luau_lsp
-- Markdown => marksman
-- Markdown => prosemd_lsp
-- Markdown => remark_ls
-- Markdown => zk
-- Metamath => ero 	mm0_ls
-- Nickel => nickel_ls
-- Nim => nimls
-- Nix => nil_ls
-- Nix => rnix
-- OCaml => ocamllsp
-- OneScript, => C:Enterprise 	bsl_ls
-- OpenAPI => spectral
-- OpenCL => opencl_ls
-- OpenSCAD => openscad_lsp
-- PHP => intelephense
-- PHP => phpactor
-- PHP => psalm
-- Perl => perlnavigator
-- Powershell => powershell_es
-- Prisma => prismals
-- Puppet => puppet
-- PureScript => purescriptls
-- Python => jedi_language_server
-- Python => pyre
-- Python => pyright
-- Python => sourcery
-- Python => docs) 	pylsp
-- Python => ruff_lsp
-- R => r_language_server
-- Raku => raku_navigator
-- ReScript => rescriptls
-- Reason => reason_ls
-- Robot => ramework 	robotframework_ls
-- Rome => rome
-- Ruby => ruby_ls
-- Ruby => solargraph
-- Rust => rust_analyzer
-- SQL => sqlls
-- SQL => sqls
-- Salt => salt_ls
-- Shopify => heme Check 	theme_check
-- Slint => slint_lsp
-- Smithy => smithy_ls
-- Solidity => solang
-- Solidity => solc
-- Solidity => solidity
-- Sorbet => sorbet
-- Sphinx => esbonio
-- Stylelint => stylelint_lsp
-- Svelte => svelte
-- SystemVerilog => svlangserver
-- SystemVerilog => svls
-- SystemVerilog => verible
-- TOML => taplo
-- Tailwind => SS 	tailwindcss
-- Teal => teal_ls
-- Terraform => terraformls
-- Terraform => docs) 	tflint
-- TypeScript => tsserver
-- TypeScript => vtsls
-- V => vls
-- Vala => vala_ls
-- Veryl => veryl_ls
-- VimL => vimls
-- Visualforce => visualforce_ls
-- Vue => volar
-- Vue => vuels
-- WGSL => wgsl_analyzer
-- XML => lemminx
-- YAML => yamlls
-- Zig => zls
