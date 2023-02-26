local text = script.Parent.Winner

local winner_name = game.ReplicatedStorage.WinnerName

local run_ended= game.ReplicatedStorage.RunEnded

winner_name.Changed:Connect(function()
	if winner_name.Value==" " then
		text.Text= " "
	else
		text.Text = winner_name.Value .. " WINS!"
		text.Visible= true
		wait(4)
		text.Visible=false
	end
end)