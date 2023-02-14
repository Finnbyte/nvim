local nerdtree = function()
    map("n", "<leader>.", vim.cmd.NERDTree)
    map("n", "<leader>cf", function() vim.cmd.NERDTree(vim.fn.stdpath("config")) end)
    map("n", "<leader>pl", function() vim.cmd.NERDTree(vim.fn.stdpath("data")) end)
end

local netrw = function()
    map("n", "<leader>.", vim.cmd.Ex)
    map("n", "<leader>cf", function() vim.cmd.Ex(vim.fn.stdpath("config")) end)
    map("n", "<leader>pl", function() vim.cmd.Ex(vim.fn.stdpath("data")) end)
end

local neotree = function()
    require("neo-tree").setup {
        -- If a user has a sources list it will replace this one.
        -- Only sources listed here will be loaded.
        -- You can also add an external source by adding it's name to this list.
        -- The name used here must be the same name you would use in a require() call.
        sources = {
            "filesystem",
            "buffers",
            "git_status",
        },
        add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        -- popup_border_style is for input and confirmation dialogs.
        -- Configurtaion of floating window is done in the individual source sections.
        -- "NC" is a special style that works well with NormalNC set
        close_floats_on_escape_key = true,
        default_source = "filesystem",
        enable_diagnostics = false,
        enable_git_status = false,
        enable_modified_markers = true, -- Show markers for files with unsaved changes.
        enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
        git_status_async = false,
        -- These options are for people with VERY large git repos
        git_status_async_options = {
            batch_size = 1000, -- how many lines of git status results to process at a time
            batch_delay = 10,  -- delay in ms between batches. Spreads out the workload to let other processes run.
            max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
            -- Anything before this will be used. The last items to be processed are the untracked files.
        },
        hide_root_node = false, -- Hide the root node.
        retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow. 
        -- This is needed if you use expanders because they render in the indent.
        log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
        log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
        open_files_in_last_window = true, -- false = open files in top left window
        popup_border_style = "NC", -- "double", "none", "rounded", "shadow", "single" or "solid"
        resize_timer_interval = 500, -- in ms, needed for containers to redraw right aligned and faded content
        -- set to -1 to disable the resize timer entirely
        --                           -- NOTE: this will speed up to 50 ms for 1 second following a resize
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil , -- uses a custom function for sorting files and directories in the tree
        use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
        use_default_mappings = true,
        -- source_selector provides clickable tabs to switch between sources.
        source_selector = {
            winbar = false, -- toggle to show selector on winbar
            statusline = false, -- toggle to show selector on statusline
            show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
            -- of the top visible node when scrolled down.
            tab_labels = { -- falls back to source_name if nil
            filesystem = "  Files ",
            buffers =    "  Buffers ",
            git_status = "  Git ",
            diagnostics = " 裂Diagnostics ",
        },
        content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
        --                start  : |/ 裡 bufname     \/...
        --                end    : |/     裡 bufname \/...
        --                center : |/   裡 bufname   \/...
        tabs_layout = "equal", -- start, end, center, equal, focus
        --             start  : |/  a  \/  b  \/  c  \            |
        --             end    : |            /  a  \/  b  \/  c  \|
        --             center : |      /  a  \/  b  \/  c  \      |
        --             equal  : |/    a    \/    b    \/    c    \|
        --             active : |/  focused tab    \/  b  \/  c  \|
        truncation_character = "…", -- character to use when truncating the tab label
        tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
        tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
        padding = 0, -- can be int or table
        -- padding = { left = 2, right = 0 },
        -- separator = "▕", -- can be string or table, see below
        separator = { left = "▏", right= "▕" },
        -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
        -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
        -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
        -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
        -- separator = "|",                                              -- ||  a  |  b  |  c  |...
        separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
        show_separator_on_edge = false,
        --                       true  : |/    a    \/    b    \/    c    \|
        --                       false : |     a    \/    b    \/    c     |
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
    },
    default_component_configs = {
        container = {
            enable_character_fade = true,
            width = "100%",
            right_padding = 0,
        },

        diagnostics = {
            symbols = {
                hint = "H",
                info = "I",
                warn = "!",
                error = "X",
            },
            highlights = {
                hint = "DiagnosticSignHint",
                info = "DiagnosticSignInfo",
                warn = "DiagnosticSignWarn",
                error = "DiagnosticSignError",
            },
        },
        indent = {
            indent_size = 2,
            padding = 1,
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "[+] ",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "✚", -- NOTE: you can set any of these to an empty string to not show them
                deleted   = "✖",
                modified  = "",
                renamed   = "",
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            },
            align = "right",
        },
    },
    renderers = {
        directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            {
                "container",
                content = {
                    { "name", zindex = 10 },
                    -- {
                        --   "symlink_target",
                        --   zindex = 10,
                        --   highlight = "NeoTreeSymbolicLinkTarget",
                        -- },
                        { "clipboard", zindex = 10 },
                        { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                        { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
                    },
                },
            },
            file = {
                {
                    "container",
                    content = {
                        {
                            "name",
                            zindex = 10
                        },
                        -- {
                            --   "symlink_target",
                            --   zindex = 10,
                            --   highlight = "NeoTreeSymbolicLinkTarget",
                            -- },
                            { "clipboard", zindex = 10 },
                            { "bufnr", zindex = 10 },
                            { "modified", zindex = 20, align = "right" },
                            { "diagnostics",  zindex = 20, align = "right" },
                            { "git_status", zindex = 20, align = "right" },
                        },
                    },
                },
                message = {
                    { "indent", with_markers = false },
                    { "name", highlight = "NeoTreeMessage" },
                },
                terminal = {
                    { "indent" },
                    { "icon" },
                    { "name" },
                    { "bufnr" }
                }
            },
            nesting_rules = {},
            window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
            -- possible options. These can also be functions that return these options.
            position = "left", -- left, right, top, bottom, float, current
            width = 40, -- applies to left and right positions
            height = 15, -- applies to top and bottom positions
            auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
            popup = { -- settings that apply to float position only
            size = {
                height = "80%",
                width = "50%",
            },
            position = "50%", -- 50% means center it
            -- you can also specify border here, if you want a different setting from
            -- the global popup_border_style.
        },
        same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
        insert_as = "child", -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
        -- "child":   Insert nodes as children of the directory under cursor.
        -- "sibling": Insert nodes  as siblings of the directory under cursor.
        -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
        -- You can also create your own commands by providing a function instead of a string.
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            -- ["S"] = "split_with_window_picker",
            ["s"] = "open_vsplit",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["R"] = "refresh",
            ["a"] = {
                "add",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "none", -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
            ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
            ["e"] = "toggle_auto_expand_width",
            ["q"] = "close_window",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        },
    },
    filesystem = {
        window = {
            mappings = {
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                --["/"] = "filter_as_you_type", -- this was the default until v1.28
                ["f"] = "filter_on_submit",
                ["<C-x>"] = "clear_filter",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
            }
        },
        async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
        -- "always" means directory scans are always async.
        -- "never"  means directory scans are never async.
        scan_mode = "shallow", -- "shallow": Don't scan into directories to detect possible empty directory a priori
        -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
        bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        cwd_target = {
            sidebar = "tab",   -- sidebar is when position = left or right
            current = "window" -- current is when position = current
        },
        -- The renderer section provides the renderers that will be used to render the tree.
        --   The first level is the node type.
        --   For each node type, you can specify a list of components to render.
        --       Components are rendered in the order they are specified.
        --         The first field in each component is the name of the function to call.
        --         The rest of the fields are passed to the function as the "config" argument.
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
            show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
                ".DS_Store",
                "thumbs.db"
                --"node_modules",
            },
            hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json"
        },
        always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
    },
    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
    --".DS_Store",
    --"thumbs.db"
},
never_show_by_pattern = { -- uses glob style patterns
--".null-ls_*",
        },
    },
    find_by_full_path_words = false,  -- `false` means it only searches the tail of a path.
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    search_limit = 50, -- max number of search results when using filters
    follow_current_file = false, -- This will find and focus the file in the active buffer every time
    -- the current file is changed while the tree is open.
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",-- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
},
buffers = {
    bind_to_cwd = true,
    follow_current_file = true, -- This will find and focus the file in the active buffer every time
    -- the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty directories will be grouped together
    window = {
        mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["bd"] = "buffer_delete",
        },
    },
},
git_status = {
    window = {
        mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
        },
    },
},
example = {
    renderers = {
        custom = {
            {"indent"},
            {"icon", default="C" },
            {"custom"},
            {"name"}
        }
    },
    window = {
        mappings = {
            ["<cr>"] = "toggle_node",
            ["<C-e>"] = "example_command",
            ["d"] = "show_debug_info",
        },
    },
},
    }

    vim.keymap.set("n", "<leader>cf", function() vim.cmd.Neotree(vim.fn.stdpath('config')) end)
    vim.keymap.set("n", "<leader>.", function() vim.cmd.Neotree("%:p:h") end)
