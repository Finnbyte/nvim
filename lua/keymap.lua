-- Helper functions (available globally by design)
function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function unmap(mode, bind)
	vim.api.nvim_del_keymap(mode, bind)
end

-- Set <leader> key
vim.g.mapleader = ' ' -- Map leader key to space

map('n', '<F1>', ':set rnu!<CR>') -- toggle relative line numbers
map("n", "<F2>", ":nohlsearch<CR>") -- Disable highlighted entries
map('n', '<F3>', ':set wrap!<CR>') -- toggle wrap 

map("n", "0", "^")
map("n", "^", "0")

-- Browse buffers
map({"n", "i"}, "<C-h>", vim.cmd.bprev)
map({"n", "i"}, "<M-d>", vim.cmd.bdelete)
map({"n", "i"}, "<C-l>", vim.cmd.bnext)

-- Switch windows
-- map("n", "<C-c>", "<C-w>c")
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
