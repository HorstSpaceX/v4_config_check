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
    if gui and gui:FindFirstChild("Main") then
        print("Found")
        return true
    end
    print("Not Found")
    return false
end

while true do
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MasterPClient/main/Loader.lua"))()
    
    local success, result = pcall(HasMain) -- <- ใส่ชื่อ function แบบนี้ (ไม่ใส่วงเล็บ)
    
    if success and result then
        break
    end
    
    wait(5)
end

    
