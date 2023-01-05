getgenv().SpamTeams = true;
getgenv().AutoUnbox = true;
getgenv().SpamWhite = true;
getgenv().AutoFarm = true;
getgenv().AutoFarmGoldBlocks = true;
local Minigun = game.Players.LocalPlayer.Data.MiniGun.Value
local Button = game.Players.LocalPlayer.Data.Button.Value
local Wood = game.Players.LocalPlayer.Data.WoodBlock.Value
local HowCannon = game.Players.LocalPlayer.Data.Cannon.Value
local Brick = game.Players.LocalPlayer.Data.BrickBlock.Value
local gold = game.Players.LocalPlayer.Data.GoldBlock.Value
print(" Player has "..Wood.." wood")
print(" Player has "..HowCannon.." Cannons ")
print (" Player has "..Button.." buttons")
print (" Player has "..Minigun.." Miniguns")
print (" Player has "..Brick.." Bricks")
print (" Player has "..gold.." Bricks")




local plr = game.Players.LocalPlayer
local plrteam = function()
    local team = plr.Team.Name
    if team == "white" then
        return "WhiteZone"
    elseif team == "green" then
        return "CamoZone"
    elseif team == "black" then
        return "BlackZone"
    elseif team == "red" then
        return "Really redZone"
    elseif team == "blue" then
        return "Really blueZone"
    elseif team == "magenta" then
        return "MagentaZone"
    elseif team == "yellow" then
        return "New YellerZone"
    end
end


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "build a boat ", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
getgenv().Cannon = true;
local Tab = Window:MakeTab({
	Name = "Auto build",
	Icon = "rbxassetid://10732694360",
	PremiumOnly = false
})



local Section = Tab:AddSection({
	Name = "Auto build"
})
Tab:AddParagraph("READ ME","Format will be as so:  'build'[how many blocks u need], most will be wood")

Tab:AddParagraph("READ ME","If you get more blocks,Re-execute to fix autobuild")





Tab:AddButton({
	Name = "Buy 50 blocks of wood [250 gold]",
	Callback = function()
local args = {
    [1] = "WoodBlock",
    [2] = 1
}

workspace.ItemBoughtFromShop:InvokeServer(unpack(args))
end
})  





Tab:AddButton({
	Name = "9/11 [1224 wood,18 gold,7 stone]",
	Callback = function()
	    
	    
	    OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Starting To Build...",
	Image = "rbxassetid://4483345998",
	Time = 5
})


getgenv().JDeco = function(json)
	return game:GetService("HttpService"):JSONDecode(json)
end
getgenv().JEnco = function(table)
	return game:GetService("HttpService"):JSONEncode(table)
end
function getcomponents(x)
	if typeof(x) == "CFrame" then
		return {x:components()}
	elseif typeof(x) == "Vector3" then
		return {x.X,x.Y,x.Z}
	end
end
function SetBuild(x)
    local JSON = x
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = JDeco(JSON)
    for i, v in pairs(buildfile.Build) do
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        local args = {
            [1] = v.Name,
            [2] = plr.Data[v.Name].Value,
            [3] = workspace[plrteam()[1]],
            [4] = CFrame.new(unpack(v.Position))*CFrame.fromOrientation(math.rad(v.Orientation[1]),math.rad(v.Orientation[2]),math.rad(v.Orientation[3])),
            [5] = v.Anchored,
            [6] = 1,
            [7] = CFrame.new(unpack(v.OriginCF)),
            [8] = false
        }
        game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer(unpack(args))
    end
    print('--imported--')
end
function GetBuild()
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = {
        Zone = plrteam()[1],
        Side = plrteam()[2],
        Build = {}
    }
    function convert(v)
        if v:FindFirstChild("Tag",true).Value == plr.Name then
            local block = v:FindFirstChild("PPart")
            local side = buildfile.Side
            local pos = block.Position - workspace[buildfile.Zone].Position
            local ori = block.Orientation
            if buildfile.Zone ~= "WhiteZone" then
                pos = {pos.z*side.z,pos.y,pos.x*side.x}
                ori = {ori.z,ori.y+(side.y*3),ori.x}
            else
                pos = {pos.x*side.x,pos.y,pos.z*side.z}
                ori = {ori.x,ori.y,ori.z}
            end
            local prop = {
                Name = v.Name,
                Position = pos,
                Orientation = ori,
                OriginCF = getcomponents(block.CFrame),
                Size = getcomponents(block.Size),
                Anchored = block.Anchored
            }
            table.insert(buildfile.Build,prop)
        end
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Tag",true) ~= nil then
            convert(v)
        elseif v:IsA("Folder") and v.Name == "YourBlocks" then
            for i,c in pairs(v:GetChildren()) do
                if c:IsA("Model") and c:FindFirstChild("Tag",true) ~= nil then
                    convert(c)
                end
            end
        end
    end
    setclipboard(JEnco(buildfile))
end

GetBuild()---coppies the current build you made to your clipboard
SetBuild('{"Build":[{"OriginCF":[-379.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,6.100008010864258,243.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[42,24.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,6.100008010864258,239.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[46,24.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-382.9656677246094,6.100008010864258,239.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[46,24.100000381469728,-54],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,239.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[46,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,6.100008010864258,247.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[38,24.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,247.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[38,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,241.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[44,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,6.100008010864258,249.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[36,24.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,251.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[34,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-376.9656677246094,4.100008010864258,247.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[38,22.100000381469728,-48],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,6.100008010864258,245.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[40,24.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-384.9656677246094,4.100008010864258,247.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[38,22.100000381469728,-56],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,245.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[40,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,249.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[36,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,5.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,23.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,243.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[42,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-11.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,6.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-3.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,14.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-5.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,12.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-7.899991989135742,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,10.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-11.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,6.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,4.100008010864258,247.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[38,22.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,6.100008010864258,239.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[46,24.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-382.9656677246094,4.100008010864258,247.89315795898438,0,0,1,0,1,-0,-1,0,0],"Name":"GoldBlock","Position":[38,22.100000381469728,-54],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,263.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[22,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,273.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[12,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,265.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[20,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,271.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[14,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[16,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[18,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-9.899991989135743,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,8.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,-9.899991989135743,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,8.100000381469727,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,10.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,28.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,16.100008010864259,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,34.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,12.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,30.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,12.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,30.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,12.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,30.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,10.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,28.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,6.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,24.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,10.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,28.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,8.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,26.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,8.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,26.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,8.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,26.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,2.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,20.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,6.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,24.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,6.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,24.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,4.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,22.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,4.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,22.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,2.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,20.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,2.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,20.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,16.100008010864259,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,34.099998474121097,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,14.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,32.099998474121097,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,0.10000801086425781,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,18.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-1.8999919891357422,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,16.100000381469728,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,14.100008010864258,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,32.099998474121097,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-3.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,14.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-5.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,12.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,295.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-10,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-385.9656677246094,14.100008010864258,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,32.099998474121097,-57],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-9.899991989135743,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,8.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,289.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,291.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-373.9656677246094,-7.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,10.100000381469727,-45],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,287.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-2,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-383.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-55],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-378.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-50],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-382.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-54],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-380.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-52],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-382.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-54],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-382.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-54],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-382.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-54],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,0.10000801086425781,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,18.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-376.9656677246094,14.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,32.099998474121097,-48],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,12.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,30.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,10.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,28.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,8.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,26.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,6.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,24.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-376.9656677246094,2.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,20.100000381469728,-48],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,4.100008010864258,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,22.100000381469728,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-1.8999919891357422,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,16.100000381469728,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-3.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,14.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-375.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-47],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-7.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,10.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-381.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-53],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-379.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-51],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-377.9656677246094,-5.899991989135742,285.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-0,12.100000381469727,-49],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-364.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[16,6.100000381469727,-36],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-362.9656677246094,-11.899991989135743,269.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[16,6.100000381469727,-34],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-362.9656677246094,-11.899991989135743,267.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[18,6.100000381469727,-34],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-365.9656677246094,-11.899991989135743,284.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[1,6.100000381469727,-37],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-363.9656677246094,-11.899991989135743,282.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[3,6.100000381469727,-35],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-365.9656677246094,-11.899991989135743,293.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[-8,6.100000381469727,-37],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-372.9656677246094,-11.899991989135743,299.8931579589844,0,0,1,0,1,-0,-1,0,0],"Name":"StoneBlock","Position":[-14,6.100000381469727,-44],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]}],"Side":null,"Zone":"CamoZone"}')--paste in the fucntion the copied build from your clipboard





OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done Building...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local UsedGold = game.Players.LocalPlayer.Data.GoldBlock.Used.Value
local UsedWood = game.Players.LocalPlayer.Data.WoodBlock.Used.Value
print(UsedWood)
local UsedStone = game.Players.LocalPlayer.Data.StoneBlock.Used.Value
print(UsedStone)


OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedGold.." gold blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedWood.." wood blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedStone.." stone blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})

end
}) 


Tab:AddButton({
	Name = "Gold kys [35 gold blocks]",
	Callback = function()
getgenv().JDeco = function(json)
	return game:GetService("HttpService"):JSONDecode(json)
end
getgenv().JEnco = function(table)
	return game:GetService("HttpService"):JSONEncode(table)
end
function getcomponents(x)
	if typeof(x) == "CFrame" then
		return {x:components()}
	elseif typeof(x) == "Vector3" then
		return {x.X,x.Y,x.Z}
	end
end
function SetBuild(x)
    local JSON = x
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = JDeco(JSON)
    for i, v in pairs(buildfile.Build) do
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        local args = {
            [1] = v.Name,
            [2] = plr.Data[v.Name].Value,
            [3] = workspace[plrteam()[1]],
            [4] = CFrame.new(unpack(v.Position))*CFrame.fromOrientation(math.rad(v.Orientation[1]),math.rad(v.Orientation[2]),math.rad(v.Orientation[3])),
            [5] = v.Anchored,
            [6] = 1,
            [7] = CFrame.new(unpack(v.OriginCF)),
            [8] = false
        }
        game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer(unpack(args))
    end
    print('--imported--')
end
function GetBuild()
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = {
        Zone = plrteam()[1],
        Side = plrteam()[2],
        Build = {}
    }
    function convert(v)
        if v:FindFirstChild("Tag",true).Value == plr.Name then
            local block = v:FindFirstChild("PPart")
            local side = buildfile.Side
            local pos = block.Position - workspace[buildfile.Zone].Position
            local ori = block.Orientation
            if buildfile.Zone ~= "WhiteZone" then
                pos = {pos.z*side.z,pos.y,pos.x*side.x}
                ori = {ori.z,ori.y+(side.y*3),ori.x}
            else
                pos = {pos.x*side.x,pos.y,pos.z*side.z}
                ori = {ori.x,ori.y,ori.z}
            end
            local prop = {
                Name = v.Name,
                Position = pos,
                Orientation = ori,
                OriginCF = getcomponents(block.CFrame),
                Size = getcomponents(block.Size),
                Anchored = block.Anchored
            }
            table.insert(buildfile.Build,prop)
        end
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Tag",true) ~= nil then
            convert(v)
        elseif v:IsA("Folder") and v.Name == "YourBlocks" then
            for i,c in pairs(v:GetChildren()) do
                if c:IsA("Model") and c:FindFirstChild("Tag",true) ~= nil then
                    convert(c)
                end
            end
        end
    end
    setclipboard(JEnco(buildfile))
end

GetBuild()---coppies the current build you made to your clipboard
SetBuild('{"Build":[{"OriginCF":[77.83432006835938,-0.8999919891357422,-84.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-16,17.100000381469728,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-7.899991989135742,-66.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[2,10.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-4.899991989135742,-82.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-14,13.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-7.899991989135742,-81.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-13,10.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-0.8999919891357422,-76.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-8,17.100000381469728,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-3.899991989135742,-64.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[4,14.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-7.899991989135742,-68.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[0,10.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-2.899991989135742,-83.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-15,15.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-10.899991989135743,-93.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-25,7.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-3.899991989135742,-62.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[6,14.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-5.899991989135742,-80.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-12,12.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-3.899991989135742,-66.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[2,14.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-11.899991989135743,-98.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-30,6.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-9.899991989135743,-98.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-30,8.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-3.899991989135742,-68.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[0,14.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-7.899991989135742,-64.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[4,10.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-11.899991989135743,-66.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[2,6.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-5.899991989135742,-70.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-2,12.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-11.899991989135743,-92.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-24,6.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-9.899991989135743,-62.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[6,8.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-11.899991989135743,-68.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[0,6.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-9.899991989135743,-82.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-14,8.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-11.899991989135743,-83.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-15,6.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-7.899991989135742,-96.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-28,10.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-4.899991989135742,-93.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-25,13.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-11.899991989135743,-70.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-2,6.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-2.899991989135742,-92.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-24,15.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-1.8999919891357422,-78.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-10,16.100000381469728,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[78.83432006835938,-11.899991989135743,-64.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[4,6.100000381469727,143],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-8.899991989135743,-94.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-26,9.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-5.899991989135742,-98.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-30,12.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-3.899991989135742,-98.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-30,14.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-6.899991989135742,-94.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-26,11.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-7.899991989135742,-98.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-30,10.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[77.83432006835938,-3.899991989135742,-79.706787109375,0,0,-1,0,1,0,1,0,0],"Name":"GoldBlock","Position":[-11,14.100000381469727,144],"Orientation":[0,-360,0],"Anchored":true,"Size":[2,2,2]}],"Side":null,"Zone":"Really redZone"}')--paste in the fucntion the copied build from your clipboard

OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done Building...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local UsedGold = game.Players.LocalPlayer.Data.GoldBlock.Used.Value
print(UsedWood)

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedGold.." gold blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})


end
})  





