local function find_root_dir()
    -- Look for Git to determine project root
    return vim.fn.finddir(".git/..", ".;")
end

local function file_exists(path)
    return vim.fn.filereadable(path) == 1
end

local function format_current_file()
    local file = vim.fn.expand("%:p")
    local root = find_root_dir()
    if root == nil or root == "" then return end

    -- Config files to check
    local eslint_config_js = root .. "/.eslintrc.js"
    local eslint_config_json = root .. "/.eslintrc.json"
    local prettier_config = root .. "/.prettierrc"
    local prettier_config_js = root .. "/.prettierrc.js"
    local prettier_config_json = root .. "/.prettierrc.json"

    local function run_sync(cmd)
        local result = vim.fn.system(cmd)
        if vim.v.shell_error ~= 0 then
            vim.notify("Format error:\n" .. result, vim.log.levels.ERROR)
        end
    end

    -- 1. Use ESLint if config is present
    if file_exists(eslint_config_js) or file_exists(eslint_config_json) then
        if vim.fn.executable("eslint") == 1 then
            run_sync({ "eslint", "--fix", file })
            return
        elseif vim.fn.executable("npx") == 1 then
            run_sync({ "npx", "eslint", "--fix", file })
            return
        end
    end

    -- 2. Use prettierd (the fast daemonized Prettier)
    if file_exists(prettier_config) or file_exists(prettier_config_js) or file_exists(prettier_config_json) then
        if vim.fn.executable("prettierd") == 1 then
            run_sync({ "prettierd", file })
            return
        elseif vim.fn.executable("prettier") == 1 then
            run_sync({ "prettier", "--write", file })
            return
        elseif vim.fn.executable("npx") == 1 then
            run_sync({ "npx", "prettier", "--write", file })
            return
        end
    end

    vim.notify("No formatter found for: " .. file, vim.log.levels.INFO)
end

-- Auto-format before save for JS/TS files
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    callback = format_current_file,
})
