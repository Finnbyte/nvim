require("mini.starter").setup()

require("mini.tabline").setup({
    show_icons = false
})

require("mini.indentscope").setup()

require("mini.statusline").setup({
    use_icons = false
})

require("mini.jump2d").setup()
map({"n", "v"}, "<CR>", '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>', {})

require("mini.pairs").setup({
    -- Modes where enabled
    modes = { insert = true, command = true, terminal = true },

    mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
})

require("mini.surround").setup()
