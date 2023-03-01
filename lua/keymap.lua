-- Helper functions (available globally by design)
function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function unmap(mode, bind)
	vim.api.nvim_del_keymap(mode, bind)
end

vim.g.mapleader = ' ' -- Map leader key to space
-- Set <leader> key

map('n', '<F1>', ':set rnu!<CR>') -- toggle relative line numbers
map("n", "<F2>", ":nohlsearch<CR>") -- Disable highlighted entries
map('n', '<F3>', ':set wrap!<CR>') -- toggle wrap 

map("n", "0", "^")
map("n", "^", "0")

-- Browse buffers
map({"n", "i", "t"}, "<C-h>", vim.cmd.bprev)
map({"n", "i", "t"}, "<C-l>", vim.cmd.bnext)
map({"n", "i", "t"}, "<M-d>", vim.cmd.bdelete)

-- Resize splits
-- map({"n", "i", "t"}, "<C-Right>", vim.cmd([[resize +10]]))
-- map({"n", "i", "t"}, "<C-Left", vim.cmd([[resize -10]]))
-- map({"n", "i", "t"}, "<C-Up", vim.cmd([[vertical resize +10]]))
-- map({"n", "i", "t"}, "<C-Down>", vim.cmd([[vertical resize -10]]))

-- Go up/down 1/2 screen without moving cursor
map({"n", "i", "t", "v"}, "<C-u>", "<C-u>zz")
map({"n", "i", "t", "v"}, "<C-d>", "<C-d>zz")

-- Switch windows
-- map("n", "<C-c>", "<C-w>c")
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
