local checkpoints_a = workspace.Checkpoints_A:GetChildren()
local checkpoints_b = workspace.Checkpoints_B:GetChildren()

local player = game.Players.LocalPlayer
local text = player.PlayerGui.CheckPoint.GUI.Message
local canhit = true

local finish= workspace.Pist.Finish

for _, checkpoint in pairs(checkpoints_a) do
	
	checkpoint.Touched:Connect(function(hit)
		if canhit == true then
			local name= hit.Parent.Name
			local human = hit.Parent:FindFirstChild("Humanoid")
			local leaderstats = player:WaitForChild("leaderstats")
			local stage = leaderstats.Stage
			local checkpoint_number = tonumber(checkpoint.Name)
			
			if human and human.Health>0 then
				if checkpoint_number - stage.Value == 1 then
					text.Visible=true
					for i, p in pairs(game.Players:GetChildren()) do
						if p.Name == name then
							canhit = false
							text.Text = "CHECKPOINT!"
							text.Visible = true
							wait(1)
							text.Visible = false
							canhit = true
						elseif p.Name ~= name then
							text.Visible =false 
							break
						end
					end
				end
			end
		end
	end)
end
for _, checkpoint in pairs(checkpoints_b) do
	checkpoint.Touched:Connect(function(hit)
		if canhit == true then
			local name= hit.Parent.Name
			local human = hit.Parent:FindFirstChild("Humanoid")
			local leaderstats = player:WaitForChild("leaderstats")
			local stage = leaderstats.Stage
			local checkpoint_number = tonumber(checkpoint.Name)
			
			if human and human.Health>0 then
				if checkpoint_number - stage.Value == 1 then
					text.Visible=true
					for i, p in pairs(game.Players:GetChildren()) do
						if p.Name == name then
							canhit = false
							text.Text = "CHECKPOINT!"
							text.Visible = true
							wait(1)
							text.Visible = false
							canhit = true
						elseif p.Name ~= name then
							text.Visible =false 
							break
						end
					end
				end
			end
		end
	end)
end

--[[ finish.Touched:Connect(function(hit)
	local human = hit.Parent:FindFirstChild("Humanoid")
	if human and human.Health>0 then
		if canhit == true then
			local name= hit.Parent.Name
			local human = hit.Parent:FindFirstChild("Humanoid")
			local leaderstats = player:WaitForChild("leaderstats")
			local stage = leaderstats.Stage
			
			if human and human.Health>0 and stage.Value==4 then
				text.Visible=true
				for i, p in pairs(game.Players:GetChildren()) do
					if p.Name == name then
						canhit = false
						text.Text="1st PLACE!!"
						text.Visible = true
						wait(2)
						text.Visible = false
						canhit = true
					elseif p.Name ~= name then
						text.Visible =false 
						break
					end
				end
			end
		end
	end
end) --]]