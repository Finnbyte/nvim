require("luasnip.loaders.from_vscode").lazy_load() -- VSCode-like snippets
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

-- Custom snippets
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("lua", {
    s("use", {
        t({"use { \""}), i(1), t({"\" }"})

})})
