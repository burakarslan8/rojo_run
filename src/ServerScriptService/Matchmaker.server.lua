local silindir1= workspace.EnteringPlatform.Silindir1
local silindir2= workspace.EnteringPlatform.Silindir2
local slot1= workspace.EnteringPlatform.Slot1
local slot2= workspace.EnteringPlatform.Slot2

local light1= game.ReplicatedStorage.Light1
local light2= game.ReplicatedStorage.Light2

local lobbySpawn= workspace.StartingPlatform.Lobby

local roundLength = 60
local intermissionLength = 10

local inRound = game.ReplicatedStorage.InRound
local status = game.ReplicatedStorage.Status

local run_ended = game.ReplicatedStorage.RunEnded

local touched_2a=game.ReplicatedStorage.Touched_2A
local touched_2b=game.ReplicatedStorage.Touched_2B

local touched_3a= game.ReplicatedStorage.Touched_3A
local touched_3b= game.ReplicatedStorage.Touched_3B

local players = game.Players:GetChildren()
local playersA= game.Teams["Team A"]:GetPlayers()
local playersB= game.Teams["Team B"]:GetPlayers()
local player1_name = game.ReplicatedStorage.Player1_Name
local player2_name = game.ReplicatedStorage.Player2_Name

local checkpoints_a = workspace:WaitForChild("Checkpoints_A"):GetChildren()
local checkpoints_b = workspace:WaitForChild("Checkpoints_B"):GetChildren()


local DropperPart1 = workspace.KillBlocks.FireballHolders.DropperPart1
local DropperPart2 = workspace.KillBlocks.FireballHolders.DropperPart2
local DropperPart3 = workspace.KillBlocks.FireballHolders.DropperPart3
local DropperPart4 = workspace.KillBlocks.FireballHolders.DropperPart4

local ready= game.ReplicatedStorage.Ready

local team= game.ReplicatedStorage.TeamSelector

local function roundTimer()
	
	team.Value= math.random(1,2)
	
	for i=intermissionLength,1,-1  do
		inRound.Value=false
		ready.Value=false
		wait(1)
		status.Value="Game starts in ".. i .. " seconds!"
		touched_2a.Value=false
		touched_2b.Value=false
		touched_3a.Value=false
		touched_3b.Value=false
		
		workspace.Pist.Finish.Color=Color3.fromRGB(255,255,0)
		
		for _, playerstand in pairs(checkpoints_a) do
			playerstand.Color= Color3.fromRGB(255, 255, 0)
		end
		for _, playerstand in pairs(checkpoints_b) do
			playerstand.Color= Color3.fromRGB(255, 255, 0)
		end
	end

	for i= roundLength,1,-1 do
		inRound.Value=true
		if run_ended.Value==true  then
			
			DropperPart3:ClearAllChildren()
			DropperPart4:ClearAllChildren()
			DropperPart1:ClearAllChildren()
			DropperPart2:ClearAllChildren()
			break
		end
		wait(1)
		status.Value="".. i .. " seconds left!"
	end
	wait(1)
	ready.Value=true
	status.Value= " "
	inRound.Value=false
	team.Value=0
end

silindir1.Touched:Connect(function(hit)
	light1.Value=true
	slot1.Color=Color3.fromRGB(85, 255, 255)
	if hit.Parent:FindFirstChild("Humanoid") then
		while(light1.Value ~= false) do
			wait()
			if light2.Value==true and ready.Value==true then
				wait(0.20)
				local player= game.Players:GetPlayerFromCharacter(hit.Parent)
				player1_name.Value=player.Name
				player.Character.HumanoidRootPart.CFrame= lobbySpawn.CFrame + Vector3.new(0,1,5)
				
				spawn(roundTimer)
				
				inRound.Changed:Connect(function()
				
					if inRound.Value == true then
						if player1_name.Value==player.Name  then
							local player_1= player
							if team.Value==1 then
								wait(1)
								player_1.Team=game.Teams["Team A"]
								player_1.Character.HumanoidRootPart.CFrame= game.Workspace.Checkpoints_A[1].CFrame + Vector3.new(0,1,0)
							elseif team.Value==2 then
								wait(1)
								player_1.Team=game.Teams["Team B"]
								player_1.Character.HumanoidRootPart.CFrame= game.Workspace.Checkpoints_B[1].CFrame + Vector3.new(0,1,0)
							end
						end
						
						ready.Value=false
						
					else
						
						if player1_name.Value == player.Name then
							local player_1 = player
							player_1.Character.HumanoidRootPart.CFrame= workspace.House.Exit1.CFrame
							player_1.leaderstats.Stage.Value=0
							player_1.Team= game.Teams.Lobby
						elseif player2_name.Value == player.Name  then
							local player_2 = player
							player_2.Character.HumanoidRootPart.CFrame= workspace.House.Exit2.CFrame
							player_2.leaderstats.Stage.Value=0
							player_2.Team= game.Teams.Lobby
						end
						
						run_ended.Value= true
						ready.Value=true
						
					end
				end)
			end
		end
	end
	
	silindir1.TouchEnded:Connect(function(hit)
		slot1.Color=Color3.fromRGB(27, 42, 53)
		light1.Value=false
	end)
end)


silindir2.Touched:Connect(function(hit)
	light2.Value=true
	slot2.Color=Color3.fromRGB(85, 255, 255)
	if hit.Parent:FindFirstChild("Humanoid") then
		while(light2.Value~=false) do
			wait()
			if light1.Value==true and ready.Value==true then
				wait(0.20)
				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				player2_name.Value=player.Name
				player.Character.HumanoidRootPart.CFrame= lobbySpawn.CFrame + Vector3.new(0,1,-5)
				
				spawn(roundTimer)
				
				inRound.Changed:Connect(function()

					if inRound.Value == true then
						if player2_name.Value== player.Name then
							local player_2= player
							if team.Value==1 then
								wait(1)
								player_2.Team=game.Teams["Team B"]
								player_2.Character.HumanoidRootPart.CFrame= game.Workspace.Checkpoints_B[1].CFrame + Vector3.new(0,1,0)
							elseif team.Value==2 then
								wait(1)
								player_2.Team=game.Teams["Team A"]
								player_2.Character.HumanoidRootPart.CFrame= game.Workspace.Checkpoints_A[1].CFrame + Vector3.new(0,1,0)
							end
						end
						
						ready.Value=false
					else
						
						
						if player1_name.Value == player.Name then
							local player_1 = player
							player_1.Character.HumanoidRootPart.CFrame= workspace.House.Exit1.CFrame
							player_1.leaderstats.Stage.Value=0
							player_1.Team= game.Teams.Lobby
						elseif player2_name.Value == player.Name  then
							local player_2 = player
							player_2.Character.HumanoidRootPart.CFrame= workspace.House.Exit2.CFrame
							player_2.leaderstats.Stage.Value=0
							player_2.Team= game.Teams.Lobby
						end
						run_ended.Value=true
						ready.Value=true
					end	
				end)
			end
		end
	end
	silindir2.TouchEnded:Connect(function()
		slot2.Color=Color3.fromRGB(27, 42, 53)
		light2.Value=false
	end)
end)

