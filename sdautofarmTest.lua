--use in conjunction with many other partial-survival scripts such as my half godmode
for i,v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "afker" then
        game.Workspace.afker:Destroy()
        game.CoreGui.afkGui:Destroy()
    end
end

if not isfile("deaths.txt") then
    writefile("deaths.txt", "Deaths: ")
end
wait(0.3)
--variables and functions
local player = game.Workspace[game.Players.LocalPlayer.Name]
local spawned = false
local belowed = false
local aboved = false

--gui
local afkGui = Instance.new("ScreenGui", game.CoreGui)
afkGui.Name = "afkGui"

local sfBtn = Instance.new("TextButton", afkGui)
sfBtn.Name = "SurfaceButton"
sfBtn.BackgroundColor3 = Color3.new(0.333333, 0.333333, 0.333333)
sfBtn.Size = UDim2.new(0, 150, 0, 25)
sfBtn.Font = Enum.Font.SourceSans
sfBtn.Text = "To Surface"
sfBtn.TextColor3 = Color3.new(1, 1, 1)
sfBtn.TextScaled = true
sfBtn.TextSize = 14
sfBtn.TextWrapped = true
sfBtn.Position = UDim2.new(0.5, -75, 1, -25)

local bBtn = sfBtn:Clone()
bBtn.Parent = sfBtn.Parent
bBtn.Name = "LowerButton"
bBtn.Text = "To Below"
bBtn.Position = UDim2.new(0.4, -75, 1, -25)

local aBtn = sfBtn:Clone()
aBtn.Parent = sfBtn.Parent
aBtn.Name = "AboveButton"
aBtn.Text = "To Above"
aBtn.Position = UDim2.new(0.6, -75, 1, -25)

--parts
local main = Instance.new("Folder", game.Workspace)
main.Name = "afker"
local walls = Instance.new("Folder", main)
walls.Name = "Walls"
local platforms = Instance.new("Folder", main)
platforms.Name = "Platforms"

local below = Instance.new("Part", platforms)
below.CanCollide = false
below.Name = "below"
below.Anchored = true
below.Size = Vector3.new(400,1,400)
below.Position  = Vector3.new(0,-130,0)
below.Material = "ForceField"
below.Transparency = 0.25

local bWall = below:Clone()
bWall.Name = "bWall"
bWall.Parent = walls
bWall.Position = bWall.Position + Vector3.new(0,50,-100)
bWall.Size = Vector3.new(150,100,5)

local spawnStop = below:Clone()
spawnStop.Parent = platforms
spawnStop.Name = "Spawn Barrier"
spawnStop.Position = Vector3.new(0,43,82)
spawnStop.Size = Vector3.new(30,1,30)

local above = below:Clone()
above.Parent = platforms
above.Name = "above"
above.CFrame = above.CFrame + Vector3.new(0,250, 0)

local aWall = bWall:Clone()
aWall.Parent = walls
aWall.Name = "aWall"
aWall.CFrame = aWall.CFrame + Vector3.new(0,250,0)

local barrier0 = below:Clone()
barrier0.Parent = platforms
barrier0.Name = "0,0,0 barrier"
barrier0.Position = Vector3.new(0,0,0)
--button functions

sfBtn.MouseButton1Click:Connect(function()
    if aboved then
        aboved = false
        above.CanCollide = false
        aWall.CanCollide = false
    end
    if belowed then
        belowed = false
        below.CanCollide = false
        bWall.CanCollide = false
    end
    if not spawned then
        spawned = true
        spawnStop.CanCollide = true
        game.Workspace[player.Name].HumanoidRootPart.CFrame = spawnStop.CFrame + Vector3.new(0,5,0)
    else if spawned then
        spawned = false
        spawnStop.CanCollide = false
    end
    end
end)

