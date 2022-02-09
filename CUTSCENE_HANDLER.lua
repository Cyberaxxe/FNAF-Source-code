local function typewrite(object, len, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		task.wait(len)
	end
end

game.ReplicatedStorage.Cutscene.OnClientEvent:Connect(function()
	print("RECIEVED")
	
	local GUI = game.Players.LocalPlayer.PlayerGui
	local TSS = game:GetService("TweenService")
	
	local INF = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local ENF = {["CFrame"] = game.Workspace.TWEENZ.CFrame}
	
	local cam = game.Workspace.CurrentCamera
	TSS:Create(cam, INF, ENF):Play()
	
	cam.CameraType = "Scriptable"
	cam.CFrame = game.Workspace.PLAYER_POS.CFrame
	
	GUI.ScreenGui.ImageLabel.Visible = true
	typewrite(GUI.ScreenGui.ImageLabel.TEXT, 0.010, "SO THIS IS THE PIZZERIA...")
	task.wait(1)
	typewrite(GUI.ScreenGui.ImageLabel.SUBT, 0.010, "I HAVE A BAD FEELING ABOUT THIS")
	task.wait(1.5)
	typewrite(GUI.ScreenGui.ImageLabel.TEXT, 0.010, "GUESS THERES NO TURNING BACK")
	task.wait(4)
	
	cam.CameraType = "Custom"
	cam.CameraSubject = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
	GUI.ScreenGui.ImageLabel.Visible = false
	
end)
