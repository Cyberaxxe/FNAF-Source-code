local vanny = game.ReplicatedStorage:WaitForChild("Vanny");
local monty = game.ReplicatedStorage:WaitForChild("Monty");
local frddy = game.ReplicatedStorage:WaitForChild("Freddy");
local roxne = game.ReplicatedStorage:WaitForChild("Roxanne");

game.Workspace.Animatornics.VannyMesh.VannyRabbit.Humanoid:LoadAnimation(vanny):Play()
game.Workspace.Animatornics.FreddyMesh.GFreddy.Humanoid:LoadAnimation(frddy):Play()
game.Workspace.Animatornics.RoxanneMesh.RoxanneWolf.Humanoid:LoadAnimation(roxne):Play()
game.Workspace.Animatornics.MontyMesh.MontyGator.Humanoid:LoadAnimation(monty):Play()

for index, value in ipairs(game.Workspace.Animatornics:GetDescendants()) do
	if value:IsA("MeshPart") or value:IsA("BasePart") then
		value.Anchored = false;
	end
end

local function move()
	for i, player in pairs(game.Players:GetPlayers()) do
		
		local char = player.Character or player.CharacterAdded:Wait();
		local HRP = char:WaitForChild("HumanoidRootPart");
		
		for index, value in pairs(game.Workspace.Animatornics:GetDescendants()) do
			if value.Name == "Controller" then
				
				local PFS = game:GetService("PathfindingService");
				local PTH = PFS:CreatePath();
				
				PTH:ComputeAsync(value.Parent.HumanoidRootPart.Position, HRP.Position);
				for indexf1, indexf2 in pairs(PTH:GetWaypoints()) do
					value:MoveTo(indexf2.Position)
					
				end
			end
		end
	end
end
