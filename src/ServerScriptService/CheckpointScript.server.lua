local checkpoints_a = workspace:WaitForChild("Checkpoints_A"):GetChildren()
local checkpoints_b = workspace:WaitForChild("Checkpoints_B"):GetChildren()

local checkpoint_message = game.StarterGui.CheckPoint.GUI.Message

local RunService = game:GetService("RunService")

local touched_2a= game.ReplicatedStorage.Touched_2A
local touched_2b= game.ReplicatedStorage.Touched_2B

local touched_3a= game.ReplicatedStorage.Touched_3A
local touched_3b= game.ReplicatedStorage.Touched_3B

local sound = game.Workspace.CheckpointSound

local function FindCheckpoint_A(character,stage)
	for i,checkpoint in pairs(checkpoints_a) do
		local checkpoint_number = tonumber(checkpoint.Name)
		if stage.Value == checkpoint_number then
			return checkpoint
		end
	end
end

local function FindCheckpoint_B(character,stage)
	for i,checkpoint in pairs(checkpoints_b) do
		local checkpoint_number = tonumber(checkpoint.Name)
		if stage.Value == checkpoint_number then
			return checkpoint
		end
	end
end


game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name= "leaderstats"
	leaderstats.Parent= player
	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Value = 0
	stage.Parent = leaderstats
	
	
	player.CharacterAdded:Connect(function(char)
		local root_part= char:WaitForChild("HumanoidRootPart")
		if player.Team== game.Teams["Team A"] then
			local checkpoint_a = FindCheckpoint_A(char, stage)
			RunService.Heartbeat:Wait()
			root_part.CFrame = checkpoint_a.CFrame
			
		elseif player.Team == game.Teams["Team B"]  then
			local checkpoint_b = FindCheckpoint_B(char, stage)
			RunService.Heartbeat:Wait()
			root_part.CFrame = checkpoint_b.CFrame
		end
	end)
end)

for _, checkpoint in pairs(checkpoints_a) do
	checkpoint.Touched:Connect(function(hit)
		local human = hit.Parent:FindFirstChild("Humanoid")
		if human and human.Health >0  then
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			if player then
				local leaderstats = player:WaitForChild("leaderstats")
				local stage = leaderstats.Stage
				local checkpoint_number = tonumber(checkpoint.Name)
				if checkpoint_number - stage.Value ==1 then
					checkpoint.Color = Color3.fromRGB(0,255,0)
					stage.Value = checkpoint_number
					sound:Play()
				end
			end
		end
	end)
end

for _, checkpoint in pairs(checkpoints_b) do
	checkpoint.Touched:Connect(function(hit)
		local human = hit.Parent:FindFirstChild("Humanoid")
		if human and human.Health >0  then
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			if player then
				local leaderstats = player:WaitForChild("leaderstats")
				local stage = leaderstats.Stage

				local checkpoint_number = tonumber(checkpoint.Name)
				if checkpoint_number - stage.Value ==1 then
					checkpoint.Color = Color3.fromRGB(0,255,0)
					stage.Value = checkpoint_number
					sound:Play()
				end
			end
		end
	end)
end



