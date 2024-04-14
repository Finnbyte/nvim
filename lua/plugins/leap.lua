local M = {
    "ggandor/leap.nvim",
    event = "BufReadPost"
}

function M.config()
    require('leap').create_default_mappings()
end

return M

