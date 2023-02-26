local player= game.Players.LocalPlayer

local coins = player.Coins

local text = player.PlayerGui.Coins.TextLabel

text.Text = "PURSE: "..coins.Value

coins:GetPropertyChangedSignal("Value"):Connect(function()
	text.Text = "PURSE: "..coins.Value
end)