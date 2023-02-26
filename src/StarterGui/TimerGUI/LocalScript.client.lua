local status = game.ReplicatedStorage.Status

local player_local = game.Players.LocalPlayer
local text = player_local.PlayerGui.TimerGUI.TimerDisplay

local player1_name = game.ReplicatedStorage.Player1_Name
local player2_name = game.ReplicatedStorage.Player2_Name

status.Changed:Connect(function()
	if player_local.Name== player1_name.Value or player_local.Name == player2_name.Value then
		text.Text=status.Value
		text.Visible=true
	end
end)