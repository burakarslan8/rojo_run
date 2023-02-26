local button = script.Parent

local MainFrame = script.Parent.Parent

button.MouseButton1Down:Connect(function()
	MainFrame.Visible = false
end)