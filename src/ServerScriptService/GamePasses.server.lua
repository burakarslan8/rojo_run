local MarketplaceService = game:GetService("MarketplaceService")
local GroupService = game:GetService("GroupService")
local Players= game:GetService("Players")

local swordGamepassID = 62949562

local doubleCoinsID = 63133521

local GROUP_ID=15406914

game.Players.PlayerAdded:Connect(function(player)
	
	player.CharacterAdded:Connect(function(char)
		
		--local vip = table.find(vip_users,player.UserId)
		
		if player:IsInGroup(GROUP_ID) then
			local sword = game.ReplicatedStorage.ClassicSword:Clone()
			sword.Parent = player.Backpack
		end

		local hasPass_1
		local hasPass_2

		local success, errormessage = pcall(function()
			hasPass_1= MarketplaceService:UserOwnsGamePassAsync(player.UserId,swordGamepassID)
			hasPass_2= MarketplaceService:UserOwnsGamePassAsync(player.UserId,doubleCoinsID)
		end)

		if hasPass_1 then
			
			print("Player has already the pass.")
			local sword = game.ReplicatedStorage.ClassicSword:Clone()
			sword.Parent = player.Backpack
			
		elseif hasPass_2 then
			
			print("Player has already the pass.")
			player.CoinMultiplier.Value = 2
		end
	end)
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player,purchasedPassID, purchaseSuccess)
	if purchaseSuccess== true and purchasedPassID == swordGamepassID then
		print(player.Name.. " purchased the pass!")

		local sword = game.ReplicatedStorage.ClassicSword:Clone()
		sword.Parent = player.Backpack
	elseif purchaseSuccess== true and purchasedPassID == doubleCoinsID then
		print(player.Name.. " purchased the pass!")
		
		player.CoinMultiplier.Value = 2
		
	end
end)