aBtn.MouseButton1Click:Connect(function()
    if spawned then
        spawned = false
        spawnStop.CanCollide = false
    end
    if belowed then
        belowed = false
        below.CanCollide = false
        bWall.CanCollide = false
    end
    if not aboved then
        aboved = true
        above.CanCollide = true
        aWall.CanCollide = true
        game.Workspace[player.Name].HumanoidRootPart.CFrame = above.CFrame + Vector3.new(0,5,0)
    else if aboved then
        aboved = false
        above.CanCollide = false
        aWall.CanCollide = false
    end
    end
end)

bBtn.MouseButton1Click:Connect(function()
    if aboved then
        aboved = false
        above.CanCollide = false
        aWall.CanCollide = false
    end
    if spawned then
        spawned = false
        spawnStop.CanCollide = false
    end
    if not belowed then
        belowed = true
        below.CanCollide = true
        bWall.CanCollide = true
        game.Workspace[player.Name].HumanoidRootPart.CFrame = below.CFrame + Vector3.new(0,5,0)
    else if belowed then
        belowed = false
        below.CanCollide = false
        bWall.CanCollide = false
    end
    end
end)

local belows = {
    "Epic Katana",
    "Volcano",
    "Giant Gun",
    "Sniper",
    "Scoobis",
    "Delinquent", --end of new!
    "Acid Rain",
    "Alexnewtron",
    "Alien Invasion",
    "Avalanche",
    "Beehive",
    "Bombers",
    "Cactoball",
    "Cake",
    "Coil Noobs",
    "Coin Balloon",
    "Crazy Robloxian",
    "Crimson Balrog",
    "Doge",
    "Dynamites",
    "Epic Duck",
    "Explosive Noobs",
    "Falling Hoops",
    "Ghosts",
    "Giant Noob",
    "Guest Ambush",
    "Hot Potato",
    "Icicles",
    "Killbots",
    "Korblox Mages",
    "Lumberjack",
    "Meteors",
    "Mine Spawn",
    "Missile Launcher",
    "Missile Strike",
    "Mr. Happy",
    "Murderers",
    "Neon Trooper",
    "Neon Blaster",
    "Ninjas",
    "Noobs",
    "Nuclear Bomb",
    "Overseer Soldiers",
    "Pacman",
    "Poltergeist",
    "Polyhex",
    "Raining Tacos",
    "Redcliff Warriors",
    "Rocket Noobs",
    --"Sandstorm",
    "Shedletsky",
    "Shoop Da Whoop",
    "Sighters",
    "Slenderman",
    "Soccer Balls",
    "Spiked Walls",
    "Stonetroid",
    "Thieves",
    "Thunderstorm",
    "Time Bombs",
    "Tiny Noobs",
    "Tornado",
    "Tsunami",
    "Undyne",
    "Witch",
    "Wolven Footsoldier",
    "Zombies",
    "Counterfeit Coins"
    }

local aboves = {
    "Flash Flood",
    "Giant Zombie",
    "Rising Acid",
    "Rising Lava",
    "Oil Spill",
    "Illumina",
    }

