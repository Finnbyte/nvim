require("mini.starter").setup()


require("mini.tabline").setup({
    show_icons = false
})


require("mini.indentscope").setup()


require("mini.statusline").setup({
    use_icons = false
})


require("mini.move").setup()


require("mini.jump").setup()


require("mini.jump2d").setup()
Map({"n", "v"}, "<CR>", '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>')


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


require('mini.comment').setup({
    options = {
        -- Whether to ignore blank lines when adding comment
        ignore_blank_line = false,

        -- Whether to recognize as comment only lines without indent
        start_of_line = false,
    },
    mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = 'gc',

        -- Toggle comment on current line
        comment_line = 'gcc',

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = 'gc',
    },
    hooks = {
        -- Before successful commenting. Does nothing by default.
        pre = function() end,
        -- After successful commenting. Does nothing by default.
        post = function() end,
    },
})