end

local telescope_file_browser = function()
    require("telescope").setup {
        defaults = {
            disable_devicons = true,
            multi_icon = " ",
            color_devicons = false,
        },
        extensions = {
            file_browser = {
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
            }
        }
    }

    -- Handle extensions
    local extensions  = require("telescope").extensions

    require("telescope").load_extension "file_browser"

    map("n", "<leader>.", function() extensions.file_browser.file_browser({ dir_icon="DIR", path="%:p:h" }) end, { noremap = true })
    map("n", "<leader>cf", function() extensions.file_browser.file_browser({ dir_icon="DIR", path=vim.fn.stdpath("config") }) end, { noremap = true })
    map("n", "<leader>pl", function() extensions.file_browser.file_browser({ dir_icon="DIR", path=string.format("%s/%s", vim.fn.stdpath("data"), "site/pack/packer/start")}) end, { noremap = true })
end

local nvim_tree = function()
    require("nvim-tree").setup {
        auto_reload_on_write = true,
        disable_netrw = true,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        sort_by = "name",
        root_dirs = {},
        prefer_startup_root = false,
        sync_root_with_cwd = false,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        on_attach = "disable",
        remove_keymaps = false,
        select_prompts = false,
        view = {
            centralize_selection = false,
            cursorline = true,
            debounce_delay = 15,
            width = 30,
            hide_root_folder = false,
            side = "left",
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
                custom_only = false,
                list = {
                    -- user mappings go here
                },
            },
            float = {
                enable = false,
                quit_on_focus_loss = true,
                open_win_config = {
                    relative = "editor",
                    border = "rounded",
                    width = 30,
                    height = 30,
                    row = 1,
                    col = 1,
                },
            },
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            full_name = false,
            highlight_opened_files = "none",
            highlight_modified = "none",
            root_folder_label = ":~:s?$?/..?",
            indent_width = 2,
            indent_markers = {
                enable = false,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                webdev_colors = false,
                git_placement = "before",
                modified_placement = "after",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = false,
                    modified = false,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    bookmark = "",
                    modified = "●",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
            symlink_destination = true,
        },
        hijack_directories = {
            enable = true,
            auto_open = true,
        },
        update_focused_file = {
            enable = false,
            update_root = false,
            ignore_list = {},
        },
        ignore_ft_on_setup = {},
        system_open = {
            cmd = "",
            args = {},
        },
        diagnostics = {
            enable = false,
            show_on_dirs = false,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        filters = {
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = {},
            exclude = {},
        },
        filesystem_watchers = {
            enable = true,
            debounce_delay = 50,
            ignore_dirs = {},
        },
        git = {
            enable = true,
            ignore = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
            timeout = 400,
        },
        modified = {
            enable = false,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false,
            },
            expand_all = {
                max_folder_discovery = 300,
                exclude = {},
            },
            file_popup = {
                open_win_config = {
                    col = 1,
                    row = 1,
                    relative = "cursor",
                    border = "shadow",
                    style = "minimal",
                },
            },
            open_file = {
                quit_on_open = false,
                resize_window = true,
                window_picker = {
                    enable = true,
                    picker = "default",
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
            remove_file = {
                close_window = true,
            },
        },
        trash = {
            cmd = "gio trash",
        },
        live_filter = {
            prefix = "[FILTER]: ",
            always_show_folders = true,
        },
        tab = {
            sync = {
                open = false,
                close = false,
                ignore = {},
            },
        },
        notify = {
            threshold = vim.log.levels.INFO,
        },
        ui = {
            confirm = {
                remove = true,
                trash = true,
            },
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                dev = false,
                diagnostics = false,
                git = false,
                profile = false,
                watcher = false,
            },
        },
    }

    map("n", "<leader>.", function() vim.cmd.NvimTreeOpen() end)
    map("n", "<leader>cf", function() vim.cmd.NvimTreeOpen(vim.fn.stdpath("config")) end)
    map("n", "<leader>pl", function() vim.cmd.NvimTreeOpen(vim.fn.stdpath("data")) end)

end

local lir = function()
    local actions = require'lir.actions'
    local mark_actions = require 'lir.mark.actions'
    local clipboard_actions = require'lir.clipboard.actions'

    require'lir'.setup {
        show_hidden_files = true,
        ignore = {"node_modules", ".git"}, -- { ".DS_Store", "node_modules" } etc.
        devicons = {
            enable = false,
            highlight_dirname = false
        },
        mappings = {
            ['l']     = actions.edit,
            ['<C-s>'] = actions.split,
            ['<C-v>'] = actions.vsplit,
            ['<C-t>'] = actions.tabedit,

            ['h']     = actions.up,
            ['q']     = actions.quit,

            ['K']     = actions.mkdir,
            ['N']     = actions.newfile,
            ['R']     = actions.rename,
            ['cd']    = actions.cd,
            ['Y']     = actions.yank_path,
            ['.']     = actions.toggle_show_hidden,
            ['D']     = actions.delete,

            ['J'] = function()
                mark_actions.toggle_mark()
                vim.cmd('normal! j')
            end,
            ['C'] = clipboard_actions.copy,
            ['X'] = clipboard_actions.cut,
            ['P'] = clipboard_actions.paste,
        },
        float = {
            winblend = 0,
            curdir_window = {
                enable = false,
                highlight_dirname = false
            },

        },
        hide_cursor = true
    }

    vim.api.nvim_create_autocmd({'FileType'}, {
        pattern = {"lir"},
        callback = function()
            -- use visual mode
            vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
            )

            -- echo cwd
            vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
        end
    })

    map("n", "<leader>.", function() vim.cmd.edit(vim.fn.expand("%:p:h")) end)
    map("n", "<leader>cf", function() vim.cmd.edit(vim.fn.stdpath("config")) end)
    map("n", "<leader>pl", function() vim.cmd.edit(vim.fn.stdpath("data")) end)

