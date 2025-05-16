repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local Players = game:GetService("Players")
local localName = Players.LocalPlayer.Name

-- Merge Username To Easy to Find
local allowedNames = {}

-- รวม HelperNameList
for _, name in ipairs(_G.Settings_V4["HelperNameList"]) do
    allowedNames[name] = true
end

-- รวม V4FarmList
for _, name in ipairs(_G.Settings_V4["V4FarmList"]) do
    allowedNames[name] = true
end

if not allowedNames[localName] then
    --print("Nt Found Username")
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


    
