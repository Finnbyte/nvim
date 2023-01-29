-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
-- 	  pattern = {"*.c", "*.h"},
-- 	  command = "echo 'Entering a C or C++ file'",
-- })

-- -- Make window transparent on launch
-- vim.api.nvim_create_autocmd({"VimEnter"}, {
-- 	command = "TransparentEnable",
-- })

-- Disable annoying commentting
vim.api.nvim_create_autocmd({"BufEnter"}, {
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
	-- pattern = { vim.fn.stdpath("config") .. "/lua/plug.lua" },
	pattern = { "*/nvim/lua/plug.lua" },
	callback = function()
        vim.cmd([[so %]])
        vim.cmd([[PackerCompile]])
        vim.cmd([[PackerClean]])
        vim.cmd([[PackerInstall]])
    end
})

-- set background color on Vim launch 
-- local bgcmd = "hi normal guibg=#0a0a0a"
-- vim.api.nvim_create_autocmd({"VimEnter"}, {
--     pattern = {"*"},
-- 	command = bgcmd,
-- })


