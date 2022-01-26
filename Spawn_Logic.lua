local mod = {}

function mod.SpawnItems(source : Folder, parent : Folder, handler : Script)
	for index, indexPairs in ipairs(source:GetChildren())do
		local clonedAnimatronics = indexPairs:Clone()
		clonedAnimatronics.Parent = parent;
		handler.Disabled = false;
		clonedAnimatronics.HumanoidRootPart.CFrame = clonedAnimatronics.Position.Value.CFrame
		
	end
end

function mod.ClearItems(folder : Folder)
	for i, v in pairs(folder:GetChildren()) do
		task.wait(0.4)
		v:Destroy();
		
	end
end


return mod
