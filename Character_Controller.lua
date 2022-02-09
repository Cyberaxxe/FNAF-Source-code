

game.ReplicatedStorage.voting.OnServerEvent:Connect(function(player, val)
	if val == "Player" then
		print("PLAYER SELECTED")
		local players = game.Players:GetPlayers()
		local rand_player = math.random(1, #players)
		
		print(players[rand_player].Name)
		
		local is_impostor = Instance.new("BoolValue")
		is_impostor.Parent = players[rand_player]
		is_impostor.Value = true
		
		local character = players[rand_player].Character or players[rand_player].CharacterAdded:Wai()
		local humanoidRP = character:WaitForChild("HumanoidRootPart")
		
		local model = game.ReplicatedStorage.Animatronics.FreddyMesh:Clone()
		model.Parent = game.Workspace
		model.GFreddy.Humanoid:LoadAnimation(game.ReplicatedStorage.Freddy)
		local attacher = model:WaitForChild('HumanoidRootPart').ANCHOR
		
		attacher.Part0 = humanoidRP
		
		for i, v in ipairs(model:GetDescendants()) do
			if v:IsA("MeshPart") or v:IsA("Part") and v.Anchored == true then
				v.Anchored = false
				
			end
		end
		
		for i, v in ipairs(character:GetChildren()) do
			if v:IsA("BasePart") then v.Transparency = 1
			
			end
			
			if v:IsA("Accessory") then v:Destroy() 
				
			end
			
		end
	end
end)
