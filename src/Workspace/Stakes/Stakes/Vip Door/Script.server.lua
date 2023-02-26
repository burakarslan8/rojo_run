local function onTouch(hit)
	if (hit.Parent:findFirstChild("Humanoid") ~= nil) then
		hit.Parent.Humanoid.Health = 0		
	end
end

script.Parent.Touched:Connect(onTouch)