Tab:AddButton({
	Name = "Kys [33 wood]",
	Callback = function()
getgenv().JDeco = function(json)
	return game:GetService("HttpService"):JSONDecode(json)
end
getgenv().JEnco = function(table)
	return game:GetService("HttpService"):JSONEncode(table)
end
function getcomponents(x)
	if typeof(x) == "CFrame" then
		return {x:components()}
	elseif typeof(x) == "Vector3" then
		return {x.X,x.Y,x.Z}
	end
end
function SetBuild(x)
    local JSON = x
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = JDeco(JSON)
    for i, v in pairs(buildfile.Build) do
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        local args = {
            [1] = v.Name,
            [2] = plr.Data[v.Name].Value,
            [3] = workspace[plrteam()[1]],
            [4] = CFrame.new(unpack(v.Position))*CFrame.fromOrientation(math.rad(v.Orientation[1]),math.rad(v.Orientation[2]),math.rad(v.Orientation[3])),
            [5] = v.Anchored,
            [6] = 1,
            [7] = CFrame.new(unpack(v.OriginCF)),
            [8] = false
        }
        game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer(unpack(args))
    end
    print('--imported--')
end
function GetBuild()
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = {
        Zone = plrteam()[1],
        Side = plrteam()[2],
        Build = {}
    }
    function convert(v)
        if v:FindFirstChild("Tag",true).Value == plr.Name then
            local block = v:FindFirstChild("PPart")
            local side = buildfile.Side
            local pos = block.Position - workspace[buildfile.Zone].Position
            local ori = block.Orientation
            if buildfile.Zone ~= "WhiteZone" then
                pos = {pos.z*side.z,pos.y,pos.x*side.x}
                ori = {ori.z,ori.y+(side.y*3),ori.x}
            else
                pos = {pos.x*side.x,pos.y,pos.z*side.z}
                ori = {ori.x,ori.y,ori.z}
            end
            local prop = {
                Name = v.Name,
                Position = pos,
                Orientation = ori,
                OriginCF = getcomponents(block.CFrame),
                Size = getcomponents(block.Size),
                Anchored = block.Anchored
            }
            table.insert(buildfile.Build,prop)
        end
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Tag",true) ~= nil then
            convert(v)
        elseif v:IsA("Folder") and v.Name == "YourBlocks" then
            for i,c in pairs(v:GetChildren()) do
                if c:IsA("Model") and c:FindFirstChild("Tag",true) ~= nil then
                    convert(c)
                end
            end
        end
    end
    setclipboard(JEnco(buildfile))
end

GetBuild()---coppies the current build you made to your clipboard
SetBuild('{"Build":[{"OriginCF":[-191.96566772460938,-7.899991989135742,-66.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-6,10.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-5.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,12.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-1.8999919891357422,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,16.100000381469728,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-5.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,12.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-7.899991989135742,-47.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-25,10.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-5.899991989135742,-47.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-25,12.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-1.8999919891357422,-47.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-25,16.100000381469728,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-3.899991989135742,-61.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-11,14.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-3.899991989135742,-75.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[3,14.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-3.899991989135742,-47.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-25,14.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-11.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,6.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-9.899991989135743,-47.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-25,8.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-9.899991989135743,-65.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-7,8.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-7.899991989135742,-52.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-20,10.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-1.8999919891357422,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,16.100000381469728,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-9.899991989135743,-53.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-19,8.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-11.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,6.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-6.899991989135742,-49.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-23,11.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-3.899991989135742,-68.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-4,14.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-5.899991989135742,-75.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[3,12.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-5.899991989135742,-67.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-5,12.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-11.899991989135743,-75.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[3,6.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-1.8999919891357422,-53.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-19,16.100000381469728,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-5.899991989135742,-51.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-21,12.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-7.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,10.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-4.899991989135742,-63.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-9,13.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-11.899991989135743,-64.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,6.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-9.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,8.100000381469727,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-11.899991989135743,-54.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-18,6.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-6.899991989135742,-64.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-8,11.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-11.899991989135743,-47.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-25,6.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-190.96566772460938,-1.8999919891357422,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,16.100000381469728,138],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-191.96566772460938,-3.899991989135742,-52.106849670410159,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[-20,14.100000381469727,137],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]}],"Side":null,"Zone":"BlackZone"}')--paste in the fucntion the copied build from your clipboard


OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done Building...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local UsedWood = game.Players.LocalPlayer.Data.WoodBlock.Used.Value
print(UsedWood)

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedWood.." Wood blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})

end
})  




