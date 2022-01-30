local player = game.Players.LocalPlayer
local cam = game.Workspace.CurrentCamera

local camPart = game.Workspace:WaitForChild("Campart")
local mnuPart = game.Workspace:WaitForChild("MenuCampart")

local status = game.ReplicatedStorage.Info.Stats

local main = script.Parent.Main

main.Play.MouseButton1Click:Connect(function()
	
	local INF = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local ENF = {["CFrame"] = game.Workspace.MenuCampart.CFrame}
	game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, INF, ENF):Play()
	
	main.Visible = false
	script.Parent.StartScreen.Visible = true
	
end)

game.ReplicatedStorage.toggleMeny.OnClientEvent:Connect(function(val)
	
	main.Visible = val
	script.Parent.StartScreen.Visible = val
	
	local cam = game.Workspace.CurrentCamera
	cam.CameraType = "Scriptable"
	cam.CFrame = game.Workspace:WaitForChild("Campart").CFrame
	cam.CameraSubject = game.Workspace.Campart
	
	if val == false then
		cam.CameraType = "Custom"
		cam.CameraSubject = player.Character:WaitForChild("Humanoid")
		
	end
end)

while true do
	wait(1)
	script.Parent.StartScreen.Info.Text = "GAME WILL BE STARTING IN: "..game.ReplicatedStorage.Info.countdown.Value

end
