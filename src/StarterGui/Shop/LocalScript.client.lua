local MarketplaceService = game:GetService("MarketplaceService")

local MainFrame= script.Parent.MainFrame
local swordButton = MainFrame.Sword.SwordButton
local coinsButton = MainFrame.DoubleCoins.CoinsButton

local speedButton = MainFrame.SpeedBoost.SpeedButton

local ShopButton= MainFrame.Parent.OpenShop

local player = game.Players.LocalPlayer

local swordGamepassID = 62949562

local doubleCoinsID = 63133521

ShopButton.MouseButton1Down:Connect(function()
	MainFrame.Visible= not MainFrame.Visible
	MainFrame.DoubleCoins.Visible=true
	MainFrame.Sword.Visible=true
	MainFrame.SpeedBoost.Visible=false
end)

swordButton.MouseButton1Down:Connect(function()
	local hasPass
	
	local success, errormessage = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId,swordGamepassID)
	end)
	if hasPass then	
		print("Player has already the pass.")
	else 
		MarketplaceService:PromptGamePassPurchase(player,swordGamepassID)
	end
end)

coinsButton.MouseButton1Down:Connect(function()
	local hasPass
	
	local success, errormessage = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId,doubleCoinsID)
	end)
	
	if hasPass then
		print("Player has already the pass.")
	else
		MarketplaceService:PromptGamePassPurchase(player,doubleCoinsID)
	end
end)

speedButton.MouseButton1Down:Connect(function()
	if player.HasSpeedBoost.Value== false then
		MainFrame.PurchaseApprove.Visible=true
		MainFrame.PurchaseApprove.Yes.MouseButton1Down:Connect(function()
			game.ReplicatedStorage.ItemEvents.SpeedEvent:FireServer()
			MainFrame.PurchaseApprove.Visible=false
		end)
		MainFrame.PurchaseApprove.No.MouseButton1Down:Connect(function()
			MainFrame.PurchaseApprove.Visible=false
		end)
	else 
		MainFrame.PurchaseApprove.Visible=true
		MainFrame.PurchaseApprove.Yes.Visible=false
		MainFrame.PurchaseApprove.No.Visible=false
		MainFrame.PurchaseApprove.AreYouSure.Visible=false
		MainFrame.PurchaseApprove.AlreadyHave.Visible=true
		wait(2)
		MainFrame.PurchaseApprove.Visible=false
	end
end)

