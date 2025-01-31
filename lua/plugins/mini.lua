local M = {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
}

function M.config()
    require("mini.starter").setup()
    require("mini.tabline").setup({
        show_icons = false
    })
    require("mini.ai").setup()
    require("mini.misc").setup()
    require("mini.indentscope").setup()
    require("mini.statusline").setup({
        use_icons = false
    })
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
        highlighters = {
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
    require("mini.move").setup()
    require("mini.jump").setup()
    require("mini.pairs").setup({
        -- Modes where enabled
        modes = { insert = true, command = false, terminal = false },

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
    require("mini.surround").setup({
        mappings = {
            add = 'ys',             -- Add surrounding in Normal and Visual modes
            delete = 'ds',          -- Delete surrounding
            replace = 'cs',         -- Replace surrounding
            find = 'ysf',           -- Find surrounding (to the right)
            find_left = 'ysF',      -- Find surrounding (to the left)
            highlight = 'ysh',      -- Highlight surrounding
            update_n_lines = 'ysn', -- Update `n_lines`

            suffix_last = 'l',      -- Suffix to search with "prev" method
            suffix_next = 'n',      -- Suffix to search with "next" method
        }
    })
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
    require("mini.git").setup()

    -- Flashy plugins
    require("mini.icons").setup()
end

return M