alrRan = false
function checkBelow()
    if #game.Workspace.Disaster:GetChildren() == 0 and alrRan then
        alrRan = false
        aboved = false
        above.CanCollide = false
        aWall.CanCollide = false
        belowed = false
        below.CanCollide = false
        bWall.CanCollide = false

        spawned = true
        spawnStop.CanCollide = true
        game.Workspace[player.Name].HumanoidRootPart.CFrame = spawnStop.CFrame + Vector3.new(0,5,0)
    end
    local custom = false
    if not alrRan then
        for x,e in pairs(game.Workspace.Disaster:GetChildren()) do --for item in disaster list
            for i,v in pairs(belows) do
                if e.Name == v then --if disaster name equals item in list
                    alrRan = true
                    if aboved then
                        aboved = false
                        above.CanCollide = false
                        aWall.CanCollide = false
                    end
                    if spawned then
                        spawned = false
                        spawnStop.CanCollide = false
                    end
                    print(e.Name)
                    belowed = true
                    below.CanCollide = true
                    bWall.CanCollide = true
                    game.Workspace[player.Name].HumanoidRootPart.CFrame = below.CFrame + Vector3.new(0,5,0)
                    if custom then break end
                    if e.Name == 'Epic Katana' then
                        game.Workspace[player.Name].HumanoidRootPart.CFrame += Vector3.new(190)
                        custom = true
                    elseif e.Name == 'Volcano' then
                        local posxz = e:WaitForChild"Volcano":WaitForChild"Or".Position * -Vector3.new(0.375,0,0.375)
                        local hrp = game.Workspace[player.Name].HumanoidRootPart
                        hrp.CFrame = CFrame.new(posxz + hrp.Position*Vector3.new(0,1,0))
                        custom = true
                    elseif e.Name == "Nuclear Bomb" then
                        local posxz = e:WaitForChild"Point".Position
                        posxz += Vector3.new(posxz.X <= 0 and 150 or -150, -posxz.Y, posxz.Z <= 0 and 150 or -150)
                        local hrp = game.Workspace[player.Name].HumanoidRootPart
                        hrp.CFrame = CFrame.new(posxz + hrp.Position*Vector3.new(0,1,0))
                        custom = true
                    end
                end
            end
        end
    end
end

function checkAbove()
    if #game.Workspace.Disaster:GetChildren() == 0 and alrRan then
        alrRan = false
        aboved = false
        above.CanCollide = false
        aWall.CanCollide = false
        belowed = false
        below.CanCollide = false
        bWall.CanCollide = false

        spawned = true
        spawnStop.CanCollide = true
        game.Workspace[player.Name].HumanoidRootPart.CFrame = spawnStop.CFrame + Vector3.new(0,5,0)
    end
    if not alrRan then
        for x,e in pairs(game.Workspace.Disaster:GetChildren()) do --for item in disaster list
            for i,v in pairs(aboves) do
                if e.Name == v then --if disaster name equals item in list
                    alrRan = true
                    if belowed then
                        belowed = false
                        below.CanCollide = false
                        bWall.CanCollide = false
                    end
                    if spawned then
                        spawned = false
                        spawnStop.CanCollide = false
                    end
                    print(e.Name)
                    aboved = true
                    above.CanCollide = true
                    aWall.CanCollide = true
                    game.Workspace[player.Name].HumanoidRootPart.CFrame = above.CFrame + Vector3.new(0,5,0)
                    if e.Name == "Illumina" then
                        game.Workspace[player.Name].HumanoidRootPart.CFrame += Vector3.new(0,0,-95)
                    end
                end
                
                
            end
        end
    end
end

--specials
--fireball in workspace
--poison in model
function checkDisasters()
    if #game.Workspace.Disaster:GetChildren() == 0 and alrRan then
        alrRan = false
        aboved = false
        above.CanCollide = false
        aWall.CanCollide = false
        belowed = false
        below.CanCollide = false
        bWall.CanCollide = false

        spawned = true
        spawnStop.CanCollide = true
        game.Workspace[player.Name].HumanoidRootPart.CFrame = spawnStop.CFrame + Vector3.new(0,5,0)
    end
    for i,v in pairs(game.Workspace.Disaster:GetChildren()) do
        if v.Name == "Black Mage" then
            game.Workspace.Fireball:Destroy()
            game:GetService("Workspace").Disaster["Black Mage"]["Black Mage"]:Destroy()
        end
        if v.Name == "Press The Button" then
            alrRan = true
            for i,v in pairs(v:GetDescendants()) do
                if v.Name == "Trigger" then
                    game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,5,0)
                end
            end
            wait(0.5)
            game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPar.Anchored = true
        end
        if v.Name == "Caterdriller" then
            for w,f in pairs(v:GetChildren()) do
                f:Destroy()
            end
        end
        if v.Name == "Neon Trooper" then
            v.Fire:Destroy()
        end
        if v.Name == "Volcano" then
            v.Handle:Destroy()
        end
        if v.Name == "Sandstorm" and not alrRan then
            alrRan = true
            player.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.OpenShop.CFrame + Vector3.new(0,5,0)
        end
        if v.Name == "Green Zone" then
            alrRan = true
            for q,e in pairs(v:GetDescendants()) do
                if e.Name == "Zone" then
                    game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = e.Part.CFrame - Vector3.new(0,40,0)
                end
            end
            wait(0.5)
            player.HumanoidRootPart.Anchored = true
        end
    end
    
