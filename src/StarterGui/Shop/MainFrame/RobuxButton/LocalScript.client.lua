local robuxButton = script.Parent

local MainFrame= script.Parent.Parent

robuxButton.MouseButton1Down:Connect(function()
	MainFrame.DoubleCoins.Visible=true
	MainFrame.Sword.Visible=true
	MainFrame.SpeedBoost.Visible=false
end)