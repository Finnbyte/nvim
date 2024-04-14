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

function ChangeBgColor(t)
    vim.cmd(string.format([[ highlight Normal ctermbg=%s guibg=%s ]], t.term or "", t.gui or ""))
end

function CheckPowerPlan()
    -- Check if has Windows
    if vim.fn.has("win64") == 0 then
        return
    end

    local output = vim.fn.system("powercfg.exe /getactivescheme")
    local powerPlanName = output:match("%((.-)%)") -- Use regex to get name from parenthesis

    if powerPlanName:lower() ~= "high performance" then
        print(string.format("WARNING: Your computer uses '%s' instead of High performance powerplan.\nConsider using 'High performance' for maximum performance and enjoyment.\n", powerPlanName))
    end
end
