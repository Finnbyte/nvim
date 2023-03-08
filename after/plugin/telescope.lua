local actions = require('telescope.actions')
require("telescope").setup {
    defaults = {
        disable_devicons = true,
        multi_icon = " ",
        color_devicons = false,
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                }
            }
        }
    },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        }
    }
}

local action_state = require('telescope.actions.state')

-- Handle builtins
local builtin = require('telescope.builtin')
Map("n", "<leader>f.", builtin.find_files)
Map("n", "<leader><space>", builtin.buffers)
Map("n", "<leader>f,", builtin.git_files)
Map("n", "<leader>fr", builtin.oldfiles)
Map("n", "<leader>fg", function() builtin.live_grep() end)
Map("n", "<leader>/", function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p")}}) end)
Map("n", "<leader>h", builtin.help_tags)
Map("n", "<C-P>", builtin.commands)

-- Buffers
local del_buf = function(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    vim.api.nvim_buf_delete(selection.bufnr, { force = true })
end

