local bufmgr = require("buffer_manager.ui")

Map("n", "<leader><space>", function() bufmgr.toggle_quick_menu() end, {})
