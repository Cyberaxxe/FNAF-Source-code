local Folder = game.Workspace:WaitForChild("Pickables"):GetDescendants()

for _, v in ipairs(Folder) do
	if v:IsA("ClickDetector") then
		v.MouseClick:Connect(function(clicker)
			print("CLICK RECIEVED")
			local original_location = v.Parent.CFrame
			local backPack = clicker.Backpack

			for i, v in ipairs(backPack:GetChildren()) do

				v.Parent = game.Workspace:WaitForChild("Pickables")
				v.Handle.CFrame = original_location

			end

			task.wait(0.2)

			v.Parent.Parent.Parent = backPack

		end)
	end
end