Tab:AddButton({
	Name = "massive penis [349 wood]",
	Callback = function()
getgenv().JDeco = function(json)
	return game:GetService("HttpService"):JSONDecode(json)
end
getgenv().JEnco = function(table)
	return game:GetService("HttpService"):JSONEncode(table)
end
function getcomponents(x)
	if typeof(x) == "CFrame" then
		return {x:components()}
	elseif typeof(x) == "Vector3" then
		return {x.X,x.Y,x.Z}
	end
end
function SetBuild(x)
    local JSON = x
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = JDeco(JSON)
    for i, v in pairs(buildfile.Build) do
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        local args = {
            [1] = v.Name,
            [2] = plr.Data[v.Name].Value,
            [3] = workspace[plrteam()[1]],
            [4] = CFrame.new(unpack(v.Position))*CFrame.fromOrientation(math.rad(v.Orientation[1]),math.rad(v.Orientation[2]),math.rad(v.Orientation[3])),
            [5] = v.Anchored,
            [6] = 1,
            [7] = CFrame.new(unpack(v.OriginCF)),
            [8] = false
        }
        game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer(unpack(args))
    end
    print('--imported--')
end
function GetBuild()
    local v3 = Vector3.new
    local plr = game:GetService("Players").LocalPlayer
    local plrteam = function()
        local team = plr.Team.Name
        if team == "white" then-- -1
            return {"WhiteZone",v3(1,1,1)}
        elseif team == "green" then---0
            return {"CamoZone",v3(1,90,-1)}
        elseif team == "black" then--0
            return {"BlackZone",v3(1,90,-1)}
        elseif team == "yellow" then--0
            return {"New YellerZone",v3(1,90,-1)}
        elseif team == "red" then--1
            return {"Really redZone",v3(-1,-90,1)}
        elseif team == "blue" then--1
            return {"Really blueZone",v3(-1,-90,1)}
        elseif team == "magenta" then--1
            return {"MagentaZone",v3(-1,-90,1)}
        end
    end
    local buildfile = {
        Zone = plrteam()[1],
        Side = plrteam()[2],
        Build = {}
    }
    function convert(v)
        if v:FindFirstChild("Tag",true).Value == plr.Name then
            local block = v:FindFirstChild("PPart")
            local side = buildfile.Side
            local pos = block.Position - workspace[buildfile.Zone].Position
            local ori = block.Orientation
            if buildfile.Zone ~= "WhiteZone" then
                pos = {pos.z*side.z,pos.y,pos.x*side.x}
                ori = {ori.z,ori.y+(side.y*3),ori.x}
            else
                pos = {pos.x*side.x,pos.y,pos.z*side.z}
                ori = {ori.x,ori.y,ori.z}
            end
            local prop = {
                Name = v.Name,
                Position = pos,
                Orientation = ori,
                OriginCF = getcomponents(block.CFrame),
                Size = getcomponents(block.Size),
                Anchored = block.Anchored
            }
            table.insert(buildfile.Build,prop)
        end
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Tag",true) ~= nil then
            convert(v)
        elseif v:IsA("Folder") and v.Name == "YourBlocks" then
            for i,c in pairs(v:GetChildren()) do
                if c:IsA("Model") and c:FindFirstChild("Tag",true) ~= nil then
                    convert(c)
                end
            end
        end
    end
    setclipboard(JEnco(buildfile))
end

GetBuild()---coppies the current build you made to your clipboard
SetBuild('{"Build":[{"OriginCF":[-256.9656677246094,10.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,28.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,14.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,32.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,14.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,32.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-3.899991989135742,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,14.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,16.100008010864259,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,34.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,16.100008010864259,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,34.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,4.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,22.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-3.899991989135742,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,14.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,0.10000801086425781,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,18.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,14.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,32.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,8.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,26.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,16.100008010864259,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,34.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,14.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,32.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,16.100008010864259,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,34.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,0.10000801086425781,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,18.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-95.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[23,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-97.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[25,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-99.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[27,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-101.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[29,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-1.8999919891357422,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,16.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,0.10000801086425781,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,18.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,2.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,20.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,4.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,22.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,6.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,24.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,8.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,26.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,10.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,28.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,12.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,30.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-3.899991989135742,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,14.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-1.8999919891357422,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,16.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,0.10000801086425781,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,18.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,2.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,20.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,4.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,22.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,6.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,24.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,8.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,26.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,10.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,28.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,12.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,30.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-3.899991989135742,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,14.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-1.8999919891357422,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,16.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,0.10000801086425781,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,18.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,2.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,20.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,4.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,22.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,6.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,24.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,8.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,26.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,10.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,28.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,12.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,30.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-3.899991989135742,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,14.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-1.8999919891357422,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,16.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,0.10000801086425781,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,18.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,2.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,20.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,4.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,22.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,6.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,24.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,8.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,26.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,10.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,28.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,12.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,30.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-3.899991989135742,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,14.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-1.8999919891357422,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,16.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,0.10000801086425781,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,18.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,2.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,20.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,4.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,22.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,6.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,24.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,8.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,26.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,10.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,28.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,12.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,30.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-3.899991989135742,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,14.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-1.8999919891357422,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,16.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,2.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,20.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,4.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,22.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,6.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,24.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,8.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,26.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,10.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,28.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,12.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,30.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-1.8999919891357422,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,16.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,0.10000801086425781,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,18.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,2.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,20.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,6.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,24.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,8.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,26.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,10.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,28.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,12.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,30.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-3.899991989135742,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,14.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-1.8999919891357422,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,16.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,0.10000801086425781,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,18.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,2.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,20.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,4.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,22.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,6.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,24.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,8.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,26.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,10.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,28.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,12.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,30.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-3.899991989135742,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,14.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-3.899991989135742,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,14.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-1.8999919891357422,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,16.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,0.10000801086425781,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,18.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,2.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,20.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,4.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,22.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,6.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,24.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,8.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,26.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,10.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,28.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,12.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,30.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-3.899991989135742,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,14.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-1.8999919891357422,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,16.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,0.10000801086425781,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,18.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,2.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,20.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,4.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,22.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,6.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,24.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,8.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,26.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,10.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,28.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,12.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,30.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-3.899991989135742,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,14.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-1.8999919891357422,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,16.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,0.10000801086425781,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,18.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,2.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,20.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,4.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,22.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,6.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,24.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,8.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,26.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,10.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,28.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,12.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,30.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-3.899991989135742,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,14.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-1.8999919891357422,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,16.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,0.10000801086425781,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,18.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,2.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,20.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,4.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,22.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,6.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,24.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,8.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,26.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,10.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,28.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,12.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,30.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-3.899991989135742,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,14.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-1.8999919891357422,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,16.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,0.10000801086425781,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,18.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,2.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,20.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,4.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,22.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,6.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,24.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,8.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,26.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,10.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,28.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,12.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,30.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-3.899991989135742,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,14.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-1.8999919891357422,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,16.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,0.10000801086425781,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,18.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,2.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,20.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,4.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,22.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,6.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,24.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,8.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,26.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,10.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,28.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,12.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,30.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-3.899991989135742,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,14.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-1.8999919891357422,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,16.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,2.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,20.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,4.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,22.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,6.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,24.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,8.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,26.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,10.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,28.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,12.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,30.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-3.899991989135742,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,14.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-1.8999919891357422,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,16.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,0.10000801086425781,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,18.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,2.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,20.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,4.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,22.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,6.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,24.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,10.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,28.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,12.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,30.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-3.899991989135742,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,14.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-1.8999919891357422,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,16.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,0.10000801086425781,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,18.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,2.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,20.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,4.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,22.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,6.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,24.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,8.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,26.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,12.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,30.100000381469728,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-3.899991989135742,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,14.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-1.8999919891357422,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,16.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,0.10000801086425781,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,18.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,2.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,20.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,4.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,22.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,6.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,24.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,8.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,26.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,10.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,28.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,12.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,30.100000381469728,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-3.899991989135742,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,14.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-1.8999919891357422,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,16.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,0.10000801086425781,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,18.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,2.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,20.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,4.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,22.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,6.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,24.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,8.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,26.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,10.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,28.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,12.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,30.100000381469728,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-3.899991989135742,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,14.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-1.8999919891357422,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,16.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,0.10000801086425781,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,18.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,2.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,20.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,4.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,22.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,6.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,24.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,8.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,26.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,10.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,28.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,12.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,30.100000381469728,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-83.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[11,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-81.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[9,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-11.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,6.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-5.899991989135742,-79.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[7,12.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-11.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,6.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-9.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,8.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-7.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,10.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,-5.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,12.100000381469727,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-11.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,6.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-9.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,8.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-7.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,10.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,-5.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,12.100000381469727,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-9.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,8.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-7.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,10.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,-5.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,12.100000381469727,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-11.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,6.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-9.899991989135743,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,8.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,-7.899991989135742,-77.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[5,10.100000381469727,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,14.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,32.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,14.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,32.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,14.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,32.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,14.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,32.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,14.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,32.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,14.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,32.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,14.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,32.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,14.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,32.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,14.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,32.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,14.100008010864258,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,32.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,14.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,32.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,14.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,32.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,14.100008010864258,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,32.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,14.100008010864258,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,32.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,14.100008010864258,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,32.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,14.100008010864258,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,32.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,16.100008010864259,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,34.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,16.100008010864259,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,34.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,16.100008010864259,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,34.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-256.9656677246094,16.100008010864259,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,34.099998474121097,72],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,16.100008010864259,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,34.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,16.100008010864259,-85.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[13,34.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,16.100008010864259,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,34.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,16.100008010864259,-87.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[15,34.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,16.100008010864259,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,34.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,16.100008010864259,-89.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[17,34.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,16.100008010864259,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,34.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,16.100008010864259,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,34.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,16.100008010864259,-91.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[19,34.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-254.96566772460938,16.100008010864259,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,34.099998474121097,74],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-252.96566772460938,16.100008010864259,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,34.099998474121097,76],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]},{"OriginCF":[-250.96566772460938,16.100008010864259,-93.10684967041016,0,0,1,0,1,-0,-1,0,0],"Name":"WoodBlock","Position":[21,34.099998474121097,78],"Orientation":[0,360,0],"Anchored":true,"Size":[2,2,2]}],"Side":null,"Zone":"BlackZone"}')--paste in the fucntion the copied build from your clipboard


OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done Building...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local UsedWood = game.Players.LocalPlayer.Data.WoodBlock.Used.Value
print(UsedWood)

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedWood.." Wood blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})

end
})  





