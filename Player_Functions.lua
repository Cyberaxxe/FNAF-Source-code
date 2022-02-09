-- MODULE CODE

local module = {}

local players = game.Players:GetChildren()

game.Players.PlayerAdded:Connect(function(p)
	
	local mark = Instance.new("StringValue", game.ReplicatedStorage.Info.Current)
	game.ReplicatedStorage.toggleMeny:FireClient(p, true)
	mark.Name = p.Name
	
end)

function module.spawnPlayers(Location : CFrame)
	for i, v in ipairs(game.ReplicatedStorage.Info.Current:GetChildren()) do
		
		local player = game.Players:FindFirstChild(v.Name)
		game.ReplicatedStorage.toggleMeny:FireClient(player, false)
		local chartr = player.Character or player.CharacterAdded:Wait()
		local HUMRRP = chartr:WaitForChild("HumanoidRootPart")
		HUMRRP.CFrame = Location
		
		if player:FindFirstChild("Value") then
			print("ahha")
		end
		
		game.ReplicatedStorage.Cutscene:FireClient(player)
	end
end


return module
