-- SERVER CODE
local deb= false

for i, v in pairs(game.Workspace.Animatornics:GetDescendants()) do
	if v.Name == "Hitbox" and v:IsA("Part") then
		
		v.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChild("Animate") then
				
				if not deb then
					deb = true;
					
					local player = game.Players:FindFirstChild(hit.Parent.Name)
					game.ReplicatedStorage.onJumpscare:FireClient(player)
					
					v.Parent.Controller.WalkSpeed = 0 
					local aminTrack = v.Parent.GFreddy.Humanoid:LoadAnimation(game.ReplicatedStorage.FJS)
					aminTrack:Play()
					
					task.wait(3)
					
					v.Parent.Controller.WalkSpeed = 16
										
					task.wait(2)
					deb = false;
					
				end
			end
		end)
	end
end

-- CLIENT CODE

game.ReplicatedStorage.onJumpscare.OnClientEvent:Connect(function(plr, cf)
	
	local cam = game.Workspace.CurrentCamera
	cam.CameraType = Enum.CameraType.Scriptable
	
	local TSS = game:GetService("TweenService")
	local inf = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local enf = {["CFrame"] = game.Workspace.Jumpscare.CFrame}
	
	TSS:Create(cam, inf, enf):Play()
	Hum.Health = 0
	cam.CameraType = Enum.CameraType.Custom;
	
end)
