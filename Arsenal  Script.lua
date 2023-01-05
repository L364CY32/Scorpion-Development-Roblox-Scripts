local function esp()
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
    _G.EnemyColor = Color3.fromRGB(255, 0, 0)
    _G.UseTeamColor = false
    if _G.Reantheajfdfjdgse then
        return
    end
    
    _G.Reantheajfdfjdgse = "susan"
    
    local coregui = game:GetService("CoreGui")
    local players = game:GetService("Players")
    local plr = players.LocalPlayer
    
    local highlights = {}
    
    function esp(target, color)
        pcall(function()
            if target.Character then
                if not highlights[target] then
                    local highlight = Instance.new("Highlight", coregui)
                    highlight.Name = target.Name
                    highlight.Adornee = target.Character
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillColor = color
                    highlights[target] = highlight
                else
                    highlights[target].FillColor = color
                end
            end
        end)
    end
    
    players.PlayerAdded:Connect(function(v)
        v.CharacterAdded:Connect(function()
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end)
    end)
    
    players.PlayerRemoving:Connect(function(v)
        if highlights[v] then
            highlights[v]:Destroy()
            highlights[v] = nil
        end
    end)
    
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
            v.CharacterAdded:Connect(function()
                local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
                esp(v, color)
            end)
            
            esp(v, color)
        end
    end
    
    while task.wait() do
        for i, v in pairs(highlights) do
            local color = _G.UseTeamColor and i.TeamColor.Color or ((plr.TeamColor == i.TeamColor) and _G.FriendColor or _G.EnemyColor)
            v.FillColor = color
        end
    end
end
local function aimbot()
    local teamCheck = true
    local fov = 75
    local smoothing = 0.5
    
    local RunService = game:GetService("RunService")
    
    local FOVring = Drawing.new("Circle")
    FOVring.Visible = true
    FOVring.Thickness = 2
    FOVring.Radius = fov
    FOVring.Transparency = 1
    FOVring.Color = Color3.fromRGB(0, 128, 0)
    FOVring.Position = workspace.CurrentCamera.ViewportSize/2
    
    local function getClosest(cframe)
       local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
       
       local target = nil
       local mag = math.huge
       
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
               local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
               
               if magBuf < mag then
                   mag = magBuf
                   target = v
               end
           end
       end
       
       return target
    end
    
    loop = RunService.RenderStepped:Connect(function()
       local UserInputService = game:GetService("UserInputService")
       local pressed = --[[UserInputService:IsKeyDown(Enum.KeyCode.E)]] UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
       local localPlay = game.Players.localPlayer.Character
       local cam = workspace.CurrentCamera
       local zz = workspace.CurrentCamera.ViewportSize/2
       
       if pressed then
           local Line = Drawing.new("Line")
           local curTar = getClosest(cam.CFrame)
           local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
           ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
           if (ssHeadPoint - zz).Magnitude < fov then
               workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
           end
       end
       
       if UserInputService:IsKeyDown(Enum.KeyCode.P) then
           loop:Disconnect()
           FOVring:Remove()
       end
    end)
    
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Scorpion", HidePremium = false, IntroText = "Scorpion", SaveConfig = false, IntroEnabled = true})

OrionLib:MakeNotification({
	Name = "Scorpion",
	Content = game:GetService("Players").LocalPlayer.Name.." Thank you for using xeScorpionroxus",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Player = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Player:AddButton({
	Name = "ESP",
	Callback = function()
      		esp()
  	end    
})
Player:AddButton({
	Name = "Aimbot (right click)",
	Callback = function()
      		aimbot()
  	end    
})


Player:AddButton({
	Name = "Super weapons",
	Callback = function()
        local replicationstorage = game.ReplicatedStorage

        for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
           if v.Name == "Auto" then
               v.Value = true
           end
           if v.Name == "RecoilControl" then
               v.Value = 0
           end
           if v.Name == "MaxSpread" then
               v.Value = 0
           end
           if v.Name == "ReloadTime" then
              v.Value = 0
           end
           if v.Name == "FireRate" then
               v.Value = 0.05
           end
           if v.Name == "Crit" then
               v.Value = 20
           end
        end
  	end    
})
Player:AddButton({
	Name = "Increase enemey hitbox size",
	Callback = function()
        function getplrsname()
            for i,v in pairs(game:GetChildren()) do
            if v.ClassName == "Players" then
            return v.Name
            end
            end
            end
            local players = getplrsname()
            local plr = game[players].LocalPlayer
            coroutine.resume(coroutine.create(function()
            while  wait(1) do
            coroutine.resume(coroutine.create(function()
            for _,v in pairs(game[players]:GetPlayers()) do
            if v.Name ~= plr.Name and v.Character then
            v.Character.RightUpperLeg.CanCollide = false
            v.Character.RightUpperLeg.Transparency = 10
            v.Character.RightUpperLeg.Size = Vector3.new(13,13,13)
             
            v.Character.LeftUpperLeg.CanCollide = false
            v.Character.LeftUpperLeg.Transparency = 10
            v.Character.LeftUpperLeg.Size = Vector3.new(13,13,13)
             
            v.Character.HeadHB.CanCollide = false
            v.Character.HeadHB.Transparency = 10
            v.Character.HeadHB.Size = Vector3.new(13,13,13)
             
            v.Character.HumanoidRootPart.CanCollide = false
            v.Character.HumanoidRootPart.Transparency = 10
            v.Character.HumanoidRootPart.Size = Vector3.new(13,13,13)
             
            end
            end
            end))
            end
            end))
  	end    
})

local playerfunc = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
playerfunc:AddButton({
	Name = "Infinite Jump",
	Callback = function()
        local Player = game:GetService'Players'.LocalPlayer;
        local UIS = game:GetService'UserInputService';
         
        _G.JumpHeight = 30;
         
        function Action(Object, Function) if Object ~= nil then Function(Object); end end
         
        UIS.InputBegan:connect(function(UserInput)
            if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
                Action(Player.Character.Humanoid, function(self)
                    if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                        Action(self.Parent.HumanoidRootPart, function(self)
                            self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                        end)
                    end
                end)
            end
        end)
  	end    
})

