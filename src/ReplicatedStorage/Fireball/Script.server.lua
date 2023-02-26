local killBlock = script.Parent
local function onTouch(otherPart)
	local model= otherPart:FindFirstAncestorWhichIsA("Model")
	if model then
		local human = model:FindFirstChildWhichIsA("Humanoid")
		if human then
			human.Health = 0
		end
	end
end

killBlock.Touched:Connect(onTouch)
