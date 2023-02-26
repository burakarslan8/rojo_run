local ReplicatedStorage = game.ReplicatedStorage
local Fireball = ReplicatedStorage:WaitForChild("Fireball")
local DropperPart1= workspace.KillBlocks.FireballHolders.DropperPart1
local DropperPart2= workspace.KillBlocks.FireballHolders.DropperPart2
local DropperPart3= workspace.KillBlocks.FireballHolders.DropperPart3
local DropperPart4= workspace.KillBlocks.FireballHolders.DropperPart4
local checkpoints_a= workspace.Checkpoints_A
local checkpoints_b= workspace.Checkpoints_B

local touched_2a=game.ReplicatedStorage.Touched_2A	
local touched_2b=game.ReplicatedStorage.Touched_2B

local touched_3a= game.ReplicatedStorage.Touched_3A
local touched_3b= game.ReplicatedStorage.Touched_3B

local fireballs= {workspace.KillBlocks.FireballHolders.DropperPart1:GetChildren(),
	workspace.KillBlocks.FireballHolders.DropperPart2:GetChildren(),workspace.KillBlocks.FireballHolders.DropperPart3:GetChildren(),
	workspace.KillBlocks.FireballHolders.DropperPart4:GetChildren()
}

local run_ended = game.ReplicatedStorage.RunEnded

checkpoints_a[2].Touched:Connect(function(hit)
	
	local human= hit.Parent:FindFirstChild("Humanoid")

	if human and human.Health > 0 then
		if touched_2a.Value==false then
			touched_2a.Value=true
			while touched_3a.Value == false do
				
				wait()
				
				local NewFireball3= Fireball:Clone()
				
				NewFireball3.Parent= DropperPart3			
				NewFireball3.CFrame= DropperPart3.CFrame	
				wait(2)	
				
				if touched_3a.Value==true or run_ended.Value==true then
					DropperPart3:ClearAllChildren()
					DropperPart4:ClearAllChildren()
					break
				end
				
				local NewFireball4= Fireball:Clone()
				
				NewFireball4.Parent= DropperPart4			
				NewFireball4.CFrame= DropperPart4.CFrame

				wait(2)

			end
		end
	end
end)

checkpoints_b[2].Touched:Connect(function(hit)
	
	local human = hit.Parent:FindFirstChild("Humanoid")
	if human and human.Health >0 then
		if touched_2b.Value == false then
			touched_2b.Value=true
			while touched_3b.Value == false do 
				
				local NewFireball1= Fireball:Clone()

				NewFireball1.Parent= DropperPart1
				NewFireball1.CFrame= DropperPart1.CFrame

				wait(2)
				
				if touched_3b.Value==true or run_ended.Value==true then
					DropperPart1:ClearAllChildren()
					DropperPart2:ClearAllChildren()
					break
				end
				
				local NewFireball2= Fireball:Clone()

				NewFireball2.Parent= DropperPart2
				NewFireball2.CFrame= DropperPart2.CFrame

				wait(2)
			end
		end
	end
end)

checkpoints_a[3].Touched:Connect(function(hit)
	local human = hit.Parent:FindFirstChild("Humanoid")
	if human and human.Health>0 then
		touched_3a.Value=true
		DropperPart3:ClearAllChildren()
		DropperPart4:ClearAllChildren()
		
	end
end)

checkpoints_b[3].Touched:Connect(function(hit)
	local human = hit.Parent:FindFirstChild("Humanoid")
	if human and human.Health>0 then
		touched_3b.Value=true
		DropperPart1:ClearAllChildren()
		DropperPart2:ClearAllChildren()
		
	end
end)