Tab:AddButton({
	Name = "penis [309 wood]",
	Callback = function()
NUT1()

end
})  







Tab:AddButton({
	Name = "small penis [5 wood]",
	Callback = function()
	    OrionLib:MakeNotification({
	Name = "ALERT",
	Content = "Keep build tool out",
	Image = "rbxassetid://4483345998",
	Time = 5
})
OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Starting To Build...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

	     local lp = game:GetService("Players").LocalPlayer
        local Backpack = game.Players.LocalPlayer.Backpack
        local chara = game.Players.LocalPlayer.Character
        local origin = chara.HumanoidRootPart.CFrame
        
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        wait(0.2)
            local Tool = "BuildingTool" 
            chara.Humanoid:EquipTool(Backpack[Tool])
   
   
   
    
    
    wait(0.3)
    
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 6.100000381469727, 45) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-283.9656677246094, -11.899991989135742, -97.10684967041016) * CFrame.Angles(0, 1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 6.100000381469727, 45) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-283.9656677246094, -11.899991989135742, -93.10684967041016) * CFrame.Angles(0, 1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 8.100000381469727, 45) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-283.9656677246094, -11.899991989135742, -95.10684967041016) * CFrame.Angles(0, 1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 10.100000381469727, 45) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-283.9656677246094, -11.899991989135742, -95.10684967041016) * CFrame.Angles(0, 1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 12.100000381469727, 45) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-283.9656677246094, -11.899991989135742, -95.10684967041016) * CFrame.Angles(0, 1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 14.100000381469727, 45) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-283.9656677246094, -11.899991989135742, -95.10684967041016) * CFrame.Angles(0, 1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done Building...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end;

end
})  





function NUT1()

OrionLib:MakeNotification({
	Name = "ALERT",
	Content = "Keep the build tool out",
	Image = "rbxassetid://4483345998",
	Time = 5
})


    OrionLib:MakeNotification({
	Name = "Progress",
	Content = "starting to build...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

    local lp = game:GetService("Players").LocalPlayer
        local Backpack = game.Players.LocalPlayer.Backpack
        local chara = game.Players.LocalPlayer.Character
        local origin = chara.HumanoidRootPart.CFrame
        
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        wait(0.2)
            local Tool = "BuildingTool" -- Tool name in your backpack.
            chara.Humanoid:EquipTool(Backpack[Tool])
   
   
   
    
    
    wait(0.3)
    local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))




-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -9.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -9.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -9.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


--------------------------------------------

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
--------------------------------------------------------------------------------------



-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-------------------------------------------------------------------------------------------------------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------------------------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))



local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------



-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))




-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
----------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-----------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(23, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-30.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-------------------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(25, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-28.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(27, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-26.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-------------------------------------

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))



----------------------------------

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
----------------------------------


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(29, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-24.565689086914062, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

Shaft()
end

function Shaft()
    local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 14.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 16.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 18.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 20.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 22.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 24.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 26.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 28.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 30.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 14.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 16.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 18.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 20.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 22.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 24.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 26.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 28.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 30.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 14.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 16.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 18.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 20.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 22.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 24.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 26.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 28.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 30.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 14.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 16.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 18.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 20.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 22.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 24.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 26.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 28.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(21, 30.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 14.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 16.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 18.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 20.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 22.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 24.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 26.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 28.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 30.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 14.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 16.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 18.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 20.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 22.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 24.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 26.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 28.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 30.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 14.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 16.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 18.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 20.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 22.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 24.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 26.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 28.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 30.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 14.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 16.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 18.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 20.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 22.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 24.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 26.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 28.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 30.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(19, 14.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 14.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 16.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 18.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 20.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 22.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 24.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 26.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 28.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 30.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 14.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 16.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 18.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 20.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 22.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 24.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 26.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 28.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 30.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 14.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 16.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 18.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 20.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 22.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 24.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 26.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 28.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 30.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 14.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 16.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 18.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 20.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 22.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 24.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 26.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 28.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(17, 30.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 14.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 16.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 18.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 20.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 22.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 24.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 26.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 28.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 30.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 14.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 16.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 18.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 20.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 22.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 24.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 26.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 28.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 30.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 14.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 16.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 18.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 20.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 22.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 24.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 26.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 28.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 30.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 14.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 16.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 18.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 20.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 22.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 24.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 26.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 28.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(15, 30.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 14.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 16.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 18.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 20.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 22.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 24.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 26.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 28.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 30.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 14.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 16.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 18.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 20.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 22.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 24.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 26.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 28.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 30.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 14.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 16.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 18.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 20.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 22.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 24.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 26.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 28.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 30.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 14.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 16.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 18.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 20.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 22.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 24.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 26.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 28.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(13, 30.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-32.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
-----------


Nut2()
end

function Nut2()
    local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
----------
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------------------
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-42.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
------------------------------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(9, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-44.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-46.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 6.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 8.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 10.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 12.100000381469727, 72) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -273.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 6.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 8.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 10.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 12.100000381469727, 74) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -271.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 6.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 8.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 10.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 12.100000381469727, 76) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -269.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 6.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 8.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 10.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(5, 12.100000381469727, 78) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-48.56568908691406, -11.899991989135742, -267.5068664550781) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
--END
OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Finished Building!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
local UsedWood = game.Players.LocalPlayer.Data.WoodBlock.Used.Value
print(UsedWood)

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedWood.." Wood blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 

end

Tab:AddButton({
	Name = "Build my name [31 wood]",
	Callback = function()
Jude()

end
})  


Tab:AddButton({
	Name = "Op cannon [50 cannons]",
	Callback = function()
	        local lp = game:GetService("Players").LocalPlayer
        local Backpack = game.Players.LocalPlayer.Backpack
        local chara = game.Players.LocalPlayer.Character
        local origin = chara.HumanoidRootPart.CFrame
        
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        wait(0.2)
            local Tool = "BuildingTool" -- Tool name in your backpack.
            chara.Humanoid:EquipTool(Backpack[Tool])
   
   
   
    
    
    wait()
	    
Cannon()
end
})  









function Cannon()
for i = 1,50 do
local args = {
    [1] = "Cannon",
    [2] = HowCannon,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 6.500000953674316, 76) * CFrame.Angles(0, 1.5707963705062866, 0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-252.96566772460938, -11.499991416931152, 274.8931579589844) * CFrame.Angles(-3.1415927410125732, -4.371138828673793e-08, -3.1415927410125732),
    [8] = false
    }
    

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


end
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "Button",
    [2] = Button,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 5.5, 68) * CFrame.Angles(-1.5707963705062866, 1.5707963705062866, 0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-260.9656677246094, -12.499992370605469, 278.8931579589844) * CFrame.Angles(-3.1415927410125732, 0, 1.5707963705062866),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done building",
	Image = "rbxassetid://4483345998",
	Time = 5
})