end

local drex = function()
    require('drex.config').configure {
        icons = {
            file_default = ">",
            dir_open = "DIR",
        },
        colored_icons = false,
        hide_cursor = true,
        hijack_netrw = false,
        sorting = function(a, b)
            local aname, atype = a[1], a[2]
            local bname, btype = b[1], b[2]

            local aisdir = atype == 'directory'
            local bisdir = btype == 'directory'

            if aisdir ~= bisdir then
                return aisdir
            end

            return aname < bname
        end,
        drawer = {
            default_width = 30,
            window_picker = {
                enabled = true,
                labels = 'abcdefghijklmnopqrstuvwxyz',
            },
        },
        disable_default_keybindings = true,
        keybindings = {
            ['n'] = {
                ['v'] = 'V',
                ['l'] = { '<cmd>lua require("drex.elements").expand_element()<CR>', { desc = 'expand element' }},
                ['h'] = { '<cmd>lua require("drex.elements").collapse_directory()<CR>', { desc = 'collapse directory' }},
                ['<2-LeftMouse>'] = { '<LeftMouse><cmd>lua require("drex.elements").expand_element()<CR>', { desc = 'expand element' }},
                ['<RightMouse>']  = { '<LeftMouse><cmd>lua require("drex.elements").collapse_directory()<CR>', { desc = 'collapse directory' }},
                ['<C-v>'] = { '<cmd>lua require("drex.elements").open_file("vs")<CR>', { desc = 'open file in vsplit' }},
                ['<C-x>'] = { '<cmd>lua require("drex.elements").open_file("sp")<CR>', { desc = 'open file in split' }},
                ['<C-t>'] = { '<cmd>lua require("drex.elements").open_file("tabnew", true)<CR>', { desc = 'open file in new tab' }},
                ['<F5>'] = { '<cmd>lua require("drex").reload_directory()<CR>', { desc = 'reload' }},
                ['gj'] = { '<cmd>lua require("drex.actions.jump").jump_to_next_sibling()<CR>', { desc = 'jump to next sibling' }},
                ['gk'] = { '<cmd>lua require("drex.actions.jump").jump_to_prev_sibling()<CR>', { desc = 'jump to prev sibling' }},
                ['gh'] = { '<cmd>lua require("drex.actions.jump").jump_to_parent()<CR>', { desc = 'jump to parent element' }},
                ['s'] = { '<cmd>lua require("drex.actions.stats").stats()<CR>', { desc = 'show element stats' }},
                ['a'] = { '<cmd>lua require("drex.actions.files").create()<CR>', { desc = 'create element' }},
                ['d'] = { '<cmd>lua require("drex.actions.files").delete("line")<CR>', { desc = 'delete element' }},
                ['D'] = { '<cmd>lua require("drex.actions.files").delete("clipboard")<CR>', { desc = 'delete (clipboard)' }},
                ['p'] = { '<cmd>lua require("drex.actions.files").copy_and_paste()<CR>', { desc = 'copy & paste (clipboard)' }},
                ['P'] = { '<cmd>lua require("drex.actions.files").cut_and_move()<CR>', { desc = 'cut & move (clipboard)' }},
                ['r'] = { '<cmd>lua require("drex.actions.files").rename()<CR>', { desc = 'rename element' }},
                ['R'] = { '<cmd>lua require("drex.actions.files").multi_rename("clipboard")<CR>', { desc = 'rename (clipboard)' }},
                ['/'] = { '<cmd>keepalt lua require("drex.actions.search").search()<CR>', { desc = 'search' }},
                ['M'] = { '<cmd>DrexMark<CR>', { desc = 'mark element' }},
                ['u'] = { '<cmd>DrexUnmark<CR>', { desc = 'unmark element' }},
                ['m'] = { '<cmd>DrexToggle<CR>', { desc = 'toggle element' }},
                ['cc'] = { '<cmd>lua require("drex.clipboard").clear_clipboard()<CR>', { desc = 'clear clipboard' }},
                ['cs'] = { '<cmd>lua require("drex.clipboard").open_clipboard_window()<CR>', { desc = 'edit clipboard' }},
                ['y'] = { '<cmd>lua require("drex.actions.text").copy_name()<CR>', { desc = 'copy element name' }},
                ['Y'] = { '<cmd>lua require("drex.actions.text").copy_relative_path()<CR>', { desc = 'copy element relative path' }},
                ['<C-y>'] = { '<cmd>lua require("drex.actions.text").copy_absolute_path()<CR>', { desc = 'copy element absolute path' }},
            },
            ['v'] = {
                ['d'] = { ':lua require("drex.actions.files").delete("visual")<CR>', { desc = 'delete elements' }},
                ['r'] = { ':lua require("drex.actions.files").multi_rename("visual")<CR>', { desc = 'rename elements' }},
                ['M'] = { ':DrexMark<CR>', { desc = 'mark elements' }},
                ['u'] = { ':DrexUnmark<CR>', { desc = 'unmark elements' }},
                ['m'] = { ':DrexToggle<CR>', { desc = 'toggle elements' }},
                ['y'] = { ':lua require("drex.actions.text").copy_name(true)<CR>', { desc = 'copy element names' }},
                ['Y'] = { ':lua require("drex.actions.text").copy_relative_path(true)<CR>', { desc = 'copy element relative paths' }},
                ['<C-y>'] = { ':lua require("drex.actions.text").copy_absolute_path(true)<CR>', { desc = 'copy element absolute paths' }},
            }
        },
        on_enter = nil,
        on_leave = nil,
    }

    map("n", "<leader>.", vim.cmd.DrexDrawerToggle)
    map("n", "<leader>cf", function() vim.cmd.DrexDrawerToggle(vim.fn.stdpath("config")) end)
    map("n", "<leader>pl", function() vim.cmd.DrexDrawerToDrexDrawerToggle(vim.fn.stdpath("data")) end)
end

-- neotree()
-- drex()
lir()
-- nerdtree()
-- nvim_tree()
-- telescope_file_browser()
-- neotree()