end

--fire and wave in workspace
function checkWorkspaceDeletables()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "EK" or v.Name == "Pizza" or (v.Name == "Part" and v:FindFirstChild("Texture") and v:FindFirstChild("Script")) or v.Name == "Wave" or v.Name == "Fire" or v.Name == "Rock" then
            v:Destroy()
        end
    end
end

--yoji and Neon Trooper
local comped = false
local part
local baseY
local xd
function complicatedones()
    if #game.Workspace.Disaster:GetChildren() == 0 then
        comped = false
        xd:Destroy()
    end
    if not comped then
        for i,v in pairs(game.Workspace.Disaster:GetChildren()) do
            if v.Name == "Neon Trooper" or v.Name == "Yojimbo" then
                for f,g in pairs(v:GetDescendants()) do
                    if g.Name == "Head" then
                        part = g
                        alrRan = true
                        comped = true
                        xd = Instance.new("Part", game.Workspace)
                        xd.Anchored = true
                        xd.Name = "stool lol"
                        player.HumanoidRootPart.CFrame = below.CFrame + Vector3.new(0,5,0)
                        baseY = part.Position.Y - player.HumanoidRootPart.Position.Y 
                    end
                end
            end
        end
    end
    if comped then
        for i,v in pairs(game.Workspace.Disaster:GetChildren()) do
            if v.Name ~= "Neon Trooper" and v.Name ~= "Yojimbo" then
                v:Destroy()
                comped = false
            end
        end
        if game.Workspace.Disaster:FindFirstChild("Yojimbo") or game.Workspace.Disaster:FindFirstChild("Neon Trooper") then
            player.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(200*math.sin(math.rad(part.Orientation.Y+90)),-1*baseY,200*math.cos(math.rad(part.Orientation.Y+90)))*2
            xd.CFrame = player.HumanoidRootPart.CFrame - Vector3.new(0,2.48,0)
        else do
            comped = false
            alrRun = false
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "stool lol" then v:Destroy() end
            end
        end
        end
    end
end

local dead = false
local lp = game.Players.LocalPlayer
function checkdead()
    local txt = "("
    if game:GetService("Players")[player.Name].PlayerGui.Leaderboard.Frame[lp.Name].NameTag.TextColor3 == Color3.new(1,0,0) and not dead then
            for i,v in pairs(game.Workspace.Disaster:GetChildren()) do if v:IsA("Model") then txt = txt..v.Name end end
            txt = txt..") "
            appendfile("deaths.txt", txt.." <- {{ "..os.date().." }}")
            print("Player has died to "..txt)
            dead = true
    else do
        if game:GetService("Players")[player.Name].PlayerGui.Leaderboard.Frame[lp.Name].NameTag.TextColor3 == Color3.new(1,1,1) and dead then
            print("plrRespawn")
            dead = false
        end
    end
    end
end

--spawner blocks
local blockers = Instance.new("Folder", main)
blockers.Name = "Spawner Blockers"

local model = Instance.new("Model", blockers)
model.Name = "Blocker"

local base = Instance.new("Part", model)
model.PrimaryPart = base
base.Name = "Base"
base.Anchored = true
base.CanCollide = false
base.Size = Vector3.new(50,2,50)
base.Material = "ForceField"
base.Transparency = 0.25
base.Position = Vector3.new(0,3,0)