end


Tab:AddButton({
	Name = "Server lagger [recommend 300 miniguns]",
	Callback = function()
	     local lp = game:GetService("Players").LocalPlayer
        local Backpack = game.Players.LocalPlayer.Backpack
        local chara = game.Players.LocalPlayer.Character
        local origin = chara.HumanoidRootPart.CFrame
        
        OrionLib:MakeNotification({
	Name = "Warning",
	Content = "takes a while to build,wait for the progress notification",
	Image = "rbxassetid://4483345998",
	Time = 5
})
        
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        wait(0.2)
            local Tool = "BuildingTool" -- Tool name in your backpack.
            chara.Humanoid:EquipTool(Backpack[Tool])
            
      		MiniGun()
  	end    
})

function MiniGun()
    for i = 1,300 do
local args = {
    [1] = "MiniGun",
    [2] = Minigun,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(11, 6.500000953674316, 76) * CFrame.Angles(0, 1.5707963705062866, 0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-252.96566772460938, -11.499991416931152, 274.8931579589844) * CFrame.Angles(-3.1415927410125732, -4.371138828673793e-08, -3.1415927410125732),
    [8] = false
    }
    

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


end

local args = {
    [1] = "Button",
    [2] = Button,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(7, 5.5, 68) * CFrame.Angles(-1.5707963705062866, 1.5707963705062866, 0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-260.9656677246094, -12.499992370605469, 278.8931579589844) * CFrame.Angles(-3.1415927410125732, 0, 1.5707963705062866),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Done building",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:MakeNotification({
	Name = "How to use",
	Content = "shoot at person you want to lag",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end

Tab:AddButton({
	Name = "Tiddies [16 wood][2 bricks]",
	Callback = function()
	             OrionLib:MakeNotification({
	Name =  "WARNING",
	Content = "Dont unequip build tool",
	Image = "rbxassetid://4483345998",
	Time = 5
})

        OrionLib:MakeNotification({
	Name =  "progress...",
	Content = "Starting to build..",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	     local lp = game:GetService("Players").LocalPlayer
        local Backpack = game.Players.LocalPlayer.Backpack
        local chara = game.Players.LocalPlayer.Character
        local origin = chara.HumanoidRootPart.CFrame
	     
	     for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        wait(0.2)
            local Tool = "BuildingTool" -- Tool name in your backpack.
            chara.Humanoid:EquipTool(Backpack[Tool])
            wait(0.2)
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(53, 6.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 342.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(53, 8.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 342.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(53, 10.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 342.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(51, 6.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 340.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "BrickBlock",
    [2] = Brick,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(51, 8.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 340.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(51, 10.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 340.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(49, 6.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 338.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(49, 8.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 338.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(49, 10.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 338.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

---------------------------
--2nd tiddie

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(45, 6.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 342.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(45, 8.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 342.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(45, 10.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 342.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(43, 6.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 340.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "BrickBlock",
    [2] = Brick,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(43, 8.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 340.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(43, 10.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 340.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(41, 6.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 338.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(41, 8.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 338.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace:FindFirstChild(plrteam()),
    [4] = CFrame.new(41, 10.100000381469727, 135) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(86.83432006835938, -11.899991989135742, 338.4931945800781) * CFrame.Angles(-0, -1.5707963705062866, 0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


	     for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        OrionLib:MakeNotification({
	Name =  "progress...",
	Content = "Done building",
	Image = "rbxassetid://4483345998",
	Time = 5
})
        




  	end    
})






local Tab = Window:MakeTab({
	Name = "autofarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
	})
	
Tab:AddToggle({
	Name = "AutoFarm Gold",
	Default = (bool),
	Callback = function(bool)
		getgenv().AutoFarm = bool
		print(bool)
		if bool then
		AutoFarm()
		end
	end    
    
})

Tab:AddToggle({
	Name = "AutoFarm Gold Blocks",
	Default = (bool),
	Callback = function(bool)
		getgenv().AutoFarmGoldBlocks = bool
		print(bool)
		if bool then
		AutoFarmGoldBlocks()
		end
	end    
    
})

Tab:AddToggle({
	Name = "Auto Unbox COMMON chest ",
	Default = (bool),
	Callback = function(bool)
		getgenv().AutoUnbox = bool
		print(bool)
		if bool then
		AutoUnbox()
		end
	end    
    
})


function AutoFarm()
while getgenv().AutoFarm == true do
        local plr = game.Players.LocalPlayer
        local chara = plr.Character
        game.Workspace.Gravity = 0
      chara.HumanoidRootPart.CFrame = CFrame.new(-17.2441807, 22.4234791, 1359.83765, -0.850307524, -5.10061016e-09, 0.526286185, 1.99975903e-09, 1, 1.29226656e-08, -0.526286185, 1.20406858e-08, -0.850307524)
        wait(0.3)
chara.HumanoidRootPart.CFrame = CFrame.new(-50.8950272, 20.9255829, 2137.91357, -0.972867966, -3.05006544e-08, 0.231361046, -4.01606641e-08, 1, -3.70432751e-08, -0.231361046, -4.53298306e-08, -0.972867966)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-45.670414, 25.2458458, 2909.57153, -0.90480876, 1.30821309e-09, 0.425818175, 1.16460681e-08, 1, 2.16741594e-08, -0.425818175, 2.45700775e-08, -0.90480876)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-10.4901314, 37.6174622, 3677.06201, -0.978968859, -1.65246083e-09, -0.204009622, -7.44443229e-10, 1, -4.52760052e-09, 0.204009622, -4.28050617e-09, -0.978968859)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-50.9394913, 30.8854847, 4449.0708, -0.989130974, -1.93212415e-08, -0.147037312, -1.73598913e-08, 1, -1.4622386e-08, 0.147037312, -1.19109025e-08, -0.989130974)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-19.1005783, 60.6625443, 5219.69629, -0.963262498, -9.87095916e-08, 0.268561721, -7.70254331e-08, 1, 9.12784088e-08, -0.268561721, 6.72389859e-08, -0.963262498)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-48.4247093, 11.0636272, 5987.90479, -0.994051278, -2.96921119e-08, -0.108913146, -3.38420065e-08, 1, 3.62543666e-08, 0.108913146, 3.97245365e-08, -0.994051278)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-76.6527023, 38.4256821, 6760.96338, -0.989316583, 1.66555469e-09, -0.145783082, 3.0631635e-09, 1, -9.36242817e-09, 0.145783082, -9.70896341e-09, -0.989316583)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-63.3461571, 40.3512268, 7527.07178, -0.99008441, -6.27901358e-08, -0.140473634, -4.77132645e-08, 1, -1.10696767e-07, 0.140473634, -1.02896685e-07, -0.99008441)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-39.4213638, 43.9060669, 8296.41406, 0.817950964, 2.95945046e-08, -0.575287938, -7.49957891e-08, 1, -5.51869235e-08, 0.575287938, 8.82843736e-08, 0.817950964)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-56.1324272, -359.141205, 9490.19336, -0.999418378, 0.0338956974, 0.0037424101, 0.033853177, 0.999367416, -0.0108940192, -0.004109303, -0.0107609909, -0.99993366)
game.Workspace.Gravity = 196.2
wait(19)
end
end

function AutoFarmGoldBlocks()
while getgenv().AutoFarmGoldBlocks == true do
        local plr = game.Players.LocalPlayer
        local chara = plr.Character
                game.Workspace.Gravity = 0
        chara.HumanoidRootPart.CFrame = CFrame.new(-17.2441807, 22.4234791, 1359.83765, -0.850307524, -5.10061016e-09, 0.526286185, 1.99975903e-09, 1, 1.29226656e-08, -0.526286185, 1.20406858e-08, -0.850307524)
        wait(2)
        chara.HumanoidRootPart.CFrame = CFrame.new(-50.8950272, 20.9255829, 2137.91357, -0.972867966, -3.05006544e-08, 0.231361046, -4.01606641e-08, 1, -3.70432751e-08, -0.231361046, -4.53298306e-08, -0.972867966)
        wait(1)
chara.HumanoidRootPart.CFrame = CFrame.new(-56.1324272, -359.141205, 9490.19336, -0.999418378, 0.0338956974, 0.0037424101, 0.033853177, 0.999367416, -0.0108940192, -0.004109303, -0.0107609909, -0.99993366)
        game.Workspace.Gravity = 196.2
wait(19)
end
end

function AutoUnbox()
    while getgenv().AutoUnbox == true do
local args = {
    [1] = "Common Chest",
    [2] = 1
}

workspace.ItemBoughtFromShop:InvokeServer(unpack(args))
end
end

function Jude()
    OrionLib:MakeNotification({
    Name = "ALERT",
	Content = "Keep build tool out",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Starting To Build...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

	     local lp = game:GetService("Players").LocalPlayer
        local Backpack = game.Players.LocalPlayer.Backpack
        local chara = game.Players.LocalPlayer.Character
        local origin = chara.HumanoidRootPart.CFrame
        
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
        
        wait(0.2)
            local Tool = "BuildingTool" 
            chara.Humanoid:EquipTool(Backpack[Tool])
   
   
   
    
    
    wait(0.3)
    
local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-49, 6.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-51, 6.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-49, 8.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-49, 10.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-49, 12.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-51, 12.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-47, 12.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-100.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

---------------------------




local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-39, 6.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-92.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-39, 8.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-92.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-39, 10.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-92.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-37, 6.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-92.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-35, 6.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-88.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-35, 8.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-88.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-35, 10.100000381469727, 94) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-88.56568908691406, -11.899991989135742, -251.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------




local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-27, 6.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-80.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-27, 10.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-80.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-29, 8.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-82.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-25, 6.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-78.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-25, 8.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-78.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-25, 10.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-78.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-25, 12.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-78.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-25, 14.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-78.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))
---------------------------




local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-17, 8.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-17, 10.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-17, 12.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-15, 6.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-15, 10.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-15, 12.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))


local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-13, 6.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-13, 10.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

local args = {
    [1] = "WoodBlock",
    [2] = Wood,
    [3] = workspace[plrteam()],
    [4] = CFrame.new(-13, 12.100000381469727, 93) * CFrame.Angles(-0, 0, -0),
    [5] = true,
    [6] = 1,
    [7] = CFrame.new(-70.56568908691406, -11.899991989135742, -252.50686645507812) * CFrame.Angles(-0, 0, -0),
    [8] = false
}

game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(unpack(args))

OrionLib:MakeNotification({
	Name = "Progress",
	Content = "Finished Building!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
local UsedWood = game.Players.LocalPlayer.Data.WoodBlock.Used.Value
print(UsedWood)

OrionLib:MakeNotification({
	Name = "Info",
	Content = "Used "..UsedWood.." Wood blocks",
	Image = "rbxassetid://4483345998",
	Time = 10
})
 for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA'Tool' then
                    v.Parent = game.Players.LocalPlayer.Backpack;
                end;
        end; 
end












local Tab = Window:MakeTab({
	Name = "Quests",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddButton({
	Name = "target quest",
	Callback = function()
local args = {
    [1] = 2
}

workspace.QuestMakerEvent:FireServer(unpack(args))
local chara = game.Players.LocalPlayer.Character
            local origin = chara.HumanoidRootPart.CFrame
wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[plrteam()].Quest.Target.Part.CFrame
wait(1)
local chara = game.Players.LocalPlayer.Character
            local origin = chara.HumanoidRootPart.CFrame
  	end    
})




Tab:AddButton({
	Name = "thin ice quest",
	Callback = function()
	    game.Workspace.Gravity = 0
local args = {
    [1] = 9
}

workspace.QuestMakerEvent:FireServer(unpack(args))
local chara = game.Players.LocalPlayer.Character
            local origin = chara.HumanoidRootPart.CFrame
wait(2)
chara.HumanoidRootPart.CFrame = CFrame.new(-17.2441807, 22.4234791, 1359.83765, -0.850307524, -5.10061016e-09, 0.526286185, 1.99975903e-09, 1, 1.29226656e-08, -0.526286185, 1.20406858e-08, -0.850307524)
        wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-50.8950272, 20.9255829, 2137.91357, -0.972867966, -3.05006544e-08, 0.231361046, -4.01606641e-08, 1, -3.70432751e-08, -0.231361046, -4.53298306e-08, -0.972867966)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-45.670414, 25.2458458, 2909.57153, -0.90480876, 1.30821309e-09, 0.425818175, 1.16460681e-08, 1, 2.16741594e-08, -0.425818175, 2.45700775e-08, -0.90480876)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-10.4901314, 37.6174622, 3677.06201, -0.978968859, -1.65246083e-09, -0.204009622, -7.44443229e-10, 1, -4.52760052e-09, 0.204009622, -4.28050617e-09, -0.978968859)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-50.9394913, 30.8854847, 4449.0708, -0.989130974, -1.93212415e-08, -0.147037312, -1.73598913e-08, 1, -1.4622386e-08, 0.147037312, -1.19109025e-08, -0.989130974)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-19.1005783, 60.6625443, 5219.69629, -0.963262498, -9.87095916e-08, 0.268561721, -7.70254331e-08, 1, 9.12784088e-08, -0.268561721, 6.72389859e-08, -0.963262498)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-48.4247093, 11.0636272, 5987.90479, -0.994051278, -2.96921119e-08, -0.108913146, -3.38420065e-08, 1, 3.62543666e-08, 0.108913146, 3.97245365e-08, -0.994051278)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-76.6527023, 38.4256821, 6760.96338, -0.989316583, 1.66555469e-09, -0.145783082, 3.0631635e-09, 1, -9.36242817e-09, 0.145783082, -9.70896341e-09, -0.989316583)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-63.3461571, 40.3512268, 7527.07178, -0.99008441, -6.27901358e-08, -0.140473634, -4.77132645e-08, 1, -1.10696767e-07, 0.140473634, -1.02896685e-07, -0.99008441)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-39.4213638, 43.9060669, 8296.41406, 0.817950964, 2.95945046e-08, -0.575287938, -7.49957891e-08, 1, -5.51869235e-08, 0.575287938, 8.82843736e-08, 0.817950964)
wait(0.5)
chara.HumanoidRootPart.CFrame = CFrame.new(-56.1324272, -359.141205, 9490.19336, -0.999418378, 0.0338956974, 0.0037424101, 0.033853177, 0.999367416, -0.0108940192, -0.004109303, -0.0107609909, -0.99993366)
game.Workspace.Gravity = 196.2
  	end    
})

Tab:AddButton({
	Name = "cloud quest",
	Callback = function()
	    local chara = game.Players.LocalPlayer.Character
            local origin = chara.HumanoidRootPart.CFrame
            
local args = {
    [1] = 1
}

workspace.QuestMakerEvent:FireServer(unpack(args))

wait(2)
      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[plrteam()].Quest.Cloud.Part2.CFrame
      	wait(1)
chara.HumanoidRootPart.CFrame = origin
  	end    
})

Tab:AddButton({
	Name = "ramp quest",
	Callback = function()
local args = {
    [1] = 3
}

workspace.QuestMakerEvent:FireServer(unpack(args))
local chara = game.Players.LocalPlayer.Character
            local origin = chara.HumanoidRootPart.CFrame
wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-204.711868, 57.7604332, 637.440796, 0.194487467, 8.51244906e-08, -0.980904996, -1.13564802e-08, 1, 8.45298942e-08, 0.980904996, -5.30037747e-09, 0.194487467) --yellow
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94.4861298, 62.5148773, 658.108826, -0.0793171749, 2.48156109e-08, 0.996849418, 5.72656977e-10, 1, -2.48484753e-08, -0.996849418, -1.40005818e-09, -0.0793171749) --pink
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97.1444092, 69.6508789, -73.1027374, -0.0828877762, -2.67131171e-08, 0.996558905, 1.0354209e-08, 1, 2.76665588e-08, -0.996558905, 1.26117987e-08, -0.0828877762) --red
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-206.085129, 66.6880188, -77.5363617, 0.511189699, 5.61007596e-08, -0.859467924, -7.8608231e-10, 1, 6.48062866e-08, 0.859467924, -3.2452693e-08, 0.511189699) --black
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97.2251968, 66.1827164, 294.367401, -0.796652257, 5.48569865e-08, 0.604437888, 1.23224786e-09, 1, -8.91329179e-08, -0.604437888, -7.02631269e-08, -0.796652257) --blue
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-48.4812737, 62.1871529, -223.282959, -0.950112283, 6.22774943e-09, -0.311908096, 1.31223876e-09, 1, 1.59693681e-08, 0.311908096, 1.4763395e-08, -0.950112283) --white
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-205.607178, 71.5388794, 285.958466, 0.15931727, 3.77735532e-08, -0.98722744, -8.46683577e-08, 1, 2.45986094e-08, 0.98722744, 7.96679416e-08, 0.15931727) --green
    wait(1)
    chara.HumanoidRootPart.CFrame = origin
  	end    
})


