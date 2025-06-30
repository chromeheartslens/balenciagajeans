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
    
    end)
    if not s then end;
end

function Mainfuncs:PlayerRemoving(Player)
    local s, e = pcall(function()
    
    end)
    if not s then end;
end

return Mainfuncs