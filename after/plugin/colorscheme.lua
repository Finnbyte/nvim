local tokyonight = function()
    require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "transparent", -- style for sidebars, see below
            floats = "normal", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true, -- dims inactive windows

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors) end,
    })

    vim.cmd.colorscheme("tokyonight")
end

local gruvbox = function()
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            comments = true,
            operators = false,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    })

    vim.cmd("colorscheme gruvbox")
end

local onenord = function()
require('onenord').setup({
    borders = true, -- Split window borders
    fade_nc = false, -- Fade non-current windows, making them more distinguishable
    -- Style that is applied to various groups: see `highlight-args` for options
    styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "underline",
    },
    disable = {
        background = false, -- Disable setting the background color
        cursorline = false, -- Disable the cursorline
        eob_lines = true, -- Hide the end-of-buffer lines
    },
    -- Inverse highlight for different groups
    inverse = {
        match_paren = false,
    },
    custom_highlights = {}, -- Overwrite default highlight groups
    custom_colors = {}, -- Overwrite default colors
})
end

gruvbox()

