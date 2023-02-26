
local DataStoreService = game:GetService("DataStoreService")

local myDataStore = DataStoreService:GetDataStore("myDataStore")

-- myDataStore:SetAsync(player,value) Saves Data

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	leaderstats.Parent= player
	
	local Wins = Instance.new("IntValue")
	Wins.Name = "Wins"
	Wins.Value = 0
	Wins.Parent = leaderstats

	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins"
	Coins.Value = 0
	Coins.Parent = player

	local CoinMultiplier = Instance.new("IntValue")
	CoinMultiplier.Name= "CoinMultiplier"
	CoinMultiplier.Value = 1
	CoinMultiplier.Parent = player

	local HasSpeedBoost = Instance.new("BoolValue")
	HasSpeedBoost.Name = "HasSpeedBoost"
	HasSpeedBoost.Value = false
	HasSpeedBoost.Parent = player
	
	local playerUserId= "Player_"..player.UserId
	
	--Load Data
	
	local data
	local success, errormessage = pcall(function()
		 data = myDataStore:GetAsync(playerUserId)
	end)
	
	if success then
		if data then
			Wins.Value = data.Wins
			Coins.Value = data.Coins
			CoinMultiplier.Value= data.CoinMultiplier
			HasSpeedBoost.Value = data.HasSpeedBoost
			print("Data successfully restored!")
		end
	else 
		print("There was an error whilst getting your data.")
		warn(errormessage)	
	end
	game.Players.PlayerRemoving:Connect(function(player)
		local playerUserId= "Player_"..player.UserId

		local data ={
			Wins =player.leaderstats.Wins.Value,
			Coins= player.Coins.Value,
			CoinMultiplier = player.CoinMultiplier.Value,
			HasSpeedBoost = player.HasSpeedBoost.Value
		}
		local success, errormessage = pcall(function()
			myDataStore:SetAsync(playerUserId, data)
		end)

		if success then
			print("Data successfully saved!")
		else 
			print("There was an error when saving data.")
			warn(errormessage)
		end
	end)
end)

