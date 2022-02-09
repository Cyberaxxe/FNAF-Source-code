local openables = game.Workspace:WaitForChild("Doors");
local deb = false


for i, v in ipairs(openables:GetDescendants()) do
	if v.Name == "Mover" then
		v.Touched:Connect(function(hit)
			
			if hit.Parent.Name == v.Parent.Name then
				v.Tracker.Value.Value = true
				v:Destroy()
				hit.Parent:Destroy()

			end
		end)
	end
	
	if v.Name == "Wirecutters" then
		v.Touched:Connect(function(hit)
			if hit.Parent.Name == v.Name then
				
				v.Tracker.Value.Value = true
				v:Destroy()
				hit.Parent:Destroy()
				
			end
		end)
	end
end

for i, v in pairs(game.Workspace.FixableItems:GetChildren()) do
	v.Touched:Connect(function(hit)
		if hit.Name == v.Name then
			hit.Parent:Destroy()
			v.Tracker.Value.Value = true
			print("Works")
		end
	end)
end
