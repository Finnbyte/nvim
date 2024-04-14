-- Helper functions (available globally by design)
function Map(mode, shortcut, command, desc)
  desc = desc or nil 
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true, desc = desc})
end

function BufMap(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true, buffer = 0 })
end

function Unmap(mode, bind)
	vim.api.nvim_del_keyMap(mode, bind)
end

Map({"n", "v"}, "<C-p>", function ()
  vim.cmd.cd("%:p:h")
  print(string.format("New CWD: %s", vim.fn.getcwd()))
end, "Set CWD to current file")

Map('n', '<F1>', ':set rnu!<CR>') -- toggle relative line numbers
Map("n", "<F2>", ":nohlsearch<CR>") -- Disable highlighted entries
Map('n', '<F3>', ':set wrap!<CR>') -- toggle wrap 

Map("n", "0", "^")
Map("n", "^", "0")

-- Go up/down 1/2 screen without moving cursor
Map({"n", "i", "t", "v"}, "<C-u>", "<C-u>zz")
Map({"n", "i", "t", "v"}, "<C-d>", "<C-d>zz")

-- Switch windows
Map("n", "<C-c>", "<C-w>c")
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
