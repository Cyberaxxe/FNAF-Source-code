-- MODULE CODE

local module = {}

local playersEscaped = {}

function module.count(gameStatus, timer)
	local inf = game.ReplicatedStorage.Info;
	
	inf.countdown.Value = timer;
	inf.Stats.Value = gameStatus;
	
	for index = timer, 1, -1 do
		task.wait(1);
		inf.countdown.Value -= 1;
		
	end
	task.wait(1);
	
end


return module
