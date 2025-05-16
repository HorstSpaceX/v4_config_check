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
    pcall(function()
        HasMain()
    end)
    task.wait(5)
end

    
