require("mini.starter").setup()

map({"n", "i"}, "<c-h>", vim.cmd.bprev)
map({"n", "i"}, "<c-l>", vim.cmd.bnext)
require("mini.tabline").setup({
    show_icons = false
})

require("mini.indentscope").setup()

require("mini.statusline").setup({
    use_icons = false
})
