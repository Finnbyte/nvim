-- Disable annoying commentting
local annoying_comments_group = vim.api.nvim_create_augroup("Comments", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {
	command = "set formatoptions-=cro",
    group = annoying_comments_group
})

-- Fix errors when saving a javascript/typescript file
local eslint_fix_group = vim.api.nvim_create_augroup("Eslint", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
    group = eslint_fix_group,
    callback = function()
		local ok, _ = pcall(vim.cmd.EslintFixAll)
		if ok then
			vim.cmd.write() -- Save changes again after fixed errors
		end
    end
})