local side1 = base:Clone()
side1.Parent = model
side1.Name = "Side1"
side1.Size = Vector3.new(50,50,2)

local side2 = base:Clone()
side2.Parent = model
side2.Name = "Side2"
side2.Size = Vector3.new(2,50,50)

local side3 = base:Clone()
side3.Parent = model
side3.Name = "Side3"
side3.Size = Vector3.new(50,50,2)

local side4 = base:Clone()
side4.Parent = model
side4.Name = "Side4"
side4.Size = Vector3.new(2,50,50)

local top = base:Clone()
top.Name = "top"
top.Parent = model
function getMap()
    for i,v in pairs(game.Workspace.Map:GetChildren()) do
        if v:IsA("Model") then
            return v
        end
    end
end
function getDis()
    local text = ""
    for i,v in pairs(game.Workspace.Disaster:GetChildren()) do
        if v:IsA("Model") then
            text = text..v.Name.." "
        end
    end
    return text
end
local lastMap = getMap().Name
for i,v in pairs(getMap().EnemySpawns:GetChildren()) do
    local new = model:Clone()
    new.Parent = blockers
    new.PrimaryPart.Position = v.Position
end

model.Parent = game.ReplicatedStorage

function doSpawners()
    if lastMap ~= getMap().Name then
        wait(3)
        for i,v in pairs(blockers:GetChildren()) do
            print(v)
            v:Destroy()
            print(v)
            lastMap = getMap().Name
        end
        for i,v in pairs(getMap().EnemySpawns:GetChildren()) do
            local new = model:Clone()
            new.Parent = blockers
            new.PrimaryPart = new.Base
            new.PrimaryPart.Position = v.Position
        end
    end
    for i,v in pairs(blockers:GetChildren()) do
        for x,h in pairs(v:GetChildren()) do
            if h.Name == "Base" and (belowed or aboved) or (getDis() == "Yojimbo") then
                h.CanCollide = true
            else do
                h.CanCollide = false
            end
            end
            if h.Name ~= "Base" then
                h.CanCollide = v.Base.CanCollide
            end
        end
        v.Side1.CFrame = v.Base.CFrame + Vector3.new(0,24,24)
        v.Side2.CFrame = v.Base.CFrame + Vector3.new(24,24,0)
        v.Side3.CFrame = v.Base.CFrame + Vector3.new(0,24,-24)
        v.Side4.CFrame = v.Base.CFrame + Vector3.new(-24,24,0)
        v.top.CFrame = v.Base.CFrame + Vector3.new(0,48,0)
    end
end

local last = getDis()
function unanchor()
    if #game.Workspace.Disaster:GetChildren() == 0 then
        alrRan = false
        player.HumanoidRootPart.Anchored = false
    end
end
while game.Workspace:FindFirstChild("afker") do
    task.wait()
    
    --neon and yoji who can shoot hitscan under the map
    --highest priority (because these can kill you very easily)
    --pcall(complicatedones)
    local x = workspace.Disaster:FindFirstChild"Yojimbo"
    if x then
        x = x:FindFirstChild("Head", true)
        if x then
            local y = lp.Character and lp.Character:FindFirstChild"HumanoidRootPart"
            if y then y.CFrame = x.CFrame - Vector3.new(0,75,0) y.Velocity *= 0 continue end
        end
        
    end
    --high priority
    pcall(checkDisasters) --mage, ptb
    pcall(checkWorkspaceDeletables) --pizza, epic katana, happy

    --low priority
    pcall(checkBelow)
    pcall(checkAbove)
    pcall(unanchor)

    
    pcall(checkdead)
    pcall(doSpawners)
    

    if not spawned and (aboved or belowed) then
        barrier0.CanCollide = true
    else do
        barrier0.CanCollide = false
    end
    end

    if getDis() ~= last then
        alrRan = false
        comped = false
        last = getDis()
    end
end

afkGui:Destroy()


