--SERVER CODE
--PRETTY MUCH STOLE THE FRAMEWORK ( CODE = ORIGINAL THO )

local spawnLogic = require(script.SpawnLogic)
local timer = require(script.Timer)
local functiong = require(script.PlayerFunctions)

local function startGame()
	timer.count("Ongoing", 1500)
	spawnLogic.ClearItems(game.Workspace:WaitForChild("Animatornics"))
	functiong.spawnPlayers(game.Workspace.SpawnBox.SpawnPart.CFrame)
	
end

local function Intermission()
	timer.count("Intermission", 10)
	spawnLogic.SpawnItems(game.ReplicatedStorage:WaitForChild("Animatronics"), game.Workspace.Animatornics, game.ServerScriptService.EnemyHandler)
	functiong.spawnPlayers(game.Workspace.spart.CFrame)
	
end

while true do
	Intermission()
	startGame()
end
