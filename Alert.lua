local player = game.Players.LocalPlayer
local character = player.Character
local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")

local debounce = false

HumanoidRootPart.Touched:Connect(function(hit)
	if hit.Name == "Alert" and debounce ~= true then
		debounce = true
		
		local blurEffect = Instance.new("BlurEffect")
		blurEffect.Size = 0
		blurEffect.Parent = game.Workspace.Camera
		
		local blomEffect = Instance.new("BloomEffect")
		blomEffect.Size = 0
		blomEffect.Threshold = 4
		blomEffect.Intensity = 0
		
		local colorCorrc = Instance.new("ColorCorrectionEffect")
		
		local TSS = game:GetService("TweenService")
		local INF = TweenInfo.new(
			
			5,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.Out,
			0,
			true,
			0
			
		)
		
		local ENF = {["Size"] = 24}
		local CCC = {["TintColor"] = Color3.new(0.14902, 0.14902, 0.14902)}
		local END = {["Size"] = 60; ["Threshold"] = 0.8; ["Intensity"] = 1}
		
		TSS:Create(blurEffect, INF, ENF):Play()
		TSS:Create(blomEffect, INF, END):Play()
		TSS:Create(colorCorrc, INF, CCC):Play()
		
		task.wait(5)
		debounce = false
		
	end
end)
