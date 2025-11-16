-- @ScriptType: Script
game.ReplicatedStorage.MainEvent.OnServerEvent:Connect(function(player)
	spawn(function()
		player.Character.Humanoid.WalkSpeed = 6
		task.wait(0.75)
		player.Character.Humanoid.WalkSpeed = 16
		task.wait(0.25)
	end)
	
	local hitbox = Instance.new("Part") --asdasdasd
	
	hitbox.Parent = workspace
	hitbox.CanCollide = false
	hitbox.Anchored = true
	hitbox.Size = Vector3.new(2,3,2)
	hitbox.BrickColor = BrickColor.new("Really red")
	hitbox.Transparency = 0.5
	hitbox.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1.5)
	game.Debris:AddItem(hitbox,1)
	
	
	
	
	local hitboxcooldown = false
	hitbox.Touched:Connect(function(hit)
		if hit.Parent.Name ~= player.Name and hit.Parent:FindFirstChild("Humanoid") then
			if hitboxcooldown == true then return end
		hitboxcooldown = true 
		
		hit.Parent:FindFirstChild("Humanoid"):TakeDamage(3)
		local vfx = game.ReplicatedStorage.VFX.Attachment:clone()
		vfx.Parent = hit.Parent.HumanoidRootPart
		local sound = script.fistHit:Clone()
		sound.Parent = hit.Parent.HumanoidRootPart
		sound:play()
		game.Debris:AddItem(sound,2)
		spawn(function()
			for i, v in vfx:GetChildren() do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
		end)
		game.Debris:AddItem(vfx,0.5)
		task.wait(2)
		hitboxcooldown = false	
		
		
	end
	end)
	
end)