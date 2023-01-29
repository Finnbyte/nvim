-- Helper functions
function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function unmap(mode, bind)
	vim.api.nvim_del_keymap(mode, bind)
end

-- Set <leader> key
vim.g.mapleader = ' ' -- Map leader key to space

-- Actual mappings
map('n', '<C-n>', ':set rnu!<CR>') -- toggle relative line numbers

map("n", "0", "^")
map("n", "^", "0")

-- Browse dotfiles (cross-platform)
-- map("n", "<leader>cf", ":exe ':Ex ' . stdpath('config')<CR>")
-- map("n", "<leader>cf", vim.cmd.NeoTreeShowToggle(vim.fn.stdpath('config')))

-- Switch windows
map("n", "<C-c>", "<C-w>c")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Open file manager in Vim
-- map("n", "<leader>.", ":Ex<CR>")

-- Disable highlighted entries
map("n", "<F2>", ":nohlsearch<CR>")

map("n", "<leader>r", ":w <Bar> :so %<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<Leader><Leader>", ":b#<CR>")
map("n", "<Leader>b", ":BufExplorer<CR>")
map("n", "<leader>m", ":NERDTreeToggle<CR>")
map("n", "<leader>rt", ":!ctags -R .<CR><CR>")
