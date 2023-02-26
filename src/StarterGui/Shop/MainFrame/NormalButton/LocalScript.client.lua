local normalButton = script.Parent

local MainFrame= script.Parent.Parent

normalButton.MouseButton1Down:Connect(function()
	MainFrame.DoubleCoins.Visible=false
	MainFrame.Sword.Visible=false
	MainFrame.SpeedBoost.Visible=true
end)