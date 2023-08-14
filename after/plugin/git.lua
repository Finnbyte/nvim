-- Git signs
require('gitsigns').setup()

local neogit = require('neogit')
neogit.setup {}

Map("n", "<leader>gg", vim.cmd.Neogit)
