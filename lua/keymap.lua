-- Helper functions (available globally by design)
function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function unmap(mode, bind)
	vim.api.nvim_del_keymap(mode, bind)
end

-- Set <leader> key
vim.g.mapleader = ' ' -- Map leader key to space

map('n', '<C-n>', ':set rnu!<CR>') -- toggle relative line numbers

map("n", "0", "^")
map("n", "^", "0")

-- Browse buffers
map({"n", "i"}, "<c-h>", vim.cmd.bprev)
map({"n", "i"}, "<C-M-d>", vim.cmd.bdelete)
map({"n", "i"}, "<c-l>", vim.cmd.bnext)

-- Switch windows
-- map("n", "<C-c>", "<C-w>c")
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

-- Disable highlighted entries
map("n", "<F2>", ":nohlsearch<CR>")
