game.ReplicatedStorage.ItemEvents.SpeedEvent.OnServerEvent:Connect(function(player)
	if player.Coins.Value>=100 then
		local HasSpeedBoost= player.HasSpeedBoost
		player.Coins.Value = player.Coins.Value - 100
		player.Character.Humanoid.WalkSpeed=19.2
		HasSpeedBoost.Value = true
	end
end)