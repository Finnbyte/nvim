-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
-- 	  pattern = {"*.c", "*.h"},
-- 	  command = "echo 'Entering a C or C++ file'",
-- })

-- -- Make window transparent on launch
-- vim.api.nvim_create_autocmd({"VimEnter"}, {
-- 	command = "TransparentEnable",
-- })

-- Disable annoying commentting
local annoying_comments_group = vim.api.nvim_create_augroup("Comments")
vim.api.nvim_create_autocmd({"BufEnter"}, {
	command = "set formatoptions-=cro",
    group = annoying_comments_group
})

-- Automatically add or remove new plugins when saving packer file
local packer_group = vim.api.nvim_create_augroup("Packer")
vim.api.nvim_create_autocmd({"BufWritePost"}, {
	-- pattern = { vim.fn.stdpath("config") .. "/lua/plug.lua" },
	pattern = { "*/nvim/lua/plug.lua" },
    group = packer_group,
	callback = function()
        vim.cmd([[so %]])
        vim.cmd([[PackerCompile]])
        vim.cmd([[PackerClean]])
        vim.cmd([[PackerInstall]])
    end
})

-- Fix errors when saving a javascript/typescript file
local eslint_fix_group = vim.api.nvim_create_augroup("Eslint")
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = { "*.ts", "*.js" },
    group = eslint_fix_group,
    callback = function()
        vim.cmd([[EslintFixAll]])
    end
})
