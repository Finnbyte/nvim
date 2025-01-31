local M = {
    'saghen/blink.cmp',
    event = "BufReadPre",
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            nerd_font_variant = 'mono'
        },
        signature = { enabled = true },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
    opts_extend = { "sources.default" }
}

-- function M.config()
--     vim.opt.completeopt = { "menu", "menuone", "noselect" }
--
--     local has_words_before = function()
--         unpack = unpack or table.unpack
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--     end
--
--     local luasnip = require("luasnip")
--     local cmp = require("cmp")
--
--     cmp.setup({
--         formatting = {},
--         snippet = {
--             expand = function(args)
--                 require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--             end,
--         },
--         window = {
--             completion = cmp.config.window.bordered(),
--             documentation = cmp.config.window.bordered(),
--         },
--         mapping = cmp.mapping.preset.insert({
--             ["<Tab>"] = cmp.mapping(function(fallback)
--                 if cmp.visible() then
--                     cmp.select_next_item()
--                     -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--                     -- they way you will only jump inside the snippet region
--                 elseif luasnip.expand_or_jumpable() then
--                     luasnip.expand_or_jump()
--                 elseif has_words_before() then
--                     cmp.complete()
--                 else
--                     fallback()
--                 end
--             end, { "i", "s" }),
--             ["<S-Tab>"] = cmp.mapping(function(fallback)
--                 if cmp.visible() then
--                     cmp.select_prev_item()
--                 elseif luasnip.jumpable(-1) then
--                     luasnip.jump(-1)
--                 else
--                     fallback()
--                 end
--             end, { "i", "s" }),
--             ['<C-k>'] = cmp.mapping.scroll_docs(-4),
--             ['<C-j>'] = cmp.mapping.scroll_docs(4),
--             ['<C-Space>'] = cmp.mapping.complete(),
--             ['<C-e>'] = cmp.mapping.abort(),
--             ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         }),
--         sources = cmp.config.sources({
--             { name = 'nvim_lsp' },
--             { name = 'nvim_lua' },
--             { name = 'luasnip' },
--         }, {
--             { name = 'buffer' },
--         })
--     })
--
--     -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--     cmp.setup.cmdline({ '/', '?' }, {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = {
--             { name = 'buffer' }
--         }
--     })
--
--     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--     cmp.setup.cmdline(':', {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = cmp.config.sources({
--             { name = 'path' }
--         }, {
--             { name = 'cmdline' }
--         })
--     })
-- end

return M
