local ReplicatedStorage= game:GetService("ReplicatedStorage")
local player= game.Players.LocalPlayer

player.CharacterAdded:Connect(function(character)
	local HasSpeedBoost= player.HasSpeedBoost
	local human = character:WaitForChild("Humanoid")
	if human then
		if HasSpeedBoost.Value==true  then
			character.Humanoid.WalkSpeed=19.2
		else 
			character.Humanoid.WalkSpeed=16
		end
		HasSpeedBoost.Changed:Connect(function()
			if HasSpeedBoost.Value==true  then
				character.Humanoid.WalkSpeed=19.2
			else 
				character.Humanoid.WalkSpeed=16
			end
		end)
	end
end)

