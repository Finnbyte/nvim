vim.keymap.set('n', '<F1>', ':set rnu!<CR>')  -- toggle relative line numbers
vim.keymap.set('n', '<F3>', ':set wrap!<CR>') -- toggle wrap

vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

-- Go up/down 1/2 screen without moving cursor
vim.keymap.set({ "n", "i", "t", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "i", "t", "v" }, "<C-d>", "<C-d>zz")

-- Switch windows
vim.keymap.set("n", "<C-c>", "<C-w>c")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