Tab:AddButton({
	Name = "Find me quest",
	Callback = function()
local args = {
    [1] = 4
}

workspace.QuestMakerEvent:FireServer(unpack(args))

wait(1)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector
wait(2)
fireclickdetector(clickdetector)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)
wait(2)
local clickdetector = game:GetService("Workspace")[plrteam()].Quest.Butter.PPart.ClickDetector

fireclickdetector(clickdetector)


  	end    
})


Tab:AddButton({
	Name = "soccer quest ",
	Callback = function()
local args = {
    [1] = 8
}

workspace.QuestMakerEvent:FireServer(unpack(args))
wait(1)

game:GetService("Workspace")[plrteam()].Quest.Soccer1.SoccerBall.Size = Vector3.new(6,6,6)
game:GetService("Workspace")[plrteam()].Quest.Soccer1.SoccerBall.Mesh.Scale = Vector3.new(6,6,6)
OrionLib:MakeNotification({
	Name = "Hey",
	Content = "Now just push it into the goal",
	Image = "rbxassetid://4483345998",
	Time = 15
})

  	end    
})



local Tab = Window:MakeTab({
	Name = "Trolling",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Spam request join all teams",
	Default = (bool),
	Callback = function(bool)
		getgenv().SpamTeams = bool
		print(bool)
		if bool then
		SpamTeams()
		end
	end    
    
})




