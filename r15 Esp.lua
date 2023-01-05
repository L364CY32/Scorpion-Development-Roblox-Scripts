assert(Drawing, "missing dependency: drawing");

--Script made by mickey and UncleRon

--//Toggles _G because I am a idiot
_G.BoxEspI = false
_G.DistanceEspI = false
_G.SkeletonEspI = true --//HOLY FUCK IT TOOK A WHILE
_G.NameEspI = false
_G.TracerEspI = false
_G.SkeletonEspColor = Color3.new(1,1,1)

-- services
local run_service = game:GetService("RunService");
local players = game:GetService("Players");
local workspace = game:GetService("Workspace");

-- variables
local camera = workspace.CurrentCamera;
local get_pivot = workspace.GetPivot;
local wtvp = camera.WorldToViewportPoint;
local viewport_size = camera.ViewportSize;
local localplayer = players.LocalPlayer;
local cache = {};

-- locals
local new_drawing = Drawing.new;
local new_vector2 = Vector2.new;
local new_color3 = Color3.new;
local rad = math.rad;
local tan = math.tan;
local floor = math.floor;

-- functions
local function create_esp(player)
    local esp = {};

    esp.box = new_drawing("Square", true);
    esp.box.Color = new_color3(0.3,0.3,0.9);
    esp.box.Thickness = 1.2;
    esp.box.Filled = false;
    
    esp.tracer = new_drawing("Line", true);
    esp.tracer.Color = new_color3(1,0,0);
    esp.tracer.Thickness = 1;

    esp.name = new_drawing("Text", true);
    esp.name.Color = new_color3(1,1,1);
    esp.name.Size = 14;
    esp.name.Center = true;

    esp.distance = new_drawing("Text", true);
    esp.distance.Color = new_color3(1,1,1);
    esp.distance.Size = 14;
    esp.distance.Center = true;
    
    --//right leg to lower torso
    esp.rlleg = new_drawing("Line", true);
    esp.rlleg.Color = _G.SkeletonEspColor;
    esp.rlleg.Thickness = 1;
    esp.ruleg = new_drawing("Line", true);
    esp.ruleg.Color = _G.SkeletonEspColor;
    esp.ruleg.Thickness = 1;
    esp.rltorso = new_drawing("Line", true);
    esp.rltorso.Color = _G.SkeletonEspColor;
    esp.rltorso.Thickness = 1;
    
    --//left leg to lower torso
    esp.llleg = new_drawing("Line", true);
    esp.llleg.Color = _G.SkeletonEspColor;
    esp.llleg.Thickness = 1;
    esp.luleg = new_drawing("Line", true);
    esp.luleg.Color = _G.SkeletonEspColor;
    esp.luleg.Thickness = 1;
    esp.lltorso = new_drawing("Line", true);
    esp.lltorso.Color = _G.SkeletonEspColor;
    esp.lltorso.Thickness = 1;
    
    --//connecting the lowertorso to the upper troso and then the head
    esp.utorso = new_drawing("Line", true);
    esp.utorso.Color = _G.SkeletonEspColor;
    esp.utorso.Thickness = 1;
    esp.head = new_drawing("Line", true);
    esp.head.Color = _G.SkeletonEspColor;
    esp.head.Thickness = 1;
    
    --//Right arm to upper Torso
    esp.rh = new_drawing("Line", true);
    esp.rh.Color = _G.SkeletonEspColor;
    esp.rh.Thickness = 1;
    esp.rua = new_drawing("Line", true);
    esp.rua.Color = _G.SkeletonEspColor;
    esp.rua.Thickness = 1;
    esp.rla = new_drawing("Line", true);
    esp.rla.Color = _G.SkeletonEspColor;
    esp.rla.Thickness = 1;
    esp.rut = new_drawing("Line", true);
    esp.rut.Color = _G.SkeletonEspColor;
    esp.rut.Thickness = 1;
    
    --//Left arm to upper Torso
    esp.lh = new_drawing("Line", true);
    esp.lh.Color = _G.SkeletonEspColor;
    esp.lh.Thickness = 1;
    esp.lua = new_drawing("Line", true);
    esp.lua.Color = _G.SkeletonEspColor;
    esp.lua.Thickness = 1;
    esp.lla = new_drawing("Line", true);
    esp.lla.Color = _G.SkeletonEspColor;
    esp.lla.Thickness = 1;
    esp.lut = new_drawing("Line", true);
    esp.lut.Color = _G.SkeletonEspColor;
    esp.lut.Thickness = 1;
    
    cache[player] = esp;
end

