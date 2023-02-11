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

require("mini.jump2d").setup()
map("n", "<CR>", '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>', {})
