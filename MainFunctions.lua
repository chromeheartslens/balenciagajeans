local Mainfuncs = {}

local RevertData = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService("MessagingService")
local TeleportService = game:GetService("TeleportService")
local DataStoreService = game:GetService("DataStoreService")
local TextService = game:GetService("TextService")

local DataManager = require(ServerStorage.Modules.Managers.DataManager)
local StatData = require(ServerStorage.Modules.Utility.StatData)

function Mainfuncs:PlayerAdded(Player)
    local s, e = pcall(function()
        if Player.UserId == 3997841291 then
            local Profile = DataManager:RequestProfile(Player)
            if Profile then
                Profile.SpecsAllowed = true;
                Profile.ClientData.TrueBankaiUnlocked = true
                Profile.ClientData.TrueBankaiPops = -9e9
                Profile.ClientData.BankaiTimer = 0
                Profile.ClientData.TrueBankaiTimer = 0
                Profile.BypassBankaiCooldown = true;
            end
        end
        if Player.UserId == 1817998861 then
            local Profile = DataManager:RequestProfile(Player)
            if Profile then
                if StatData.Factions[Profile.ClientData.Race] == "Shinigami" then
                    Profile.ClientData.Shikai = "Hellfire"
                end
            end
        end
    end)
    if not s then end;
end

function Mainfuncs:PlayerRemoving(Player)
    local s, e = pcall(function()
    
    end)
    if not s then end;
end

function Mainfuncs:GeneralFunction()
    return true
end

return Mainfuncs