local function remove_esp(player)
    for _, drawing in next, cache[player] do
        drawing:Remove();
    end

    cache[player] = nil;
end

local function vischeckthing(espc, vis, on)
    if on == true then
        espc.Visible = vis
        else
        espc.Visible = false
        end
    end

local function update_esp()
    for player, esp in next, cache do
        local character = player and player.Character;
        if character and player.Team ~= localplayer.Team then
            local cframe = get_pivot(character);
            local position, visible = wtvp(camera, cframe.Position);
            
            --Mind the fucking terrible skeleton esp this is my first time making it
            
            --//Torso and head shit
            local lowerTorso = get_pivot(character.LowerTorso);
            local ltpos, vislt = wtvp(camera, lowerTorso.Position);
            local upperTorso = get_pivot(character.UpperTorso);
            local utpos, visut = wtvp(camera, upperTorso.Position);
            local Chead = get_pivot(character.Head);
            local headpos, vishead = wtvp(camera, Chead.Position);
            
            --//Right leg shit
            local rightFoot = get_pivot(character.RightFoot);
            local rfpos, visrf = wtvp(camera, (rightFoot.Position));
            local rightLowerLeg = get_pivot(character.RightLowerLeg);
            local rllpos, visrll = wtvp(camera, rightLowerLeg.Position);
            local rightUpperLeg = get_pivot(character.RightUpperLeg);
            local rulpos, visrul = wtvp(camera, rightUpperLeg.Position);
            
            --//Left leg shit
            local leftFoot = get_pivot(character.LeftFoot);
            local lfpos, vislf = wtvp(camera, leftFoot.Position);
            local leftLowerLeg = get_pivot(character.LeftLowerLeg);
            local lllpos, vislll = wtvp(camera, leftLowerLeg.Position);
            local leftUpperLeg = get_pivot(character.LeftUpperLeg);
            local lulpos, vislul = wtvp(camera, leftUpperLeg.Position);
            
            --// Right arm shit
            local rightHand = get_pivot(character.RightHand)
            local rhpos, visrh = wtvp(camera, rightHand.Position)
            local rightLowerArm = get_pivot(character.RightLowerArm)
            local rlapos, visrla = wtvp(camera, rightLowerArm.Position)
            local rightUpperArm = get_pivot(character.RightUpperArm)
            local ruapos, visrua = wtvp(camera, rightUpperArm.Position)
            
            --// Left arm shit
            local leftHand = get_pivot(character.LeftHand)
            local lhpos, vislh = wtvp(camera, leftHand.Position)
            local leftLowerArm = get_pivot(character.LeftLowerArm)
            local llapos, vislla = wtvp(camera, leftLowerArm.Position)
            local leftUpperArm = get_pivot(character.LeftUpperArm)
            local luapos, vislua = wtvp(camera, leftUpperArm.Position)
            
            
            vischeckthing(esp.box, visible, _G.BoxEspI)
            vischeckthing(esp.tracer, visible, _G.TracerEspI)
            vischeckthing(esp.name, visible, _G.NameEspI)
            vischeckthing(esp.distance, visible, _G.DistanceEspI)
            vischeckthing(esp.rlleg, visible, _G.SkeletonEspI)
            vischeckthing(esp.ruleg, visible, _G.SkeletonEspI)
            vischeckthing(esp.rltorso, visible, _G.SkeletonEspI)
            vischeckthing(esp.llleg, visible, _G.SkeletonEspI)
            vischeckthing(esp.luleg, visible, _G.SkeletonEspI)
            vischeckthing(esp.lltorso, visible, _G.SkeletonEspI)
            vischeckthing(esp.utorso, visible, _G.SkeletonEspI)
            vischeckthing(esp.head, visible, _G.SkeletonEspI)
            vischeckthing(esp.rh, visible, _G.SkeletonEspI)
            vischeckthing(esp.rua, visible, _G.SkeletonEspI)
            vischeckthing(esp.rla, visible, _G.SkeletonEspI)
            vischeckthing(esp.rut, visible, _G.SkeletonEspI)
            vischeckthing(esp.lh, visible, _G.SkeletonEspI)
            vischeckthing(esp.lla, visible, _G.SkeletonEspI)
            vischeckthing(esp.lua, visible, _G.SkeletonEspI)
            vischeckthing(esp.lut, visible, _G.SkeletonEspI)

            if visible then
                local scale_factor = 1 / (position.Z * tan(rad(camera.FieldOfView * 0.5)) * 2) * 100;
                local width, height = floor(35 * scale_factor), floor(50 * scale_factor);
                local x, y = floor(position.X), floor(position.Y);
                
                esp.box.Size = new_vector2(width, height);
                esp.box.Position = new_vector2(floor(x - width * 0.5), floor(y - height * 0.5));

                esp.rh.From = new_vector2(floor(rhpos.X), floor(rhpos.Y))
                esp.rh.To = new_vector2(floor(rlapos.X), floor(rlapos.Y))
                esp.rla.From = new_vector2(floor(rlapos.X), floor(rlapos.Y))
                esp.rla.To = new_vector2(floor(ruapos.X), floor(ruapos.Y))
                esp.rua.From = new_vector2(floor(rlapos.X), floor(rlapos.Y))
                esp.rua.To = new_vector2(floor(ruapos.X), floor(ruapos.Y))
                esp.rut.From = new_vector2(floor(ruapos.X), floor(ruapos.Y))
                esp.rut.To = new_vector2(floor(utpos.X), floor(utpos.Y))
                
                esp.lh.From = new_vector2(floor(lhpos.X), floor(lhpos.Y))
                esp.lh.To = new_vector2(floor(llapos.X), floor(llapos.Y))
                esp.lla.From = new_vector2(floor(llapos.X), floor(llapos.Y))
                esp.lla.To = new_vector2(floor(luapos.X), floor(luapos.Y))
                esp.lua.From = new_vector2(floor(llapos.X), floor(llapos.Y))
                esp.lua.To = new_vector2(floor(luapos.X), floor(luapos.Y))
                esp.lut.From = new_vector2(floor(luapos.X), floor(luapos.Y))
                esp.lut.To = new_vector2(floor(utpos.X), floor(utpos.Y))

                esp.rlleg.From = new_vector2(floor(rfpos.X), floor(rfpos.Y));
                esp.rlleg.To = new_vector2(floor(rllpos.X), floor(rllpos.Y));
                esp.rlleg.From = new_vector2(floor(rllpos.X), floor(rllpos.Y));
                esp.rlleg.To = new_vector2(floor(rulpos.X), floor(rulpos.Y));
                esp.rltorso.From = new_vector2(floor(rulpos.X), floor(rulpos.Y))
                esp.rltorso.To = new_vector2(floor(ltpos.X), floor(ltpos.Y))
                
                esp.llleg.From = new_vector2(floor(lfpos.X), floor(lfpos.Y));
                esp.llleg.To = new_vector2(floor(lllpos.X), floor(lllpos.Y));
                esp.llleg.From = new_vector2(floor(lllpos.X), floor(lllpos.Y));
                esp.llleg.To = new_vector2(floor(lulpos.X), floor(lulpos.Y));
                esp.lltorso.From = new_vector2(floor(lulpos.X), floor(lulpos.Y))
                esp.lltorso.To = new_vector2(floor(ltpos.X), floor(ltpos.Y))
                
                esp.utorso.From = new_vector2(floor(ltpos.X), floor(ltpos.Y))
                esp.utorso.To = new_vector2(floor(utpos.X), floor(utpos.Y))
                esp.head.From = new_vector2(floor(utpos.X), floor(utpos.Y))
                esp.head.To = new_vector2(floor(headpos.X), floor(headpos.Y))
                
                esp.tracer.From = new_vector2(floor(viewport_size.X * 0.5), floor(viewport_size.Y));
                esp.tracer.To = new_vector2(x, floor(y + height * 0.5));

                esp.name.Text = player.Name;
                esp.name.Position = new_vector2(x, floor(y - height * 0.5 - esp.name.TextBounds.Y));

                esp.distance.Text = floor(position.Z) .. " studs";
                esp.distance.Position = new_vector2(x, floor(y + height * 0.5));
            end
        else
            esp.box.Visible = false;
            esp.tracer.Visible = false;
            esp.name.Visible = false;
            esp.distance.Visible = false;
            esp.rlleg.Visible = false;
            esp.ruleg.Visible = false;
            esp.rltorso.Visible = false;
            esp.llleg.Visible = false;
            esp.luleg.Visible = false;
            esp.lltorso.Visible = false;
            esp.utorso.Visible = false;
            esp.head.Visible = false;
            esp.rh.Visible = false;
            esp.rla.Visible = false;
            esp.rua.Visible = false;
            esp.rut.Visible = false;
            esp.lh.Visible = false;
            esp.lla.Visible = false;
            esp.lua.Visible = false;
            esp.lut.Visible = false;
        end
    end
end

-- connections
players.PlayerAdded:Connect(create_esp);
players.PlayerRemoving:Connect(remove_esp);
run_service.RenderStepped:Connect(update_esp);

for _, player in next, players:GetPlayers() do
    if player ~= localplayer then
        create_esp(player);
    end
end