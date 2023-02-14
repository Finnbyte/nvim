-- Mappings
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

local luasnip = require("luasnip")

map("i", "<Tab>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        return "<Tab>"
    end
end, { silent = true, expr = true, replace_keycodes = true })

map("i", "<S-Tab>", function()
    luasnip.jump(-1)
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load() -- VSCode-like snippets
