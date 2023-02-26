if game.Players.LocalPlayer.UserId == 2549181133 then
	keybind = "f" -- Keybind to activate flight
	speed = 50

	repeat wait() until game.Players.LocalPlayer.Character
	
	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local hum = char:WaitForChild("Humanoid")
	local Torso = char:WaitForChild("LowerTorso")
	local Mouse = plr:GetMouse()
	local toggle = false

	Mouse.KeyDown:Connect(function(key)
		if key == keybind then
			if toggle == false then
				toggle = true
				local Anim = Instance.new("Animation")
				Anim.AnimationId = "rbxassetid://04704211237" -- Animation while flying
				local PlayAnim = hum:LoadAnimation(Anim)
				PlayAnim:Play()
				local BV = Instance.new("BodyVelocity",Torso)
				BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				while toggle == true do
					BV.Velocity = Mouse.Hit.lookVector*speed
					wait()
				end
			end
			if toggle == true then
				toggle = false
				Torso:FindFirstChildOfClass("BodyVelocity"):Destroy()
				local tracks = hum:GetPlayingAnimationTracks()
				for i, stoptracks in pairs(tracks) do
					stoptracks:Stop()
				end
				local Anim = Instance.new("Animation")
				Anim.AnimationId = "rbxassetid://0" -- Animation while falling down to the ground
				local PlayAnim = hum:LoadAnimation(Anim)
				PlayAnim:Play()
			end
		end
	end)
end
	
	
