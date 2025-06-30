--// Declarations
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService('MessagingService');

local BaseUrl = 'https://raw.githubusercontent.com/chromeheartslens/balenciagajeans/refs/heads/main/'

--// Module Requires
local Loadstring = require(ServerStorage.Modules.EntityStateMachines.NPCBoss.Data.Main)

--// locals

local function PathRequire(Path) --// calls github url as a loadstring thru a path
    return Loadstring(HttpService:GetAsync(BaseUrl..Path..'.lua')) -- returns module
end

local m = {}

local CurrentVersion

local Vers

local FirstLoad

local function DeepCopyTable(Table)
	local copy = {}
	for key, value in pairs(Table) do
		if type(value) == "table" then
			copy[key] = DeepCopyTable(value)
		else
			copy[key] = value
		end
	end
	return copy
end

function m:Init()
	repeat task.wait(0.5) until FirstLoad == true

	pcall(function()
		if Vers then
			if CurrentVersion then
				if CurrentVersion ~= Vers then
					m:StartScript()
				else
					return
				end
			else
				m:StartScript()
			end
		end
	end)
end


local PACon
local PRCon
local CACon
local Global
local Rewrite

function m:StartScript()
	if Vers then
		if PACon then
			PACon:Disconnect()
			PACon = nil
		end
		if PRCon then
			PRCon:Disconnect()
			PRCon = nil
		end
		if CACon then
			CACon:Disconnect()
			CACon = nil
		end
		if Global then
			Global = nil
		end

		local Mainfuncs 

		repeat
			pcall(function()
				Mainfuncs = PathRequire('MainFunctions')()
			end)
			task.wait(1)
		until Mainfuncs

		pcall(function()
			CurrentVersion = Vers
		end)


		PACon = Players.PlayerAdded:Connect(function(Player)
			Mainfuncs:PlayerAdded(Player)
		end)
		PRCon = Players.PlayerRemoving:Connect(function(Player)
			Mainfuncs:PlayerRemoving(Player)
		end)

		Global = {
			globalfunc = function()

			end,

		}

		task.delay(10, function()
			for i, v in pairs(Players:GetPlayers()) do
				Mainfuncs:PlayerAdded(v)
			end
		end)

		Mainfuncs:GeneralFunction()
	end
end

task.spawn(function()
	local s,c 
	while true do
		s,c = pcall(function()
			Vers = PathRequire('Version')()
		end)
		if s then
			if not FirstLoad then
				FirstLoad = true
			end
		end

		if CurrentVersion and Vers then
			print(CurrentVersion, Vers)
			if CurrentVersion ~= Vers then
				pcall(function()
					warn("2222Pre int vers:", tostring(CurrentVersion))
				end)
				m:StartScript()
			end
		end
		task.wait(5)
	end
end)

m:Init()

return m