local Players = game:GetService("Players")
repeat wait() until game:IsLoaded() and Players.LocalPlayer
localName = Players.LocalPlayer.Name

for _, name in ipairs(settings["HelperNameList"]) do
    if name == localName then
        allowed = true
        break
    end
end

if not allowed then
    for _, name in ipairs(settings["V4FarmList"]) do
        if name == localName then
            allowed = true
            break
        end
    end
end

if allowed then
    _G.Settings_V4 = settings
    print("Found")
else
    print("Not Found")
    return
end


function HasMain()
    local gui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if gui and gui:FindFirstChild("Main (minimal)") then
        print("Found")
        --return true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MasterPClient/main/Loader.lua"))()
    end
    print("Not Found")
end


while true do
    task.spawn(function()
        local success, err = pcall(function()
            HasMain()
        end)
        if not success then
            warn("Error in HasMain:", err)
        end
    end)
    task.wait(21)
end
