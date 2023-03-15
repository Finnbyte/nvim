-- Disable annoying commentting
local annoying_comments_group = vim.api.nvim_create_augroup("Comments", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {
	command = "set formatoptions-=cro",
    group = annoying_comments_group
})

-- Automatically add or remove new plugins when saving packer file
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "**/nvim/lua/plug.lua",
    group = packer_group,
	callback = function()
        vim.cmd.source("%")
        vim.cmd.PackerCompile()
        vim.cmd.PackerClean()
        vim.cmd.PackerInstall()
    end
})

-- Fix errors when saving a javascript/typescript file
local eslint_fix_group = vim.api.nvim_create_augroup("Eslint", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
    group = eslint_fix_group,
    callback = function()
        vim.cmd.EslintFixAll()
        vim.cmd.write() -- Save changes again after fixed errors
    end
})
