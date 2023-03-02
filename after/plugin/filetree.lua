local fern = function()
    local init_fern = function()
        -- Define NERDTree like keybindings
        vim.cmd([[nmap <buffer> o <Plug>(fern-action-open:edit)]])
        vim.cmd([[nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p]])
        vim.cmd([[nmap <buffer> t <Plug>(fern-action-open:tabedit)]])
        vim.cmd([[nmap <buffer> T <Plug>(fern-action-open:tabedit)gT]])
        vim.cmd([[nmap <buffer> i <Plug>(fern-action-open:split)]])
        vim.cmd([[nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p]])
        vim.cmd([[nmap <buffer> s <Plug>(fern-action-open:vsplit)]])
        vim.cmd([[nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p]])
        vim.cmd([[nmap <buffer> ma <Plug>(fern-action-new-path)]])
        vim.cmd([[nmap <buffer> P gg]])
        vim.cmd([[nmap <buffer> C <Plug>(fern-action-enter)]])
        vim.cmd([[nmap <buffer> u <Plug>(fern-action-leave)]])
        vim.cmd([[nmap <buffer> r <Plug>(fern-action-reload)]])
        vim.cmd([[nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>]])
        vim.cmd([[nmap <buffer> cd <Plug>(fern-action-cd)]])
        vim.cmd([[nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>]])
        vim.cmd([[nmap <buffer> I <Plug>(fern-action-hidden-toggle)]])
        vim.cmd([[nmap <buffer> q :<C-u>quit<CR>]])
    end

    local fern_group = vim.api.nvim_create_augroup("fern-custom", {})
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "fern",
        callback = init_fern,
        group = fern_group
    })

    Map("n", "<leader>.", function() vim.cmd.Fern({ args = { ".", "-drawer" }}) end)

    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Fern({ args = { vim.fn.stdpath("config"), "-drawer" }}) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Fern({ args = { vim.fn.stdpath("data"), "-drawer" }})end, {})
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

    Map("n", "<leader>.", function() extensions.file_browser.file_browser({ dir_icon="DIR", path="%:p:h" }) end, { noremap = true })
    Map("n", "<leader>cf", function() extensions.file_browser.file_browser({ dir_icon="DIR", path=vim.fn.stdpath("config") }) end, { noremap = true })
    Map("n", "<leader>pl", function() extensions.file_browser.file_browser({ dir_icon="DIR", path=string.format("%s/%s", vim.fn.stdpath("data"), "site/pack/packer/start")}) end, { noremap = true })
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
            vim.api.nvim_buf_set_keyMap(
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

    Map("n", "<leader>.", function() vim.cmd.edit(vim.fn.expand("%:p:h")) end)

    vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Ex(vim.fn.stdpath("config")) end, {})
    vim.api.nvim_create_user_command("Data", function() vim.cmd.Ex(vim.fn.stdpath("data")) end, {})

end

fern()
-- lir()
-- telescope_file_browser()
