local function onPlayerAdded(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats
	
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 0
	money.Parent = leaderstats
	
	local walkspeed = Instance.new("IntValue")
	walkspeed.Name = "Walkspeed"
	walkspeed.Value = 0
	walkspeed.Parent = leaderstats
	
	local function increaseWalkSpeed()
		while true do
			wait(1)
			walkspeed.Value = walkspeed.Value + 1
		end
	end
	
	coroutine.wrap(increaseWalkSpeed)()
	
	walkspeed.Changed:Connect(function(newValue)
		player.Character:WaitForChild("Humanoid").WalkSpeed = newValue
	end)
	
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in ipairs(game.Players:GetPlayers()) do
	onPlayerAdded(player)
end
