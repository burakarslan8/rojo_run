local checkpoint_number = game.StarterGui.CheckPoint.GUI.Message.Text

local run_ended= game.ReplicatedStorage.RunEnded

local ready= game.ReplicatedStorage.Ready

local player1_name = game.ReplicatedStorage.Player1_Name
local player2_name = game.ReplicatedStorage.Player2_Name

local winner_name= game.ReplicatedStorage.WinnerName

local function getPlayerFromName(name)
	-- loop over all players:
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		-- if their name matches (case insensitive), return with that player:
		if player.Name:lower() == name:lower() then
			return player
		end
	end
	-- if we reach the end of the for-loop, no player with that name was found
end

script.Parent.Touched:Connect(function(hit)
	local human= hit.Parent:FindFirstChild("Humanoid")
	local player=game.Players:GetPlayerFromCharacter(hit.Parent)
	if human and human.Health>0 and player.leaderstats.Stage.Value==4 then
		
		
		player.leaderstats.Stage.Value=0
		
		winner_name.Value=player.Name
		
		player.leaderstats.Wins.Value= player.leaderstats.Wins.Value +1
		
		local coin_earned= player.CoinMultiplier.Value * 30
		
		player.Coins.Value = player.Coins.Value + coin_earned
		
		if player.Name == player1_name.Value then
			local player_1 = player
			player_1.Character.HumanoidRootPart.CFrame = workspace.House.Exit1.CFrame + Vector3.new(0,1,0)
			player_1.Team=game.Teams.Lobby
			local player_2= getPlayerFromName(player2_name.Value)
			print("other player tanımlandı")
			local other_coin_earned = player_2.CoinMultiplier.Value * 15
			print("other coin earned tanımlandı")
			player_2.Coins.Value= player_2.Coins.Value + other_coin_earned
			print("para eklendi")
		elseif player.Name == player2_name.Value then
			local player_2= player
			player_2.Character.HumanoidRootPart.CFrame = workspace.House.Exit2.CFrame + Vector3.new(0,1,0)
			player_2.Team=game.Teams.Lobby
			local player_1 = getPlayerFromName(player1_name.Value)
			print("other player tanımlandı")
			local other_coin_earned = player_1.CoinMultiplier.Value * 15
			print("other coin earned tanımlandı")
			player_1.Coins.Value= player_1.Coins.Value + other_coin_earned
			print("para eklendi")
		end
		
		wait()
		run_ended.Value=true
		
		ready.Value=true
	end
end)