-- MODULE CODE


local module = {}

local players = game.Players:GetChildren()

function module.spawnPlayers(Location : CFrame)
	for i, v in pairs(game.ReplicatedStorage.Info.Current:GetChildren()) do
		local player = game.Players:FindFirstChild(v.Name)
		local chartr = player.Character or player.CharacterAdded:Wait()
		local HUMRRP = chartr:WaitForChild("HumanoidRootPart")
		HUMRRP.CFrame = Location
		
	end
end

return module
