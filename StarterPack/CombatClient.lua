-- @ScriptType: LocalScript
local M = {}

M.UIS = game:GetService("UserInputService")
M.player = game.Players.LocalPlayer
M.character = M.player.Character or M.player.CharacterAdded:Wait()
M.humanoid = M.character:WaitForChild("Humanoid")
M.M1 = M.humanoid:LoadAnimation(script.Animations.M1)
M.M2 = M.humanoid:LoadAnimation(script.Animations.M2)
M.M3 = M.humanoid:LoadAnimation(script.Animations.M3)

M.combo = {
	Step = true,
	Spep2 = false,
	Step3 = false
}

M.cooldown = false
M.lastcooldown = false

M.UIS.InputEnded:Connect(function(I, E)
	if E then return end
	if I.UserInputType == Enum.UserInputType.MouseButton1 then
		if M.cooldown == true or M.lastcooldown == true then
			return
		end

		spawn(function()
			M.cooldown = true
			script.Stick:Play()
			task.wait(0.5)
			M.cooldown = false
		end)

		if M.combo.Step3 then
			game.ReplicatedStorage.MainEvent:FireServer()

			M.M3:play()

			spawn(function()
				M.lastcooldown = true
				task.wait(1.5)
				M.lastcooldown = false
			end)

			spawn(function()
				task.wait(0.1)
				M.combo.Step = true
				M.combo.Spep2 = false
				M.combo.Step3 = false
			end)
		elseif M.combo.Spep2 then
			game.ReplicatedStorage.MainEvent:FireServer()

			M.M2:play()

			M.combo.Step3 = true
			M.combo.Spep2 = false
			M.combo.Step = false
		elseif M.combo.Step then
			game.ReplicatedStorage.MainEvent:FireServer()

			M.M1:play()

			M.combo.Spep2 = true
			M.combo.Step3 = false
			M.combo.Step = false
		end
	end
end)







--local UIS = game:GetService("UserInputService")


--local M = {
--}


--M.init = function()
--	local player = game.Players.LocalPlayer
--	local character = player.Character or player.CharacterAdded:Wait()
--	local humanoid = character:WaitForChild("Humanoid")
--	local M1 = humanoid:LoadAnimation(script.Animations.M1)
--	local M2 = humanoid:LoadAnimation(script.Animations.M2)
--	local M3 = humanoid:LoadAnimation(script.Animations.M3)
--	local combo = 1
--	local cooldown = false
--	local lastcooldown = false
--	UIS.InputEnded:Connect(function(I, E)
--		if E then return end
--		if I.UserInputType == Enum.UserInputType.MouseButton1 then
--			if cooldown == true then return end
--			if lastcooldown == true then return end
--			spawn(function()
--				cooldown = true
--				script.Stick:Play()
--				task.wait(0.5)
--				cooldown = false
--			end)
--			if combo == 3 then
--				game.ReplicatedStorage.MainEvent:FireServer()
--				M3:play()
--				spawn(function()
--					lastcooldown = true
--					task.wait(1.5)
--					lastcooldown = false
--				end)
--				spawn(function()
--					task.wait(0.1)
--					combo = 1
--				end)
--			elseif combo == 2 then
--				game.ReplicatedStorage.MainEvent:FireServer()
--				M2:play()
--				combo = combo + 1
--			elseif combo == 1 then
--				game.ReplicatedStorage.MainEvent:FireServer()
--				M1:play()
--				combo = combo + 1
--			end
--		end
--	end
--	)
--end


--M.init();

--local player = game.Players.LocalPlayer
--local character = player.Character or player.CharacterAdded:Wait()
--local humanoid = character:WaitForChild("Humanoid")
--local M1 = humanoid:LoadAnimation(script.Animations.M1)
--local M2 = humanoid:LoadAnimation(script.Animations.M2)
--local M3 = humanoid:LoadAnimation(script.Animations.M3)
--local combo = 1
--local cooldown = false
--local lastcooldown = false
--UIS.InputEnded:Connect(function(I,E)
--	if E then return end
--	if I.UserInputType == Enum.UserInputType.MouseButton1 then
--		if cooldown == true then return end
--		if lastcooldown == true then return end
--		spawn(function()
--			cooldown = true
--			script.Stick:Play()
--			task.wait(0.5)
--			cooldown = false
--		end)
--		if combo == 3 then
--			game.ReplicatedStorage.MainEvent:FireServer()
--			M3:play()
--			spawn(function()
--			lastcooldown = true
--			task.wait(1.5)
--			lastcooldown = false
--		end)
--			spawn(function()
--				task.wait(0.1)
--				combo = 1
--			end)
--		elseif combo == 2 then
--			game.ReplicatedStorage.MainEvent:FireServer()
--			M2:play()
--			combo = combo + 1
--		elseif combo == 1 then
--			game.ReplicatedStorage.MainEvent:FireServer()
--			M1:play()
--			combo = combo + 1
--		end
		
--	end
--end)