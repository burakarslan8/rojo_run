local run_ended = game.ReplicatedStorage.RunEnded

local checkpoints_a = workspace:WaitForChild("Checkpoints_A"):GetChildren()
local checkpoints_b = workspace:WaitForChild("Checkpoints_B"):GetChildren()


local players = game.Players:GetPlayers()
local players_A = game.Teams["Team A"]:GetPlayers()
local players_B = game.Teams["Team B"]:GetPlayers()

local DropperPart1 = workspace.KillBlocks.FireballHolders.DropperPart1
local DropperPart2 = workspace.KillBlocks.FireballHolders.DropperPart2
local DropperPart3 = workspace.KillBlocks.FireballHolders.DropperPart3
local DropperPart4 = workspace.KillBlocks.FireballHolders.DropperPart4

local touched_2a= game.ReplicatedStorage.Touched_2A
local touched_2b= game.ReplicatedStorage.Touched_2B

local touched_3a= game.ReplicatedStorage.Touched_3A
local touched_3b= game.ReplicatedStorage.Touched_3B

local ball_a= workspace.Salincak.PartA
local ball_b= workspace.Salincak.PartB

local winner_name = game.ReplicatedStorage.WinnerName

run_ended.Changed:Connect(function()
	if run_ended.Value==true  then
		for _,player in pairs(players_A) do
			local character = player.Character or player.CharacterAdded:Wait()
			
			character:MoveTo(workspace.House:WaitForChild("Exit1").Position)
			player.leaderstats.Stage.Value=0
			player.Team= game.Teams.Lobby
			
		end
		
		for _, player in pairs(players_B) do
			local character = player.Character or player.CharacterAdded:Wait()

			character:MoveTo(workspace.House:WaitForChild("Exit2").Position)
			player.leaderstats.Stage.Value=0
			player.Team= game.Teams.Lobby
			
		end
		
		workspace.Pist.Finish.Color=Color3.fromRGB(255,255,0)
		for _, playerstand in pairs(checkpoints_a) do
			playerstand.Color= Color3.fromRGB(255, 255, 0)
		end
		for _, playerstand in pairs(checkpoints_b) do
			playerstand.Color= Color3.fromRGB(255, 255, 0)
		end
		
		ball_a.CFrame= CFrame.new(281.519, 82.609, -9.022)
		ball_b.CFrame= CFrame.new(281.519, 82.609, 8.978)
		
		
		touched_2a.Value=false
		touched_2b.Value=false
		touched_3a.Value=false
		touched_3b.Value=false
		
		wait(4)
		
		winner_name.Value=" "
		
		
		run_ended.Value=false
	end
end)