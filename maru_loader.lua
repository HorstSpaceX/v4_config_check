local settingsKeyName = _G.SettingsName or "Settings_V4"
local settings = _G[settingsKeyName]

if not settings then
    warn("Settings not found with name:", settingsKeyName)
    return
end

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local Players = game:GetService("Players")
local localName = Players.LocalPlayer.Name
local allowedNames = {}

for _, name in ipairs(settings["HelperNameList"]) do
    allowedNames[name] = true
end

for _, name in ipairs(settings["V4FarmList"]) do
    allowedNames[name] = true
end

-- ✅ ถ้าชื่อผู้เล่นอยู่ในรายการ allowedNames ให้เซ็ตกลับเป็น _G.Settings_V4
if allowedNames[localName] then
    _G.Settings_V4 = settings
else
    return
end

function HasMain()
    local gui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if gui and gui:FindFirstChild("Main (minimal)") then
        print("Found")
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