function SpamTeams()
    while getgenv().SpamTeams == true do
local args = {
    [1] = game:GetService("Teams").black
}

workspace.ChangeTeam:FireServer(unpack(args))
wait(1)

local args = {
    [1] = game:GetService("Teams").white
}

workspace.ChangeTeam:FireServer(unpack(args))

wait(1)
local args = {
    [1] = game:GetService("Teams").blue
}

workspace.ChangeTeam:FireServer(unpack(args))
wait(1)
local args = {
    [1] = game:GetService("Teams").green
}

workspace.ChangeTeam:FireServer(unpack(args))
wait(1)
local args = {
    [1] = game:GetService("Teams").magenta
}

workspace.ChangeTeam:FireServer(unpack(args))
wait(1)
local args = {
    [1] = game:GetService("Teams").red
}

workspace.ChangeTeam:FireServer(unpack(args))
wait(1)
local args = {
    [1] = game:GetService("Teams").yellow
}

workspace.ChangeTeam:FireServer(unpack(args))
end
end

local Tab = Window:MakeTab({
	Name = "Random",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddToggle({
	Name = "Auto join white team",
	Default = (bool),
	Callback = function(bool)
		getgenv().SpamWhite = bool
		print(bool)
		if bool then
		SpamWhite()
		end
	end    
    
})



local Tab = Window:MakeTab({
	Name = "Discord",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "copy discord",
	Callback = function()
      		setclipboard("")
      		OrionLib:MakeNotification({
	Name = "Copied!",
	Content = "Copied Discord link",
	Image = "rbxassetid://4483345998",
	Time = 5
})
  	end    
})





function SpamWhite()
    while getgenv().SpamWhite == true do
        wait()
        local args = {
    [1] = game:GetService("Teams").white
}

workspace.ChangeTeam:FireServer(unpack(args))
    
end
end