local defaultJumpPower = game:GetService("StarterPlayer").CharacterJumpPower

script.Parent.Touched:connect(function(obj)
	local humanoid = obj.Parent:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
	    humanoid.JumpPower = script.Parent.Parent.Configurations.JumpForce.Value
	    humanoid.Jump = true
	    wait(1)
	    humanoid.JumpPower = defaultJumpPower
	end
end)