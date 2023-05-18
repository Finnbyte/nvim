function Change_bg_color(t)
    vim.cmd(string.format([[ highlight Normal ctermbg=%s guibg=%s ]], t.term or "", t.gui or ""))
end

CheckPowerPlan = function()
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
