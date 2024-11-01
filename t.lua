--[[



































































































return false, true, nil


























































































































































































]]
if not game:IsLoaded() then
    game.Loaded:Wait()
end

if game.CreatorId ~= 17219742 or not getgenv or not getgenv or not getupvalues or not require or not assert or not setmetatable or not loadstring or not isfile or not readfile or not delfile or not writefile or not isfolder or not delfolder or not listfiles or not makefolder or not firesignal or (getgenv and (getgenv().LoadedFluentCrazyDay or getgenv().RunedWating)) or (identifyexecutor and identifyexecutor():find("Fluxus")) then
    return
else
    warn("[Loading] - Anime Vanguards")
    getgenv().RunedWating = ""
end

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LobbyLoadingScreen") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") then
    repeat
        task.wait()
    until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LobbyLoadingScreen") == nil and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") == nil
end

if game:GetService("StarterPlayer"):WaitForChild("Modules"):FindFirstChild("Visuals") and game:GetService("StarterPlayer").Modules.Visuals:FindFirstChild("Cutscenes") then
    repeat
        task.wait()
    until not require(game:GetService("StarterPlayer").Modules.Visuals.Cutscenes.CutsceneHandler).IsPlayingCutscene
end

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoQiSz/Code/refs/heads/main/Gui/main.lua"))()
local SaveSettings = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoQiSz/Code/refs/heads/main/Gui/save.lua"))()
local InterfaceSettings = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoQiSz/Code/refs/heads/main/Gui/interfaces.lua"))()
local Filesfunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoQiSz/Code/refs/heads/main/Function/filemisc.lua"))()
local Otherfunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoQiSz/Code/refs/heads/main/Function/othermisc.lua"))()
local Configs = Fluent.Options
local Windows = Fluent:CreateWindow(
    {
        Title = "Anime Vanguards",
        SubTitle = "2.2 [YT @crazyday3693]",
        TabWidth = 130,
        Size = UDim2.fromOffset(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 1.5),
        Theme = "Darker",
        Acrylic = true,
        UpdateDate = "10/26/2024 - 2.2",
        UpdateLog = "● Support BoogieMove (Todu Ability)"..Filesfunction:Space().."\n",
        IconVisual = nil,
        BlackScreen = false,
        MinimizeKey = Enum.KeyCode.LeftAlt
    }
)

local Tabs_Main =
{
    [1] = Windows:AddTab({Title = "Join", Name = nil, Icon = "angle-double-small-up"}),
    [2] = Windows:AddTab({Title = "Game", Name = nil, Icon = "layers"}),
    [3] = Windows:AddTab({Title = "Lobby", Name = nil, Icon = "globe"}),
    [4] = Windows:AddTab({Title = "Macro", Name = nil, Icon = "folder"}),
    [5] = Windows:AddTab({Title = "Settings", Name = nil, Icon = "settings"})
}

local Tabs_Misc =
{
    [1] =
    {
        Tabs_Main[1]:AddSection("Main"),
        Tabs_Main[1]:AddSection("Raid"),
        Tabs_Main[1]:AddSection("Story"),
        Tabs_Main[1]:AddSection("Challenge"),
        Tabs_Main[1]:AddSection("Legend Stage")
    },
    [2] =
    {
        Tabs_Main[2]:AddSection("Main"),
        Tabs_Main[2]:AddSection("Misc"),
        Tabs_Main[2]:AddSection("Team"),
        Tabs_Main[2]:AddSection("Modifier"),
        Tabs_Main[2]:AddSection("Webhook")
    },
    [3] =
    {
        Tabs_Main[3]:AddSection("Crafter")
    },
    [4] =
    {
        Tabs_Main[4]:AddSection("Main"),
        Tabs_Main[4]:AddSection("Macro"),
        Tabs_Main[4]:AddSection("Select Macro")
    }
}


Fluent.Database =
{
    Signals = {
        Manager = {},
        Normal = {}
    },
    Boogies = {
        Select = nil,
        Start = nil,
    },
    Rewards = {
        Misc = {},
        Main = {},
    },
    Buttons = {},
    Notifys = {},

    Last_Waves = "0",
    Last_Units = "0",
    Last_Click = "0",

    Frame = {
        Modifier = {}
    },
    Mohato =
    {
        SellUnit = false,
        LastPosition = false,
        Position = false,

        Spawned = false,
        Placed = false,
        Action = {
            Action = {},
            Delete = function()
                for u, v in next, Fluent.Database.Mohato.Action.Action do
                    v:Destroy()
                end
            end,
            Create = function(t, p)
                local n, e =
                        (
                            t["Type"] == "SellUnit (Mohato)" and Color3.fromRGB(255, 0, 0)
                        )
                        or
                        (
                            t["Type"] == "SpawnUnit (Mohato)" and Color3.fromRGB(0, 255, 0)
                        )
                        or
                        (
                            t["Type"] == "UpgradeUnit (Mohato)" and Color3.fromRGB(255, 255, 0)
                        )
                        ,
                        Fluent.Database.Game.Instance

                local i =
                e(
                    "Highlight",
                    {
                        DepthMode = "AlwaysOnTop",
                        FillColor = n,
                        FillTransparency = 0.675,
                        OutlineColor = n,
                        OutlineTransparency = 0
                    }
                )
                local v =
                e(
                    "BillboardGui",
                    {
                        ExtentsOffset = Vector3.new(0, 1, 0),
                        Size = UDim2.new(1,200,1,30),
                        AlwaysOnTop = true
                    }
                )
                local w =
                e(
                    "TextLabel",
                    {
                        Parent = v,
                        Font = "GothamBold",
                        FontSize = "Size14",
                        TextWrapped = true,
                        Size = UDim2.new(1, 0, 1, 0),
                        TextYAlignment = "Top",
                        BackgroundTransparency = 1,
                        TextStrokeTransparency = 0.5,
                        TextColor3 = n,
                        Text = t["Type"]..": "..tostring(t["Unit"]).." ("..tostring(t["Money"])..")"
                    }
                )
                table.insert(
                    Fluent.Database.Mohato.Action.Action,
                    e(
                        "Part",
                        {
                            Position = p,
                            Material = "Glass",
                            CanCollide = false,
                            Parent = game:GetService("Players").LocalPlayer.Character,
                            Transparency = 0.975,
                            Size = Vector3.new(1.5, 1.5, 1.5),
                            CanTouch = false,
                            Anchored = true,
                        },
                        {i, v}
                    )
                )
            end
        }
    },
    _len = function(u)
        return
        {
            __len = function(t)
                local c = 0
                for n, r in next, t do
                    if not table.find(u or {}, n) then
                        c += 1
                    end
                end
                return c
            end
        }
    end,
    Game =
    {
        Reset = false,
        Lobby = {},
        Units = {},
        Click = function()
            local Virtual = game:GetService("VirtualInputManager")
            do
                Virtual:SendMouseButtonEvent(1,0,0,true,game,1)
                task.wait(0.125)
                Virtual:SendMouseButtonEvent(1065,0,0,true,game,1)
                task.wait(0.125)
                Virtual:SendMouseButtonEvent(532.5,0,0,true,game,1)
                task.wait(0.125)
                Virtual:SendMouseButtonEvent(1,599.25,0,true,game,1)
                task.wait(0.125)
                Virtual:SendMouseButtonEvent(1065,599.25,0,true,game,1)
                task.wait(0.125)
                Virtual:SendMouseButtonEvent(532.5,599.25,0,true,game,1)
                task.wait(0.125)
            end
        end,
        Instance = function(n, c, e)
            local m = Instance.new(n)
            for s, u in next, c or {} do
                m[s] = u
            end
            for y, v in next, e or {} do
                v.Parent = m
            end
            return m
        end
    },
    Macro =
    {
        Index = 0,
        Value = {
            Database =
            {
                World = "",
                Units = {}
            }
        },
        Files = function()
            return Filesfunction:ListFile("CrazyDay/Anime Vanguards/Macro","json")
        end,
        Status = "Status : None (0/0)",
        Action =
        {
            Action = {},
            Delete = function()
                for u, v in next, Fluent.Database.Macro.Action.Action do
                    v:Destroy()
                end
            end,
            Create = function(t, p, o)
                local m, n, e =
                        (
                            t["Type"] == "SellUnit" and t["Time"]
                        )
                        or
                        (
                            t["Type"] == "AutoAbility" and t["Time"]
                        )
                        or
                        (
                            t["Type"] == "BoogieMove" and (o and t["Unit"] or t["Selected"]["Unit"])
                        )
                        or
                        (
                            (t["Type"] == "ChangePriority" or t["Type"] == "UseAbility") and t["Value"]
                        ),
                        (
                            t["Type"] == "SellUnit" and Color3.fromRGB(255, 0, 0)
                        )
                        or
                        (
                            t["Type"] == "SpawnUnit" and Color3.fromRGB(0, 255, 0)
                        )
                        or
                        (
                            t["Type"] == "UpgradeUnit" and Color3.fromRGB(255, 255, 0)
                        )
                        or
                        (
                            t["Type"] == "ChangePriority" and Color3.fromRGB(100, 255, 255)
                        )
                        or
                        (
                            (t["Type"] == "UseAbility" or t["Type"] == "AutoAbility" or t["Type"] == "BoogieMove")  and Color3.fromRGB(255, 255, 255)
                        ),
                        Fluent.Database.Game.Instance
                do
                    p = CFrame.new(table.unpack(tostring(p):gsub(" ", ""):split(",")))
                end

                local i =
                e(
                    "Highlight",
                    {
                        DepthMode = "AlwaysOnTop",
                        FillColor = n,
                        FillTransparency = 0.675,
                        OutlineColor = n,
                        OutlineTransparency = 0
                    }
                )
                local v =
                e(
                    "BillboardGui",
                    {
                        ExtentsOffset = Vector3.new(0, 1, 0),
                        Size = UDim2.new(1,200,1,30),
                        AlwaysOnTop = true
                    }
                )
                local w =
                e(
                    "TextLabel",
                    {
                        Parent = v,
                        Font = "GothamBold",
                        FontSize = "Size14",
                        TextWrapped = true,
                        Size = UDim2.new(1, 0, 1, 0),
                        TextYAlignment = "Top",
                        BackgroundTransparency = 1,
                        TextStrokeTransparency = 0.5,
                        TextColor3 = n,
                        Text = t["Type"]..": "..(o and o or t["Unit"]).." ("..tostring(m and m or t["Money"])..")"
                    }
                )
                table.insert(
                    Fluent.Database.Macro.Action.Action,
                    e(
                        "Part",
                        {
                            CFrame = p,
                            Material = "Glass",
                            CanCollide = false,
                            Parent = game:GetService("Players").LocalPlayer.Character,
                            Transparency = 0.975,
                            Size = Vector3.new(1.5, 1.5, 1.5),
                            CanTouch = false,
                            Anchored = true,
                        },
                        {i, v}
                    )
                )
            end
        },
        Create = function()
            local n = Configs["File Name"].Value
            local s, e = pcall(
                function()
                    assert(isfile, "The executor doesn't support isfile")
                    assert(writefile, "The executor doesn't support writefile")
                    assert(not isfile(Otherfunction:FormatLocation(n)), "This file already create")
                    Filesfunction:CheckFile(Otherfunction:FormatLocation(n), {Database = {World = "", Units = {}}})
                    Fluent.Database.Macro.Refresh()
                    Configs["Macro File"]:SetValue(n)
                    Configs["File Name"]:SetValue("")
                end
            )
            if s then
                Fluent:Notify(
                    {
                        Title = "Successful Create",
                        SubContent = n..".json",
                        Disable = true,
                        Duration = 5
                    }
                )
            else
                e = tostring(e)
                if e:find(": ") then
                    e = e:split(": ")[2]
                end
                Fluent:Notify(
                    {
                        Title = "Unsuccessful Create",
                        SubContent = e,
                        Disable = true,
                        Duration = 5
                    }
                )
            end
        end,
        Delete = function()
            local n, b = Configs["Macro File"].Value, Fluent.Database.Macro
            local s, e = pcall(
                function()
                    assert(n, "Select macro file first")
                    assert(isfile, "The executor doesn't support isfile")
                    assert(delfile, "The executor doesn't support delfile")
                    assert(isfile(Otherfunction:FormatLocation(n)), "Can't find selected file")
                    Filesfunction:DeleteFile(Otherfunction:FormatLocation(n))
                    b.Refresh()
                    Configs["Macro File"]:SetValue(#b.Files() > 0 and b.Files()[#b.Files()] or nil)
                end
            )
            if s then
                Fluent:Notify(
                    {
                        Title = "Successful Delete",
                        SubContent = n..".json",
                        Disable = true,
                        Duration = 5
                    }
                )
            else
                e = tostring(e)
                if e:find(": ") then
                    e = e:split(": ")[2]
                end
                Fluent:Notify(
                    {
                        Title = "Unsuccessful Delete",
                        SubContent = e,
                        Disable = true,
                        Duration = 5
                    }
                )
            end
        end,
        Import = function()
            local d = {
                link = nil,
                name = Configs["Import Name"].Value
            }
            local s, e = pcall(
                function()
                    assert(isfile, "The executor doesn't support isfile")
                    assert(writefile, "The executor doesn't support writefile")
                    assert(not isfile(Otherfunction:FormatLocation(d.name)), "This file already create")
                    if not Configs["Import Link"].Value:find("https://raw.githubusercontent.com/") and Configs["Import Link"].Value:find("https://github.com/") then
                        d.link = Configs["Import Link"].Value:gsub("https://github.com", "https://raw.githubusercontent.com"):gsub("/blob", "")
                        d.link = game:HttpGet(d.link)
                    elseif Configs["Import Link"].Value:find("https://raw.githubusercontent.com/") or Configs["Import Link"].Value:find("https://cdn.discordapp.com/attachments/") then
                        d.link = game:HttpGet(Configs["Import Link"].Value)
                    elseif not Configs["Import Link"].Value:find("https://cdn.discordapp.com/attachments/") and not Configs["Import Link"].Value:find("https://raw.githubusercontent.com/") then
                        error("Mayk sure your link is correct", 9)
                    end
                    assert(d.link, "Can't to access the link")
                    assert(d.link:find([["Database":{]]), "Database doesn't match")
                    Filesfunction:CheckFile(Otherfunction:FormatLocation(d.name), d.link)
                    Fluent.Database.Macro.Refresh()
                    Configs["Import Link"]:SetValue("")
                    Configs["Import Name"]:SetValue("")
                end
            )
            if s then
                Fluent:Notify(
                    {
                        Title = "Successful Import",
                        SubContent = d.name..".json",
                        Disable = true,
                        Duration = 5
                    }
                )
            else
                e = tostring(e)
                if e:find(": ") then
                    e = e:split(": ")[2]
                end
                Fluent:Notify(
                    {
                        Title = "Unsuccessful Import",
                        SubContent = e,
                        Disable = true,
                        Duration = 5
                    }
                )
            end
        end,
        Export = function()
            local n = Configs["Macro File"].Value
            local s, e = pcall(
                function()
                    assert(n, "Select macro file first")
                    assert(isfile, "The executor doesn't support isfile")
                    assert(readfile, "The executor doesn't support readfile")
                    assert(isfile(Otherfunction:FormatLocation(n)), "Can't find selected file")
                    setclipboard(tostring(readfile(Otherfunction:FormatLocation(n))))
                end
            )
            if s then
                Fluent:Notify(
                    {
                        Title = "Successful Export",
                        SubContent = n..".json",
                        Disable = true,
                        Duration = 5
                    }
                )
            else
                e = tostring(e)
                if e:find(": ") then
                    e = e:split(": ")[2]
                end
                Fluent:Notify(
                    {
                        Title = "Unsuccessful Export",
                        SubContent = e,
                        Disable = true,
                        Duration = 5
                    }
                )
            end
        end,
        Refresh = function()
            local e, r, v = Fluent.Database.Macro.Files, Fluent.Database.Vanguards._StagesData, Otherfunction

            Configs["Macro File"]:SetValues(e())
            if Configs["Macro File"].Value and not isfile(v:FormatLocation(Configs["Macro File"].Value)) then
                Configs["Macro File"]:SetValue(nil)
            end
            for z = 1, #r("Story").Stage do
                local t =
                {
                    Raid = r("Raid").Stage[z] or "",
                    Story = r("Story").Stage[z] or "",
                    LegendStage = r("LegendStage").Stage[z] or ""
                }

                if Configs["Raid"..t.Raid] then
                    Configs["Raid"..t.Raid]:SetValues(e())
                    if Configs["Raid"..t.Raid].Value and not isfile(v:FormatLocation(Configs["Raid"..t.Raid].Value)) then
                       Configs["Raid"..t.Raid]:SetValue(nil)
                    end
                end
                if Configs["Story"..t.Story] then
                    Configs["Story"..t.Story]:SetValues(e())
                    if Configs["Story"..t.Story].Value and not isfile(v:FormatLocation(Configs["Story"..t.Story].Value)) then
                       Configs["Story"..t.Story]:SetValue(nil)
                    end
                end
                if Configs["Paragon"..t.Story] then
                    Configs["Paragon"..t.Story]:SetValues(e())
                    if Configs["Paragon"..t.Story].Value and not isfile(v:FormatLocation(Configs["Paragon"..t.Story].Value)) then
                       Configs["Paragon"..t.Story]:SetValue(nil)
                    end
                end
                if Configs["Infinite"..t.Story] then
                    Configs["Infinite"..t.Story]:SetValues(e())
                    if Configs["Infinite"..t.Story].Value and not isfile(v:FormatLocation(Configs["Infinite"..t.Story].Value)) then
                       Configs["Infinite"..t.Story]:SetValue(nil)
                    end
                end
                if Configs["Challenge"..t.Story] then
                    Configs["Challenge"..t.Story]:SetValues(e())
                    if Configs["Challenge"..t.Story].Value and not isfile(v:FormatLocation(Configs["Challenge"..t.Story].Value)) then
                       Configs["Challenge"..t.Story]:SetValue(nil)
                    end
                end
                if Configs["LegendStage"..t.LegendStage] then
                    Configs["LegendStage"..t.LegendStage]:SetValues(e())
                    if Configs["LegendStage"..t.LegendStage].Value and not isfile(v:FormatLocation(Configs["LegendStage"..t.LegendStage].Value)) then
                       Configs["LegendStage"..t.LegendStage]:SetValue(nil)
                    end
                end
            end
        end,
    },
    Vanguards =
    {
        _Yen = function()
            return getupvalues(require(game:GetService("StarterPlayer").Modules.Gameplay.PlayerYenHandler).GetYen)[1]
        end,
        _Slot = function()
            local l = {Data = {}, Unit = {}}
            local r = game:GetService("Players").LocalPlayer.PlayerGui[game.PlaceId == 16146832113 and "HUD" or "Hotbar"]
            local n

            for o = 1, 6 do
                if r.Main.Units[tostring(o)]:FindFirstChild("Locked") or r.Main.Units[tostring(o)]:FindFirstChild("UnitTemplate") == nil then
                    continue
                end
                    n = r.Main.Units[tostring(o)].UnitTemplate.Holder.Main.UnitName.Text
                    table.insert(l.Unit, n)

                if game.PlaceId ~= 16146832113 then
                    local c = require(game:GetService("StarterPlayer").Modules.Interface.Loader.HUD.Units)._Cache[o]

                    l.Data[tostring(o)] =
                    {
                        Name = n,
                        Level = c.Level,
                        Trait = c.Trait,
                        SubTrait = c.SubTrait,
                        Takedowns = c.Takedowns,
                        Worthiness = c.Worthiness,
                        Ascensions = c.Ascensions,
                        Experience = c.Experience,
                        MaxExperience = c.MaxExperience
                    }
                end
            end
            return l
        end,
        _MainLobby = function()
            for u, v in next, game:GetService("Workspace").MainLobby:GetChildren() do
                if v:IsA("Folder") and v.Name == "Lobby" then
                    return v
                end
            end
        end,
        _Modifiers = function()
            return {"Champions", "Dodge", "Drowsy", "Exploding", "Fast", "Immunity", "Quake", "Regen", "Revitalize", "Shielded", "Strong", "Thrice"}
        end,
        _ItemsData = function()
            local e = {"TraitRerolls"}
            for u, r in next, require(game:GetService("ReplicatedStorage").Modules.Data.ItemsData.MiscItems) do
                table.insert(e, u)
            end
            for u, t in next, require(game:GetService("ReplicatedStorage").Modules.Data.ItemsData.EssenceStones) do
                table.insert(e, u)
            end
            return e
        end,
        _StagesData = function(u)
            local m = {Acts = {}, Stage = {}}
            for r, v in next, game:GetService("ReplicatedStorage").Modules.Data.StagesData[u]:GetChildren() do
                local y = require(v[v.Name])
                table.insert(m.Stage, y.Name)

                if #m.Acts == 0 then
                    for o = 1, #v.Acts:GetChildren() do
                        table.insert(m.Acts, v.Acts:GetChildren()[o].Name)
                    end
                end
            end
            return m
        end,
        _StagesName = function(y, n)
            for u, r in next, game:GetService("ReplicatedStorage").Modules.Data.StagesData[y]:GetChildren() do
                local v = require(r[r.Name])
                if v.Name == n then
                    return r.Name
                end
            end
        end,
        _ActiveUnits = function()
            for u, r in next, getupvalues(require(game:GetService("StarterPlayer").Modules.Gameplay.UnitManager.UnitManagerHandler).ShowUnitManager) do
                if type(r) == "table" and r.GetAllPlacedUnits then
                    for y, v in next, getupvalues(r.GetAllPlacedUnits) do
                        if type(v) == "table"  and v._ActiveUnits then
                            return v._ActiveUnits
                        end
                    end
                end
            end
            return {}
        end,
        _LobbyHandler = function()
            return require(game:GetService("StarterPlayer").Modules.Interface.Loader.Windows.Lobby.LobbyHandler)
        end,
        _EssenceStones = function(i)
            local e ={}
            for u, t in next, require(game:GetService("ReplicatedStorage").Modules.Data.ItemsData.EssenceStones) do
                if not table.find(i or {}, u) then
                    table.insert(e, u)
                end
            end
            return e
        end,
        _CurrencyHandler = function()
            return game.PlaceId == 16146832113 and getupvalues(require(game:GetService("StarterPlayer").Modules.Gameplay.CurrencyHandler).GetCurrencies)[1] or getupvalues(require(game:GetService("StarterPlayer").Modules.Gameplay.Player.CurrencyHandler).GetCurrencies)[1]
        end,
        _InventoryHandler = function(u)
            local c = game.PlaceId == 16146832113 and require(game:GetService("StarterPlayer").Modules.Interface.Loader.Windows.InventoryHandler).Cache
                      or getupvalues(require(game:GetService("StarterPlayer").Modules.Gameplay.Player.InventoryHandler).GetItemFromInventoryByName)[1]

            for y, r in next, c do
                if (game.PlaceId == 16146832113 and r.Data.Name == u) or r.Name == u then
                    return tonumber(r.Amount)
                end
            end
            return 0
        end,
        _CurrentPlaceUnit = function(n)
            local t = {
                Placed = {},
                MaxPlace = 1
            }
            for u, v in next, Fluent.Database.Vanguards._ActiveUnits() do
                if v.Player == game:GetService("Players").LocalPlayer and v.Data.Name == n then
                    t.MaxPlace = v.Data.MaxPlacements
                    table.insert(t.Placed, u)
                end
            end
            return t
        end
    }
}

do
    setmetatable(Fluent.Database.Macro.Value, Fluent.Database._len({"Database"}))
    if not getgenv().StartTime then
           getgenv().StartTime = tick()
    end
    Filesfunction:CheckFolder("CrazyDay")
    Filesfunction:CheckFolder("CrazyDay/Anime Vanguards")
    Filesfunction:CheckFolder("CrazyDay/Anime Vanguards/Macro")
    Filesfunction:CheckFile("CrazyDay/Anime Vanguards/Macro/Starter.json", {Database = {World = "",Units = {}}})

    Tabs_Misc[4][3].Container.Parent.Visible = false

    local function _CreatingDropdown(n, v, t)
        for x = 1, #Fluent.Database.Vanguards._StagesData(n).Stage do
            local World = Fluent.Database.Vanguards._StagesData(n).Stage[x]
            if not Fluent.Database.Frame[v] then
                   Fluent.Database.Frame[v] = Tabs_Misc[4][3]:AddMiniParagraph(
                        {
                            Title = t
                        }
                    )
            end
                   Tabs_Misc[4][3]:AddDropdown(v..World,
                        {
                            Title = World,
                            Values = Fluent.Database.Macro.Files(),
                            AllowNull = true
                        }
                    )
            end
    end
    _CreatingDropdown("Raid","Raid","Raid")
    _CreatingDropdown("Story","Story","Story")
    _CreatingDropdown("Story","Infinite","Infinite")
    _CreatingDropdown("Story","Paragon","Paragon")
    _CreatingDropdown("Story","Challenge","Challenge")
    _CreatingDropdown("LegendStage","LegendStage","Legend Stage")
    Fluent.Database.Frame["Select Macro"] = Tabs_Misc[4][3]:AddMiniParagraph(
        {
            Title = "Select Macro (Disable)"
        }
    )
    for x = 1, #Fluent.Database.Vanguards._Modifiers() do
        table.insert(
            Fluent.Database.Frame.Modifier,
            Tabs_Misc[2][4]:AddMiniParagraph(
                {
                    Title = "Priority "..tostring(x)
                }
            )
        )
        table.insert(
            Fluent.Database.Frame.Modifier,
            Tabs_Misc[2][4]:AddDropdown("Modifier "..tostring(x),
                {
                    Title = "Select",
                    Values = Fluent.Database.Vanguards._Modifiers(),
                    Default = x
                }
            )
        )
    end
    for u, r in next, Fluent.Database.Frame.Modifier do
        r.Frame.Visible = false
    end
end

Tabs_Misc[1][1]:AddToggle("Auto Start",
    {
        Title = "Auto Start",
        Description = "Start the game after creating the room",
        Default = true
    }
)
Tabs_Misc[1][1]:AddToggle("Friends Only",
    {
        Title = "Friends Only",
        Description = "Use a friend only when creating a room",
        Default = true
    }
)
Tabs_Misc[1][1]:AddSlider("Join Delay",
    {
        Title = "Join In 1 Second",
        Default = 1,
        Min = 0,
        Max = 30,
        Rounding = 0,
        Callback = function(n)
            task.spawn(
                function()
                    repeat
                        task.wait()
                    until Configs["Join Delay"]
                          Configs["Join Delay"]:SetTitle("Join In "..tostring(n).." Second")
                end
            )
        end
    }
)
Fluent.Database.Buttons["Return Lobby"] = Tabs_Misc[1][1]:AddButton(
    {
        Title = "Return to Lobby",
        Callback = function()
            Windows:Dialog(
                {
                    Title = "Lobby",
                    Content = "Do you want to teleport to the lobby?",
                    Buttons = {
                        {Title = "Yes", Callback = function()
                            game:GetService("ReplicatedStorage").Networking.TeleportEvent:FireServer("Lobby")
                        end},
                        {Title = "No"}
                    }
                }
            )
        end
    }
)
Tabs_Misc[1][2]:AddDropdown("Raids Act",
    {
        Title = "Selecte Act",
        Values = Fluent.Database.Vanguards._StagesData("Raid").Acts,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][2]:AddDropdown("Raids Stage",
    {
        Title = "Selecte Stage",
        Values = Fluent.Database.Vanguards._StagesData("Raid").Stage,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][2]:AddToggle(
    "Auto Join Hights (Raids)",
    {
        Title = "Auto Join Raids (Hights)",
        Default = false,
        Callback = function(v)
            if v then
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Join Normal (Raids)"]
                              Configs["Auto Join Normal (Raids)"]:Lock()
                    end
                )
            else
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Join Normal (Raids)"]
                              Configs["Auto Join Normal (Raids)"]:UnLock()
                    end
                )
            end
        end
    }
)
Tabs_Misc[1][2]:AddToggle(
    "Auto Join Normal (Raids)",
    {
        Title = "Auto Join Raids (Normal)",
        Default = false,
        Callback = function(n)
            if n then
                Configs["Auto Join Hights (Raids)"]:Lock()
            else
                Configs["Auto Join Hights (Raids)"]:UnLock()
            end
        end
    }
)
Tabs_Misc[1][3]:AddDropdown("Story Difficulty",
    {
        Title = "Difficulty",
        Values = {"Normal", "Nightmare"},
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][3]:AddDropdown("Story Act",
    {
        Title = "Selecte Act",
        Values = Fluent.Database.Vanguards._StagesData("Story").Acts,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][3]:AddDropdown("Story Stage",
    {
        Title = "Selecte Stage",
        Values = Fluent.Database.Vanguards._StagesData("Story").Stage,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][3]:AddToggle(
    "Auto Join Hights (Story)",
    {
        Title = "Auto Join Story (Hights)",
        Default = false,
        Callback = function(v)
            if v then
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Join Normal (Story)"]
                              Configs["Auto Join Normal (Story)"]:Lock()
                    end
                )
            else
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Join Normal (Story)"]
                              Configs["Auto Join Normal (Story)"]:UnLock()
                    end
                )
            end
        end
    }
)
Tabs_Misc[1][3]:AddToggle(
    "Auto Join Normal (Story)",
    {
        Title = "Auto Join Story (Normal)",
        Description = "If you select (Paragon Mode), It will select the highest level",
        Default = false,
        Callback = function(v)
            if v then
                Configs["Auto Join Hights (Story)"]:Lock()
            else
                Configs["Auto Join Hights (Story)"]:UnLock()
            end
        end
    }
)
Tabs_Misc[1][4]:AddDropdown("Ignore Challenge World",
    {
        Title = "Ignore Challenge World",
        Values = Fluent.Database.Vanguards._StagesData("Story").Stage,
        Multi = true,
        Default = {}
    }
)
Tabs_Misc[1][4]:AddDropdown("Ignore Challenge Modifier",
    {
        Title = "Ignore Challenge Modifier",
        Values = Fluent.Database.Vanguards._Modifiers(),
        Multi = true,
        Default = {}
    }
)
Tabs_Misc[1][4]:AddDropdown("Select Challenge Rewards",
    {
        Title = "Select Challenge Rewards",
        Values = Fluent.Database.Vanguards._ItemsData(),
        Multi = true,
        Default = {}
    }
)
Tabs_Misc[1][4]:AddToggle("Auto Join Challenge",
    {
        Title = "Auto Join Challenge",
        Default = false
    }
)
Tabs_Misc[1][4]:AddToggle("Auto Lobby Challenge",
    {
        Title = "Auto Lobby Challenge",
        Description = "Automatically teleport to lobby when half hourly challenge is change",
        Default = false
    }
)
Tabs_Misc[1][5]:AddDropdown("Legend Stage Act",
    {
        Title = "Selecte Act",
        Values = Fluent.Database.Vanguards._StagesData("LegendStage").Acts,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][5]:AddDropdown("Legend Stage Stage",
    {
        Title = "Selecte Stage",
        Values = Fluent.Database.Vanguards._StagesData("LegendStage").Stage,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[1][5]:AddToggle("Auto Join Legend Stage",
    {
        Title = "Auto Join Legend Stage",
        Default = false
    }
)
Tabs_Misc[2][1]:AddToggle("Auto Skip",
    {
        Title = "Auto Skip",
        Description = "Automatically skip/start game When the wave skip, show",
        Default = false
    }
)
Tabs_Misc[2][1]:AddToggle("Auto Next",
    {
        Title = "Auto Next",
        Description = "Automatically play the next act after the game finish",
        Default = false
    }
)
Tabs_Misc[2][1]:AddToggle("Auto Retry",
    {
        Title = "Auto Retry",
        Description = "Automatically retry act after the game finish",
        Default = false
    }
)
Tabs_Misc[2][1]:AddToggle("Auto Leave",
    {
        Title = "Auto Leave",
        Default = false
    }
)
Tabs_Misc[2][2]:AddDropdown("Select Unit (Sell)",
    {
        Title = "Select Unit",
        Values = Fluent.Database.Vanguards._Slot().Unit,
        Multi = true,
        Default = {}
    }
)
Tabs_Misc[2][2]:AddSlider("Select Wave (Sell / Leave)",
    {
        Title = "Select Wave",
        Default = 1,
        Min = 1,
        Max = 1000,
        Rounding = 0
    }
)
Tabs_Misc[2][2]:AddToggle("Auto Sell (Select Unit)",
    {
        Title = "Auto Sell",
        Description = "Automatically sell all selected units on the selected wave,\nIf you enabled auto sell with macro record the macro will not record select units",
        Default = false,
        Callback = function(v)
            if v then
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Leave Select Wave"]
                              Configs["Auto Leave Select Wave"]:Lock()
                    end
                )
            else
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Leave Select Wave"]
                              Configs["Auto Leave Select Wave"]:UnLock()
                    end
                )
            end
        end
    }
)
Tabs_Misc[2][2]:AddToggle("Auto Leave Select Wave",
    {
        Title = "Auto Leave",
        Description = "Automatically teleport to lobby on the selected wave",
        Default = false,
        Callback = function(v)
            if v then
                Configs["Auto Sell (Select Unit)"]:Lock()
            else
                Configs["Auto Sell (Select Unit)"]:UnLock()
            end
        end
    }
)
Tabs_Misc[2][2]:AddMiniParagraph(
    {
        Title = "Mohato"
    }
)
Tabs_Misc[2][2]:AddDropdown("Select Unit (Mohato)",
    {
        Title = "Select Unit",
        Values = Fluent.Database.Vanguards._Slot().Unit,
        Multi = false,
        Default = 1
    }
)
Tabs_Misc[2][2]:AddToggle("Auto Mohato",
    {
        Title = "Auto Mohato",
        Description = "When Mohato spawns, will wait until he is attackable and place the selected unit near him",
        Default = false,
        Callback = function(v)
            if v then
                Configs["Select Unit (Mohato)"]:Lock()
            else
                Configs["Select Unit (Mohato)"]:UnLock()
            end
        end
    }
)
Tabs_Misc[2][2]:AddSlider("Unit Max Upgrade",
    {
        Title = "Unit Max Upgrade",
        Default = 1,
        Min = 0,
        Max = 15,
        Rounding = 0
    }
)
Tabs_Misc[2][3]:AddDropdown("Raid Team",
    {
        Title = "Raid",
        Values = {"Team1", "Team2", "Team3", "Team4", "Team5"},
        Multi = false,
        AllowNull = true
    }
)
Tabs_Misc[2][3]:AddDropdown("Story Team",
    {
        Title = "Story",
        Values = {"Team1", "Team2", "Team3", "Team4", "Team5"},
        Multi = false,
        AllowNull = true
    }
)
Tabs_Misc[2][3]:AddDropdown("Infinite Team",
    {
        Title = "Infinite",
        Values = {"Team1", "Team2", "Team3", "Team4", "Team5"},
        Multi = false,
        AllowNull = true
    }
)
Tabs_Misc[2][3]:AddDropdown("Paragon Team",
    {
        Title = "Paragon",
        Values = {"Team1", "Team2", "Team3", "Team4", "Team5"},
        Multi = false,
        AllowNull = true
    }
)
Tabs_Misc[2][3]:AddDropdown("Challenge Team",
    {
        Title = "Challenge",
        Values = {"Team1", "Team2", "Team3", "Team4", "Team5"},
        Multi = false,
        AllowNull = true
    }
)
Tabs_Misc[2][3]:AddDropdown("Legend Stage Team",
    {
        Title = "Legend Stage",
        Values = {"Team1", "Team2", "Team3", "Team4", "Team5"},
        Multi = false,
        AllowNull = true
    }
)
Tabs_Misc[2][3]:AddToggle("Auto Change Team",
    {
        Title = "Auto Change Team",
        Description = "Automatically change your team before joining a room",
        Default = false
    }
)
Tabs_Misc[2][4]:AddButton(
    {
        Title = "Select Modifier",
        Description = "Click to Enable/Disable (Select Modifier)",
        Callback = function()
            local o = false
            for u, r in next, Fluent.Database.Frame.Modifier do
                o = r.Frame.Visible
                r.Frame.Visible = not r.Frame.Visible
            end
            task.delay(0.075, function()
                if o then
                    local Task = Tabs_Misc[2][4].Container.Parent.Parent
                    Task.CanvasPosition = Vector2.new(0, Task.CanvasPosition.Y - Tabs_Misc[2][4].Container.Parent.Size.Y.Offset)
                end
            end)
        end
    }
)
Tabs_Misc[2][4]:AddToggle("Auto Choose Modifier",
    {
        Title = "Auto Choose Modifier",
        Description = "Automatically select modifiers by priority",
        Default = false,
        Callback = function(v)
            if not v or game.PlaceId == 16146832113 or (game.PlaceId ~= 16146832113 and #game:GetService("Players").LocalPlayer.PlayerGui.Frames.Modifiers.Main:GetChildren() < 3) then
                return
            end
        end
    }
)
Tabs_Misc[2][5]:AddInput("Webhook Id",
    {
        Title = "Webhook Id",
        Placeholder = "Id.",
        Numeric = true,
        Finished = false
    }
)
Tabs_Misc[2][5]:AddInput("Webhook Url",
    {
        Title = "Webhook Url",
        Placeholder = "URL.",
        Numeric = false,
        Finished = false
    }
)
Tabs_Misc[2][5]:AddToggle("Ping Webhook",
    {
        Title = "Ping Webhook",
        Description = "@Your Discord Id, If the rewards have an (Exclusive or Sercret)",
        Default = false
    }
)
Tabs_Misc[2][5]:AddToggle("Send Webhook",
    {
        Title = "Send Webhook",
        Description = "Send a notifaction to your Discord when the game ends, displaying information about the match and what rewards you've received",
        Default = false
    }
)

Tabs_Misc[3][1]:AddDropdown("Select Essence Stone",
    {
        Title = "Select Essence Stone",
        Values = Fluent.Database.Vanguards._EssenceStones({"Green Essence Stone", "Rainbow Essence Stone"}),
        Multi = true,
        Default = {}
    }
)
Tabs_Misc[3][1]:AddToggle("Auto Craft Essence Stone",
    {
        Title = "Auto Craft Essence Stone",
        Default = false,
        Callback = function(v)
            if v then
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Lobby Green Essence Stone"]
                              Configs["Auto Lobby Green Essence Stone"]:UnLock()
                    end
                )
            else
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Configs["Auto Lobby Green Essence Stone"]
                              Configs["Auto Lobby Green Essence Stone"]:SetValue(false)
                              Configs["Auto Lobby Green Essence Stone"]:Lock()
                    end
                )
            end
        end
    }
)
Tabs_Misc[3][1]:AddToggle("Auto Lobby Green Essence Stone",
    {
        Title = "Auto Lobby Green Essence Stone",
        Default = false,
        Description = "Automatically teleport to lobby when you reached maximum amout of Green Essence Stone ("..tostring(Fluent.Database.Vanguards._InventoryHandler("Green Essence Stone")).."/100)"
    }
)

Tabs_Misc[4][1]:AddMiniParagraph(
    {
        Title = "Status"
    }
)
Fluent.Database.Buttons["Macro Status"] = Tabs_Misc[4][1]:AddParagraph(
    {
        Title = Fluent.Database.Macro.Status,
        Content = "\nGame Time : 0.00"
    }
)
Tabs_Misc[4][1]:AddToggle("Macro Status",
    {
        Title = "Macro Status",
        Description = "Toggle to show (Macro Status)",
        Default = true,
        Callback = function(v)
            Fluent.Database.Buttons["Macro Status"].Frame.Visible = v
        end
    }
)
Tabs_Misc[4][1]:AddMiniParagraph(
    {
        Title = "Manage"
    }
)
Tabs_Misc[4][1]:AddDropdown("Macro File",
    {
        Title = "Select File",
        Values = Fluent.Database.Macro.Files(),
        Default = "Starter",
        Callback = function()
            table.clear(Fluent.Database.Macro.Value)
                        Fluent.Database.Macro.Value.Database = {World = "",Units = {}}
        end
    }
)
Tabs_Misc[4][1]:AddInput("File Name",
    {
        Title = "Create Name",
        Placeholder = "File name here...",
        Default = ""
    }
)
Tabs_Misc[4][1]:AddMiniParagraph(
    {
        Title = "Button"
    }
)
Fluent.Database.Buttons["Equip Units"] = Tabs_Misc[4][1]:AddButton(
    {
        Title = "Equip Units",
        Description = "Equip all units in the selected macro",
        Callback = function()
            Windows:Dialog(
                {
                    Title = "Equip",
                    Content = "Are you sure to equip all units in the selected macro?",
                    Buttons = {
                        {Title = "Yes", Callback = EquipUnits},
                        {Title = "No"}
                    }
                }
            )
        end
    }
)
Fluent.Database.Buttons["Craete Macro"] = Tabs_Misc[4][1]:AddButton(
    {
        Title = "Create Macro File",
        Callback = function()
            Windows:Dialog(
                {
                    Title = "Create",
                    Content = string.format("Are you sure to create the ".."%s.json", Configs["File Name"].Value),
                    Buttons = {
                        {Title = "Yes", Callback = Fluent.Database.Macro.Create},
                        {Title = "No"}
                    }
                }
            )
        end
    }
)
Fluent.Database.Buttons["Delete Macro"] = Tabs_Misc[4][1]:AddButton(
    {
        Title = "Delete Select Macro",
        Callback = function()
            Windows:Dialog(
                {
                    Title = "Delete",
                    Content = string.format("Are you sure to delete the ".."%s.json", Configs["Macro File"].Value),
                    Buttons = {
                        {Title = "Yes", Callback = Fluent.Database.Macro.Delete},
                        {Title = "No"}
                    }
                }
            )
        end
    }
)
Fluent.Database.Buttons["Export Macro"] = Tabs_Misc[4][1]:AddButton(
    {
        Title = "Export Select Macro",
        Callback = function()
            Windows:Dialog(
                {
                    Title = "Export",
                    Content = string.format("Are you sure to export the ".."%s.json", Configs["Macro File"].Value),
                    Buttons = {
                        {Title = "Yes", Callback = Fluent.Database.Macro.Export},
                        {Title = "No"}
                    }
                }
            )
        end
    }
)
Tabs_Misc[4][1]:AddMiniParagraph(
    {
        Title = "Import"
    }
)
Tabs_Misc[4][1]:AddInput("Import Link",
    {
        Title = "Import Link",
        Placeholder = "Github or Discord Link...",
        Default = ""
    }
)
Tabs_Misc[4][1]:AddInput("Import Name",
    {
        Title = "Import Name",
        Placeholder = "Import name here...",
        Default = ""
    }
)
Fluent.Database.Buttons["Import Macro"] = Tabs_Misc[4][1]:AddButton(
    {
        Title = "Import Macro",
        Callback = function()
            Windows:Dialog(
                {
                    Title = "Import",
                    Content = string.format("Are you sure to import the ".."%s.json", Configs["Import Name"].Value),
                    Buttons = {
                        {Title = "Yes", Callback = Fluent.Database.Macro.Import},
                        {Title = "No"}
                    }
                }
            )
        end
    }
)
Tabs_Misc[4][2]:AddDropdown("Record Type",
    {
        Title = "Record Type",
        Values = {"Hybrid", "Money", "Time"},
        Default = "Hybrid"
    }
)
Tabs_Misc[4][2]:AddToggle(
    "Macro Record",
    {
        Title = "Record Macro",
        Description =  "Experiencing issues with the recorded macro? Try not to press upgrade to early, place units to close to each other",
        Default = false,
        Callback = function(v)
            if not v then
                Fluent.Database.Macro.Action.Delete()
            elseif v and #Fluent.Database.Macro.Value > 0 then
                local t = Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                if t["Type"] == "BoogieMove" then
                    Fluent.Database.Macro.Action.Create(t, t["CFrame"])
                    Fluent.Database.Macro.Action.Create(t, t["Selected"]["CFrame"], t["Selected"]["Unit"])
                else
                    Fluent.Database.Macro.Action.Create(t, t["CFrame"])
                end
            end
        end
    }
)
Tabs_Misc[4][2]:AddSlider("Macro Delay",
    {
        Title = "Play Back Delay",
        Default = 0.125,
        Min = 0,
        Max = 10,
        Rounding = 3
    }
)
Tabs_Misc[4][2]:AddToggle("Macro Play",
    {
        Title = "Play Back Macro",
        Default = false
    }
)
Fluent.Database.Buttons["Select Macro"] = Tabs_Misc[4][2]:AddButton(
    {
        Title = "Select Macro",
        Description = "Click to Enable/Disable (Select Macro)",
        Callback = function()
            Tabs_Misc[4][3].Container.Parent.Visible = not Tabs_Misc[4][3].Container.Parent.Visible

            Fluent.Database.Buttons["Select Macro"].Frame.Parent = not Tabs_Misc[4][3].Container.Parent.Visible and Tabs_Misc[4][2].Container or Tabs_Misc[4][3].Container

            task.delay(0.075, function()
                local Task = Tabs_Misc[4][3].Container.Parent.Parent
                Task.CanvasPosition = Vector2.new(0, Task.AbsoluteCanvasSize.Y - Task.AbsoluteWindowSize.Y)
            end)
        end
    }
)

do
    Windows:SelectTab(1)
    Windows:Minimize("Loaded")
    getgenv().RunedWating = nil

    InterfaceSettings:SetLibrary(Fluent)
    InterfaceSettings:SetFolder("CrazyDay/Anime Vanguards/"..game:GetService("Players"):GetUserIdFromNameAsync(game:GetService("Players").LocalPlayer.Name))
    InterfaceSettings:BuildInterfaceSection(Tabs_Main[#Tabs_Main])

    SaveSettings:SetLibrary(Fluent)
    SaveSettings:SetFolder("CrazyDay/Anime Vanguards/"..game:GetService("Players"):GetUserIdFromNameAsync(game:GetService("Players").LocalPlayer.Name))
    SaveSettings:SetIgnoreIndexes({"File Name","Macro Record","Import Name","Import Link"})
    SaveSettings:IgnoreThemeSettings()
    SaveSettings:BuildConfigSection(Tabs_Main[#Tabs_Main])

    Fluent.Database.Signals["Afk"] = game:GetService("Players").LocalPlayer.Idled:Connect(
        function(time)
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
        end
    )
end

task.spawn(
    function()
        while true and task.wait() do
            if Fluent.Unloaded then
                Fluent.Database.Macro.Action.Delete()
                Fluent.Database.Mohato.Action.Delete()
                for u = 1, #Fluent.Database.Signals do
                    if type(Fluent.Database.Signals[u]) == "table" then
                        for r, y in next, Fluent.Database.Signals[u] do
                            if type(y) == "userdata" then
                                y:Disconnect()
                                y = nil
                            end
                        end
                    elseif type(Fluent.Database.Signals[u]) == "userdata" then
                        Fluent.Database.Signals[u]:Disconnect()
                        Fluent.Database.Signals[u] = nil
                    end
                end
                for u, v in next, Fluent.Database.Signals do
                    if type(v) == "table" then
                        for r, y in next, v do
                            if type(y) == "userdata" then
                                y:Disconnect()
                                y = nil
                            end
                        end
                    elseif type(v) == "userdata" then
                        v:Disconnect()
                        v = nil
                    end
                end
                break
            end
        end
    end
)

task.spawn(
    function()
        while true and task.wait() do
            if Fluent.Unloaded then
                break
            else
                local c, b = Configs, Fluent.Database.Buttons

                --# Export
                if c["Macro File"].Value and b["Export Macro"].IsLocked then
                    b["Export Macro"]:UnLock()
                elseif not c["Macro File"].Value and not b["Export Macro"].IsLocked then
                    b["Export Macro"]:Lock()
                end

                --# Import
                if #c["Import Link"].Value >= 1 and #c["Import Name"].Value >= 1 and b["Import Macro"].IsLocked then
                    b["Import Macro"]:UnLock()
                elseif (c["Import Link"].Value == 0 or #c["Import Name"].Value == 0) and not b["Import Macro"].IsLocked then
                    b["Import Macro"]:Lock()
                end

                --# Webhook
                if #c["Webhook Url"].Value >= 1 and c["Send Webhook"].IsLocked then
                    c["Send Webhook"]:UnLock()
                elseif #c["Webhook Id"].Value >= 1 and c["Ping Webhook"].IsLocked then
                    c["Ping Webhook"]:UnLock()
                elseif #c["Webhook Url"].Value == 0 and not c["Send Webhook"].IsLocked then
                    c["Send Webhook"]:Lock()
                elseif #c["Webhook Id"].Value == 0 and not c["Ping Webhook"].IsLocked then
                    c["Ping Webhook"]:Lock()
                end

                if c["Macro Record"].Value or c["Macro Play"].Value then

                    --# Manage
                    for r, v in next, {"File Name", "Macro File"} do
                        if not c[v].IsLocked then
                            c[v]:Lock()
                        end
                    end

                    --# Button
                    for r, v in next, {"Delete Macro", "Craete Macro"} do
                        if not b[v].IsLocked then
                            b[v]:Lock()
                        end
                    end

                    --# Macros
                    if c["Macro Play"].Value and not c["Macro Record"].IsLocked then
                        c["Macro Record"]:Lock()
                    end
                    if c["Macro Record"].Value and not c["Macro Play"].IsLocked then
                        c["Macro Play"]:Lock()
                    end
                else
                    --# Button
                    if #c["File Name"].Value >= 1 and b["Craete Macro"].IsLocked then
                        b["Craete Macro"]:UnLock()
                    elseif #c["File Name"].Value == 0 and not b["Craete Macro"].IsLocked then
                        b["Craete Macro"]:Lock()
                    end
                    if c["Macro File"].Value and b["Delete Macro"].IsLocked then
                        b["Delete Macro"]:UnLock()
                    elseif not c["Macro File"].Value and not b["Delete Macro"].IsLocked then
                        b["Delete Macro"]:Lock()
                    end

                    --# Manage / Macro
                    for r, v in next, {"File Name", "Macro File", "Macro Play", "Macro Record"} do
                        if c[v].IsLocked then
                            c[v]:UnLock()
                        end
                    end
                end
            end
        end
    end
)

Fluent.Database.Signals["Notification of Game"] = game:GetService("Players").LocalPlayer.PlayerGui.Notification.Main.ChildAdded:Connect(
    function(child)
        local t = child.Label.Text
        if t == "Teleporting players..." then
            Fluent.Unloaded = true
            Fluent:Destroy()
        else
            if t:match("cannot be retried!") then
                Fluent.Database["Cannot be retry"] = true
            elseif t == "Unable to go to next act!" then
                Fluent.Database["Cannot be next act"] = true
            elseif t == "Summon banner has been reset!" then
                Fluent.Database["Summon Banner just changed"] = true
            elseif t == "Half Hourly Challenge has been reset!" then
                Fluent.Database["Half Hourly Challenge just changed"] = true
            elseif t:match("You have already completed this challenge") and Configs["Auto Join Challenge"].Value then
                Fluent.Database["Challenge Cooldown"] = true
            end
        end
    end
)

if game.PlaceId == 16146832113 then
    Fluent.Database.Buttons["Return Lobby"]:Lock()
    local function UnitWindowHandler(n)
        local h = {}

        for r, v in next, require(game:GetService("StarterPlayer").Modules.Interface.Loader.Windows.UnitWindowHandler)._Cache do
            if v.UnitData.Name == n then
                table.insert(h, v)
            end
        end
        table.sort(h, function(a, b)
            return tonumber(a.Level) >= tonumber(b.Level)
        end)
        return #h > 0 and h[1] or nil
    end

    function EquipUnits()
        local u, l = {}
        local s, e = pcall(
            function()
                assert(Configs["Macro File"].Value, "Select macro file first")
                assert(isfile, "The executor doesn't support isfile")
                assert(delfile, "The executor doesn't support delfile")
                assert(isfolder, "The executor doesn't support isfolder")
                assert(readfile, "The executor doesn't support readfile")
                assert(delfolder, "The executor doesn't support delfolder")
                assert(listfiles, "The executor doesn't support listfiles")
                assert(writefile, "The executor doesn't support writefile")
                assert(makefolder, "The executor doesn't support makefolder")
                l = game:GetService("HttpService"):JSONDecode(readfile(Otherfunction:FormatLocation(Configs["Macro File"].Value)))
                setmetatable(l, Fluent.Database._len({"Database"}))
                assert(#l > 0, "Make sure you're already record macro")
                assert(l.Database.Units, "The units database is empty")
                for x = 1, #l do
                    if UnitWindowHandler(l.Database.Units[x]) then
                        if #u == 0 then
                            game:GetService("ReplicatedStorage").Networking.Units.EquipEvent:FireServer("UnequipAll")
                            task.wait(0.125)
                        end
                        game:GetService("ReplicatedStorage").Networking.Units.EquipEvent:FireServer("Equip", UnitWindowHandler(l.Database.Units[x]).UniqueIdentifier)
                        table.insert(u, UnitWindowHandler(l.Database.Units[x]).UnitData.Name)
                    end
                end
            end
        )
        if s then
            Fluent:Notify(
                {
                    Title = "Successful equip units",
                    SubContent = table.concat(u, ", "),
                    Disable = true,
                    Duration = 5
                }
            )
        else
            e = tostring(e)
            if e:find(": ") then
                e = e:split(": ")[2]
            end
            Fluent:Notify(
                {
                    Title = "Unsuccessful equip units",
                    SubContent = e,
                    Disable = true,
                    Duration = 5
                }
            )
        end
    end

    local function MainLobby(n)
        if n == "Challenges" then
            for u, v in next, Fluent.Database.Vanguards._MainLobby()["Challenges"]:GetChildren() do
                if v:IsA("Model") and v.LobbyBanner.Banner.Main.ChallengeInterface.Background.StageName.Text ~= "Daily" and v.LobbyBanner.Banner.Main.ChallengeInterface.Background.MaxPlayers.Amount.Text == "0/4" then
                    return v
                end
            end
        else
            for u, v in next, Fluent.Database.Vanguards._MainLobby()[n]:GetChildren() do
                if v:IsA("Model") and v.Name == "Lobby" and v.LobbyBanner.Banner.Main:FindFirstChild("ChosenStage") == nil and v.LobbyBanner.Banner.Main.ChoosingStage.Main.ActName.Text == "Choosing..." and not table.find(Fluent.Database.Game.Lobby, v) then
                    return v
                end
            end
        end
    end

    local function ChallengeReward()
        if #Configs["Select Challenge Rewards"].Tables > 0 and MainLobby("Challenges") then
            local t = MainLobby("Challenges").LobbyBanner.Banner.Main.ChallengeInterface.Background.StageName.Text

            if t == "Essence Stone Challenge" then
                for u, r in next, require(game:GetService("ReplicatedStorage").Modules.Data.ItemsData.EssenceStones) do
                    if table.find(Configs["Select Challenge Rewards"].Tables, u) then
                        return ""
                    end
                end
            else
                for u, r in next, require(game:GetService("ReplicatedStorage").Modules.Data.ChallengeRewardsData).HalfHourly[t] do
                    if type(r) == "table" then
                        for u, y in next, r do
                            if table.find(Configs["Select Challenge Rewards"].Tables, u) then
                                return ""
                            end
                        end
                    end
                end
            end
        end
    end

    local function ChallengeIgnore()
        if #Configs["Ignore Challenge World"].Tables > 0 and MainLobby("Challenges") then
            for u, r in next, Configs["Ignore Challenge World"].Tables do
                for s, d in next, require(game:GetService("ReplicatedStorage").Modules.Data.StagesData).Challenge do
                    if s == Fluent.Database.Vanguards._StagesName("Story", r) then
                        for x = 1, 6 do
                            if d.Acts["Act"..tostring(x)].ActName == MainLobby("Challenges").LobbyBanner.Banner.Main.ChallengeInterface.Background.ActName.Text then
                                return ""
                            end
                        end
                    end
                end
            end
        end
        if #Configs["Ignore Challenge Modifier"].Tables > 0 and MainLobby("Challenges") then
            local m = MainLobby("Challenges").LobbyBanner.Banner.Main.ChallengeInterface.Background.Difficulty.Label.Text

            if m:find(" ") then
                local t = {}

                for x = 1, #m:split(" ") do
                    table.insert(t, m:split(" ")[x]:lower())
                end
                for x = 1, #Configs["Ignore Challenge Modifier"].Tables do
                    if table.find(t, Configs["Ignore Challenge Modifier"].Tables[x]:lower()) then
                        return ""
                    end
                end
            else
                for x = 1, #Configs["Ignore Challenge Modifier"].Tables do
                    if m:lower() == Configs["Ignore Challenge Modifier"].Tables[x]:lower() then
                        return ""
                    end
                end
            end
        end
    end

    local function ChallengeUnlocked()
        for s, d in next, require(game:GetService("ReplicatedStorage").Modules.Data.StagesData).Challenge do
            if Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.Story[s] then
                for x = 1, 6 do
                    if d.Acts["Act"..tostring(x)].ActName == MainLobby("Challenges").LobbyBanner.Banner.Main.ChallengeInterface.Background.ActName.Text then
                        if Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.Story[s]["Act"..tostring(x)] then
                            return ""
                        end
                    end
                end
            end
        end
    end

    local function ChoosingStage()
        local l = Fluent.Database.Vanguards._LobbyHandler()

        if l.Owner == game:GetService("Players").LocalPlayer.Name and l.SelectedType ~= "Challenge" and not l.AlreadySelected then
            if Configs["Auto Join Normal (Raids)"].Value and l.PlayerData.Stages.Raid[Fluent.Database.Vanguards._StagesName("Raid", Configs["Raids Stage"].Value)] and l.PlayerData.Stages.Raid[Fluent.Database.Vanguards._StagesName("Raid", Configs["Raids Stage"].Value)][Configs["Raids Act"].Value] then
                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Confirm",
                {
                    "Raid",
                    Fluent.Database.Vanguards._StagesName("Raid", Configs["Raids Stage"].Value),
                    Configs["Raids Act"].Value,
                    "Normal",
                    4,
                    0,
                    Configs["Friends Only"].Value
                }
                )
            elseif Configs["Auto Join Hights (Raids)"].Value and l.PlayerData.Raids then
                setmetatable(l.PlayerData.Stages.Raid, Fluent.Database._len())
                setmetatable(l.PlayerData.Stages.Raid["Stage"..tostring(#l.PlayerData.Stages.Raid)], Fluent.Database._len())
                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Confirm",
                {
                    "Raid",
                    "Stage"..tostring(#l.PlayerData.Stages.Raid),
                    "Act"..tostring(#l.PlayerData.Stages.Raid["Stage"..tostring(#l.PlayerData.Stages.Raid)]),
                    "Normal",
                    4,
                    0,
                    Configs["Friends Only"].Value
                }
                )
            elseif Configs["Auto Join Legend Stage"].Value and l.PlayerData.Stages.LegendStage[Fluent.Database.Vanguards._StagesName("LegendStage", Configs["Legend Stage Stage"].Value)] and l.PlayerData.Stages.LegendStage[Fluent.Database.Vanguards._StagesName("LegendStage", Configs["Legend Stage Stage"].Value)][Configs["Legend Stage Act"].Value] then
                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Confirm",
                {
                    "LegendStage",
                    Fluent.Database.Vanguards._StagesName("LegendStage", Configs["Legend Stage Stage"].Value),
                    Configs["Legend Stage Act"].Value,
                    "Normal",
                    4,
                    0,
                    Configs["Friends Only"].Value
                }
                )
            elseif Configs["Auto Join Normal (Story)"].Value and l.PlayerData.Stages.Story[Fluent.Database.Vanguards._StagesName("Story", Configs["Story Stage"].Value)] and l.PlayerData.Stages.Story[Fluent.Database.Vanguards._StagesName("Story", Configs["Story Stage"].Value)][Configs["Story Act"].Value] then
                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Confirm",
                {
                    "Story",
                    Fluent.Database.Vanguards._StagesName("Story", Configs["Story Stage"].Value),
                    Configs["Story Act"].Value,
                    ((Configs["Story Act"].Value == "Paragon" or Configs["Story Act"].Value == "Infinite") and "Normal") or Configs["Story Difficulty"].Value,
                    4,
                    Configs["Story Act"].Value == "Paragon" and tostring(l.PlayerData.Stages.Story[Fluent.Database.Vanguards._StagesName("Story", Configs["Story Stage"].Value)].Paragon.ParagonLevelsReached.Nightmare + 1) or 0,
                    Configs["Friends Only"].Value
                }
                )
            elseif Configs["Auto Join Hights (Story)"].Value then
                setmetatable(l.PlayerData.Stages.Story, Fluent.Database._len())
                setmetatable(l.PlayerData.Stages.Story["Stage"..tostring(#l.PlayerData.Stages.Story)], Fluent.Database._len({"Paragon", "Infinite"}))
                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Confirm",
                {
                    "Story",
                    "Stage"..tostring(#l.PlayerData.Stages.Story),
                    "Act"..tostring(#l.PlayerData.Stages.Story["Stage"..tostring(#l.PlayerData.Stages.Story)]),
                    Configs["Story Difficulty"].Value,
                    4,
                    0,
                    Configs["Friends Only"].Value
                }
                )
            end
        end
    end

    local function AlreadySelected(f, ...)
        if #Fluent.Database.Vanguards._LobbyHandler().Owner >= 1 or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MiniLobbyInterface") then
            ChoosingStage()
            return
        else
            if f then
                pcall(f, ...)
            end
        end
    end

    task.spawn(
        function()
            while true and task.wait() do
                if Fluent.Unloaded then
                    break
                elseif Configs["Auto Start"].Value and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MiniLobbyInterface") then
                    game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Start")
                    break
                end
            end
        end
    )

    task.spawn(
        function()
            while true and task.wait(0.125) do
                if Fluent.Unloaded then
                    break
                else
                    Configs["Auto Lobby Green Essence Stone"]:SetDesc("Automatically teleport to lobby when you reached maximum amout of Green Essence Stone ("..tostring(Fluent.Database.Vanguards._InventoryHandler("Green Essence Stone")).."/100)")
                end
            end
        end
    )

    task.spawn(
        function()
            while true and task.wait(0.125) do
                if Fluent.Unloaded then
                    break
                elseif Configs["Auto Join Challenge"].Value or Configs["Auto Join Legend Stage"].Value or Configs["Auto Join Normal (Raids)"].Value or Configs["Auto Join Hights (Raids)"].Value or Configs["Auto Join Normal (Story)"].Value or Configs["Auto Join Hights (Story)"].Value then
                    if Fluent.Database.Vanguards._LobbyHandler().Owner == "" then
                        pcall(
                            function()
                                if not Fluent.Database["Challenge Cooldown"] and Configs["Auto Join Challenge"].Value and MainLobby("Challenges") and ChallengeReward() and not ChallengeIgnore() and ChallengeUnlocked() then
                                    task.wait(Configs["Join Delay"].Value)
                                    if Fluent.Unloaded or Fluent.Database["Challenge Cooldown"] or not Configs["Auto Join Challenge"].Value or not MainLobby("Challenges") or #Fluent.Database.Vanguards._Slot().Unit == 0 then
                                        return
                                    end
                                    if Configs["Auto Change Team"].Value and Configs["Challenge Team"].Value then
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.Units.TeamsEvent:FireServer("EquipTeam", tonumber(Configs["Challenge Team"].Value:split("Team")[2]))
                                                task.wait(0.125)
                                            end
                                        )
                                    end
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Enter", MainLobby("Challenges"))
                                            end
                                        )
                                    task.wait(0.375)
                                elseif (Configs["Auto Join Normal (Raids)"].Value or Configs["Auto Join Hights (Raids)"].Value) and MainLobby("Raids") and Fluent.Database.Vanguards._LobbyHandler().PlayerData.Raids then
                                    if Configs["Auto Join Normal (Raids)"].Value and (not Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.Raid[Fluent.Database.Vanguards._StagesName("Raid", Configs["Raids Stage"].Value)] or not Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.Raid[Fluent.Database.Vanguards._StagesName("Raid", Configs["Raids Stage"].Value)][Configs["Raids Act"].Value]) then
                                        return
                                    end
                                    task.wait(Configs["Join Delay"].Value)
                                    if Fluent.Unloaded or (not Configs["Auto Join Normal (Raids)"].Value and not Configs["Auto Join Hights (Raids)"].Value) or not MainLobby("Raids") or #Fluent.Database.Vanguards._Slot().Unit == 0 then
                                        return
                                    end
                                    if Configs["Auto Change Team"].Value and Configs["Raid Team"].Value then
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.Units.TeamsEvent:FireServer("EquipTeam", tonumber(Configs["Raid Team"].Value:split("Team")[2]))
                                                task.wait(0.125)
                                            end
                                        )
                                    end
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Enter", MainLobby("Raids"))
                                            end
                                        )
                                    task.wait(0.375)
                                elseif (Configs["Auto Join Normal (Story)"].Value or Configs["Auto Join Hights (Story)"].Value or Configs["Auto Join Legend Stage"].Value) and MainLobby("Stories") then
                                    if Configs["Auto Join Legend Stage"].Value and (not Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.LegendStage[Fluent.Database.Vanguards._StagesName("LegendStage", Configs["Legend Stage Stage"].Value)] or not Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.LegendStage[Fluent.Database.Vanguards._StagesName("LegendStage", Configs["Legend Stage Stage"].Value)][Configs["Legend Stage Act"].Value]) then
                                        return
                                    end
                                    if Configs["Auto Join Normal (Story)"].Value and (not Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.Story[Fluent.Database.Vanguards._StagesName("Story", Configs["Story Stage"].Value)] or not Fluent.Database.Vanguards._LobbyHandler().PlayerData.Stages.Story[Fluent.Database.Vanguards._StagesName("Story", Configs["Story Stage"].Value)][Configs["Story Act"].Value]) then
                                        return
                                    end
                                    task.wait(Configs["Join Delay"].Value)
                                    if Fluent.Unloaded or (not Configs["Auto Join Normal (Story)"].Value and not Configs["Auto Join Hights (Story)"].Value and not Configs["Auto Join Legend Stage"].Value) or not MainLobby("Stories") or #Fluent.Database.Vanguards._Slot().Unit == 0 then
                                        return
                                    end
                                    if Configs["Auto Change Team"].Value and Configs["Auto Join Legend Stage"].Value and Configs["Legend Stage Team"].Value then
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.Units.TeamsEvent:FireServer("EquipTeam", tonumber(Configs["Legend Stage Team"].Value:split("Team")[2]))
                                                task.wait(0.125)
                                            end
                                        )
                                    end
                                    if Configs["Auto Change Team"].Value and not Configs["Auto Join Legend Stage"].Value and (Configs["Auto Join Normal (Story)"].Value and Configs["Story Act"].Value == "Paragon") and Configs["Paragon Team"].Value then
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.Units.TeamsEvent:FireServer("EquipTeam", tonumber(Configs["Paragon Team"].Value:split("Team")[2]))
                                                task.wait(0.125)
                                            end
                                        )
                                    end
                                    if Configs["Auto Change Team"].Value and not Configs["Auto Join Legend Stage"].Value and (Configs["Auto Join Normal (Story)"].Value and Configs["Story Act"].Value == "Infinite") and Configs["Infinite Team"].Value then
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.Units.TeamsEvent:FireServer("EquipTeam", tonumber(Configs["Infinite Team"].Value:split("Team")[2]))
                                                task.wait(0.125)
                                            end
                                        )
                                    end
                                    if Configs["Auto Change Team"].Value and not Configs["Auto Join Legend Stage"].Value and not (Configs["Auto Join Normal (Story)"].Value and (Configs["Story Act"].Value == "Paragon" or Configs["Story Act"].Value == "Infinite")) and Configs["Story Team"].Value then
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.Units.TeamsEvent:FireServer("EquipTeam", tonumber(Configs["Story Team"].Value:split("Team")[2]))
                                                task.wait(0.125)
                                            end
                                        )
                                    end
                                        AlreadySelected(
                                            function()
                                                game:GetService("ReplicatedStorage").Networking.LobbyEvent:FireServer("Enter", MainLobby("Stories"))
                                            end
                                        )
                                    task.wait(0.375)
                                end
                            end
                        )
                    else
                        ChoosingStage()
                    end
                end
            end
        end
    )

    task.spawn(
        function()
            while true and task.wait() do
                if Fluent.Unloaded then
                    break
                elseif Configs["Auto Craft Essence Stone"].Value and #Configs["Select Essence Stone"].Tables > 0 and Fluent.Database.Vanguards._CurrencyHandler().Gold >= 500 and Fluent.Database.Vanguards._InventoryHandler("Green Essence Stone") >= 3 then
                    local e = {}

                    for x = 1, #Configs["Select Essence Stone"].Tables do
                        table.insert(e, {
                            Amount = Fluent.Database.Vanguards._InventoryHandler(Configs["Select Essence Stone"].Tables[x]),
                            Name = Configs["Select Essence Stone"].Tables[x]
                        })
                    end

                    table.sort(e, function(l, h)
                        return tonumber(l.Amount) >= tonumber(h.Amount)
                    end)

                    for x = 1, #e do
                        if Fluent.Unloaded or Fluent.Database.Vanguards._CurrencyHandler().Gold < 500 or Fluent.Database.Vanguards._InventoryHandler("Green Essence Stone") < 3 or not Configs["Auto Craft Essence Stone"].Value or #Configs["Select Essence Stone"].Tables == 0 then
                            game:GetService("ReplicatedStorage").Networking.State.CraftingEvent:FireServer("Craft", e[x].Name, 1)
                            task.wait()
                        end
                    end
                end
            end
        end
    )

    Fluent.Database.Signals["ScreenEvent"] = game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(
        function(child)
            if child.Name == "PopupScreen" then
                for n, c in next, child:GetDescendants() do
                    if table.find({"Close", "Cancel"}, c.Name) and c:FindFirstChild("Button") and c.Button:IsA("TextButton") then
                        firesignal(c.Button.Activated)
                        break
                    end
                end
            elseif child.Name == "RewardsScreen" then
                    Fluent.Database.Game.Click()
            end
        end
    )

    Fluent.Database.Signals["LobbyEntranceEvent"] = game:GetService("ReplicatedStorage").Networking.ClientListeners.LobbyEntranceEvent.OnClientEvent:Connect(
        function(t, v)
            if t == "Open" and not table.find(Fluent.Database.Game.Lobby, v) then
                table.insert(Fluent.Database.Game.Lobby, v)
            elseif t == "Close" and table.find(Fluent.Database.Game.Lobby, v) then
                table.remove(Fluent.Database.Game.Lobby, table.find(Fluent.Database.Game.Lobby, v))
            end
        end
    )

    for x = 1, 6 do
        if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Units[tostring(x)]:FindFirstChild("Locked") == nil then
            Fluent.Database.Signals["Changed Unit 1"..tostring(x)] = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Units[tostring(x)].ChildAdded:Connect(
                function(child)
                    if not Fluent.Unloaded and child.Name == "UnitTemplate" then
                        Configs["Select Unit (Sell)"]:SetValues(Fluent.Database.Vanguards._Slot().Unit)
                        Configs["Select Unit (Mohato)"]:SetValues(Fluent.Database.Vanguards._Slot().Unit)
                    end
                end
            )
            Fluent.Database.Signals["Changed Unit 2"..tostring(x)] = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Main.Units[tostring(x)].ChildRemoved:Connect(
                function(child)
                    if not Fluent.Unloaded and child.Name == "UnitTemplate" then
                        Configs["Select Unit (Sell)"]:SetValues(Fluent.Database.Vanguards._Slot().Unit)
                        Configs["Select Unit (Mohato)"]:SetValues(Fluent.Database.Vanguards._Slot().Unit)
                    end
                end
            )
        end
    end
else
    Fluent.Database.Buttons["Equip Units"]:Lock()
    if Configs["Macro Status"].Value then
        Fluent.Database.Notifys["Macro Status"] = Fluent:Notify(
            {
                Title = Fluent.Database.Macro.Status,
                SubContent = "\nGame Time: 0.00",
                Disable = true
            }
        )
    end

    local function _StageType()
        return (require(game:GetService("ReplicatedStorage").Modules.Gameplay.GameHandler).GameData.Act == "Paragon" and "Paragon") or (require(game:GetService("ReplicatedStorage").Modules.Gameplay.GameHandler).GameData.Act == "Infinite" and "Infinite") or tostring(getupvalues(require(game:GetService("StarterPlayer").Modules.Interface.Loader.HUD.StageInfoHandler)._Init)[9].GameData.StageType)
    end

    local function _StageName()
        local a = require(game:GetService("ReplicatedStorage").Modules.Gameplay.GameHandler)
        local b = a.GameData.Stage

        local c = require(game:GetService("ReplicatedStorage").Modules.Data.StagesData[a.GameData.StageType][b][b]).Name
        return c
    end

    local function _MacroWrite()
        writefile(Otherfunction:FormatLocation(Configs["Macro File"].Value), game:GetService("HttpService"):JSONEncode(Fluent.Database.Macro.Value))
    end

    local function _MacroInsert(u)
        if not Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value + 1)] then
               Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value + 1)] = u

        else
               Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value + 1)] = u
        end
    end

    local function _MacroDatabase(r)
        Fluent.Database.Macro.Value.Database.World = _StageName()

        if not table.find(Fluent.Database.Macro.Value.Database.Units, r) then
               table.insert(Fluent.Database.Macro.Value.Database.Units, r)
        end
    end

    local function _MacroSelect()
        if Configs[_StageType().._StageName()] and Configs[_StageType().._StageName()].Value then
            return Configs[_StageType().._StageName()].Value
        else
            return Configs["Macro File"].Value
        end
    end

    local function _UnitsData(n)
        for r, v in next, getupvalues(getupvalues(require(game:GetService("StarterPlayer").Modules.Interface.Loader.Misc.UnitWindowHover)._HandleHover)[1].GetUnits)[1] do
            if tostring(v.Name) == n or tostring(v.Model) == n or tostring(v.ShinyModel) == n then
                return {
                    Upgrades = v.Upgrades,
                    Pirce = tostring(v.Price),
                    Name = tostring(v.Name),
                    ID = v.ID
                }
            end
        end
    end

    local function _UpgradeType(t, u, n)
        if t == "Manager" then
            if game:GetService("Players").LocalPlayer.PlayerGui.UnitManager.Holder.List[u].UpgradeLabel.Text == "Upgrade (MAX)" then
                return _UnitsData(n).Upgrades[#_UnitsData(n).Upgrades].Price
            else
                local s = game:GetService("Players").LocalPlayer.PlayerGui.UnitManager.Holder.List[u].UpgradeLabel.Text:split(" ")[2]:gsub("%[", ""):gsub("%]", "")
                return _UnitsData(n).Upgrades[tonumber(s + 1)].Price
            end
        else
            if game:GetService("Players").LocalPlayer.PlayerGui.UpgradeInterfaces:GetChildren()[1].Stats.UpgradeButton.Inner.Label.Text == "Max" then
                return _UnitsData(u).Upgrades[#_UnitsData(u).Upgrades].Price
            else
                local s = game:GetService("Players").LocalPlayer.PlayerGui.UpgradeInterfaces:GetChildren()[1].Stats.UpgradeLabel.Label.Text:split(" ")[2]:gsub("%[", ""):gsub("%]", "")
                return _UnitsData(u).Upgrades[tonumber(s + 1)].Price
            end
        end
    end

    local function _UnitSpawned(n)
        for r, v in next, Fluent.Database.Vanguards._ActiveUnits() do
            if v.Player == game:GetService("Players").LocalPlayer and r == n then
                return {
                    CurrentUpgrade = v.Data.CurrentUpgrade,
                    ActiveAbility = v.ActiveAbility,
                    Priority = tonumber(v.Data.Priority),
                    Position = tostring(v.Position),
                    Rotation = tostring(v.Rotation),
                    Name = tostring(v.Data.Name),
                    Key = tostring(r)
                }
            end
        end
    end

    local function _UnitPlaced(n, c, x, p)
        for r, v in next, Fluent.Database.Vanguards._ActiveUnits() do
            if (not p and v.Player == game:GetService("Players").LocalPlayer or p) and ((not x and v.Data.Name == n) or x) then
                if v.Position == Vector3.new(table.unpack(tostring(c):gsub(" ", ""):split(","))) or (v.Position - Vector3.new(table.unpack(tostring(c):gsub(" ", ""):split(",")))).Magnitude <= 1.625 then
                    return {
                        CurrentUpgrade = v.Data.CurrentUpgrade,
                        ActiveAbility = v.ActiveAbility,
                        Priority = tonumber(v.Data.Priority),
                        Position = tostring(v.Position),
                        Rotation = tostring(v.Rotation),
                        Name = tostring(v.Data.Name),
                        Key = tostring(r)
                    }
                end
            end
        end
    end

    local function _PriorityWithNumber(t)
        return
        (
            t == 1
            and
            "First"
        )
        or
        (
            t == 2
            and
            "Closest"
        )
        or
        (
            t == 3
            and
            "Last"
        )
        or
        (
            t == 4
            and
            "Strongest"
        )
        or
        (
            t == 5
            and
            "Weakest"
        )
        or
        1
    end

    local function _TickFirst()
        if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text == "0" then
            getgenv().StartTime = tick()

            return "0.000"
        else
            local t = tick() - getgenv().StartTime
            local s = math.floor(t) % ((9e9 * 9e9) + (9e9 * 9e9))
            local m = string.format(".%.03d", (t % 1) * 1000)

            return s..m
        end
    end

    local function _UseTime()
        if Configs["Record Type"].Value == "Time" or Configs["Record Type"].Value == "Hybrid" then
            return _TickFirst()
        else
            return "0.000"
        end
    end

    local function _UseMoney(t, n, c, h)
        if Configs["Record Type"].Value == "Money" or Configs["Record Type"].Value == "Hybrid" then
            if t == "Place" then
                return _UnitsData(n).Pirce
            else
                return _UpgradeType(n, c, h)
            end
        else
            return "0"
        end
    end

    local function _MacroWating(t)
        repeat
            task.wait()
        until Fluent.Unloaded or not Configs["Macro Play"].Value or (tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(t["Money"]) and tonumber(_TickFirst()) >= tonumber(t["Time"]))
    end

    local function _MacroUpdateStatus()
        if Configs["Macro Record"].Value and #Fluent.Database.Macro.Value > 0 and Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)] then
            local f, r = Fluent.Database.Macro.Value, Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]

            Fluent.Database.Macro.Status = "Status : Recording ("..tostring(#f).."/"..tostring(#f)..")"
            return "\nAction : "..r["Type"].."\nUnit : "..r["Unit"]..(r["Selected"] and "\nSelected : "..r["Selected"]["Unit"] or "")..(r["Rotation"] and "\nRotation : "..r["Rotation"] or "")..(r["Value"] and "\nValue : "..r["Value"] or "").."\nMoney : "..r["Money"].."\nTime : "..r["Time"]

        elseif Configs["Macro Play"].Value and Fluent.Database.Macro.Playing and Fluent.Database.Macro.Playing.Database.World == _StageName() then
            if Fluent.Database.Macro.Ended then
                local f, r = Fluent.Database.Macro, Fluent.Database.Macro.Playing

                f.Status = "Status : Playing Ended ("..tostring(#r).."/"..tostring(#r)..")"
                return "\n"
            else
                local f, r, e = Fluent.Database.Macro, Fluent.Database.Macro.Playing, Fluent.Database.Macro.Playing[tostring(Fluent.Database.Macro.Index)]

                f.Status = "Status : Playing ("..tostring(f.Index).."/"..tostring(#r)..")"
                return "\nAction : "..e["Type"].."\nUnit : "..e["Unit"]..(e["Selected"] and "\nSelected : "..e["Selected"]["Unit"] or "")..(e["Rotation"] and "\nRotation : "..e["Rotation"] or "")..(e["Value"] and "\nValue : "..e["Value"] or "").."\nMoney : "..e["Money"].."\nTime : "..e["Time"]
            end
        else
            local f = Fluent.Database.Macro

            f.Status = Configs["Macro Record"].Value and "Status : Recording (0/0)" or "Status : None (0/0)"
            return "\n"
        end
    end

    local function _ModifiersVote()
        if Configs["Auto Choose Modifier"].Value and #game:GetService("Players").LocalPlayer.PlayerGui.Frames.Modifiers.Main:GetChildren() > 4 then
            local v
            for e = 1, #Fluent.Database.Vanguards._Modifiers() do
                if v then
                    break
                elseif Configs["Modifier "..tostring(e)] and Configs["Modifier "..tostring(e)].Value and not v then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Frames.Modifiers.Main:FindFirstChild(Configs["Modifier "..tostring(e)].Value) then
                        game:GetService("ReplicatedStorage").Networking.ModifierEvent:FireServer("Choose", Configs["Modifier "..tostring(e)].Value)
                        v = ""
                        break
                    end
                end
            end
            Fluent.Database.Game.Vote = false
        end
    end

    local function _MohatoPlaced(u)
        for r, v in next, Fluent.Database.Vanguards._ActiveUnits() do
            if v.Player == game:GetService("Players").LocalPlayer and (u and v.Data.Name == u or not u) then
                if Fluent.Database.Mohato.Position and (v.Position == Fluent.Database.Mohato.Position or (v.Position - Fluent.Database.Mohato.Position).Magnitude <= 1.625) then
                    return {
                        CurrentUpgrade = v.Data.CurrentUpgrade,
                        ActiveAbility = v.ActiveAbility,
                        Priority = tonumber(v.Data.Priority),
                        Position = tostring(v.Position),
                        Rotation = tostring(v.Rotation),
                        Name = tostring(v.Data.Name),
                        Key = tostring(r)
                    }
                end
            end
        end
    end

    local function _MohatoPlaying()
        local Position, Animation = game:GetService("Workspace").Mohato.HumanoidRootPart.Position,
                                    tostring(game:GetService("Workspace").Mohato.Humanoid:GetPlayingAnimationTracks()[1])

                        if Animation == "Sitting" or Animation == "Leaning" then
                            Fluent.Database.Mohato.Position = Position + Vector3.new(3, (Animation == "Sitting" and - 0.635 or -1.35), 0)
                            Fluent.Database.Mohato.LastPosition = Fluent.Database.Mohato.Position
                        elseif Animation == "Hanging" then
                            Fluent.Database.Mohato.Position = Position + Vector3.new(3, -6.35, 0)
                            Fluent.Database.Mohato.LastPosition = Fluent.Database.Mohato.Position
                        else
                            Fluent.Database.Mohato.Position = Position + Vector3.new(0, -1.35, 3)
                            Fluent.Database.Mohato.LastPosition = Fluent.Database.Mohato.Position
                        end
        if Configs["Auto Mohato"].Value and table.find(Fluent.Database.Vanguards._Slot().Unit, Configs["Select Unit (Mohato)"].Value) then
            local UnitData = _UnitsData(Configs["Select Unit (Mohato)"].Value)

            if _MohatoPlaced(UnitData.Name) then
                Fluent.Database.Mohato.SellUnit = false
                task.spawn(
                    function()
                        while true and task.wait() do
                            if Fluent.Unloaded or not Configs["Auto Mohato"].Value or not Fluent.Database.Mohato.Spawned or not Fluent.Database.Mohato.Position or not _MohatoPlaced(UnitData.Name) then
                                Fluent.Database.Mohato.Action.Delete()
                                break
                            else
                                if tonumber(_MohatoPlaced(UnitData.Name).CurrentUpgrade) < tonumber(Configs["Unit Max Upgrade"].Value + 1) and tonumber(_MohatoPlaced(UnitData.Name).CurrentUpgrade) ~= tonumber(#UnitData.Upgrades) then
                                    if tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price) then
                                        Fluent.Database.Mohato.Action.Create(
                                            {
                                                ["Type"] = "UpgradeUnit (Mohato)",
                                                ["Unit"] = UnitData.Name,
                                                ["Money"] = tostring(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price)
                                            },
                                            Fluent.Database.Mohato.Position
                                        )
                                        game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Upgrade", _MohatoPlaced(UnitData.Name).Key)
                                        task.wait(0.425)
                                        Fluent.Database.Mohato.Action.Delete()
                                    else
                                        Fluent.Database.Mohato.Action.Create(
                                            {
                                                ["Type"] = "UpgradeUnit (Mohato)",
                                                ["Unit"] = UnitData.Name,
                                                ["Money"] = tostring(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price)
                                            },
                                            Fluent.Database.Mohato.Position
                                        )
                                        repeat
                                            task.wait()
                                        until Fluent.Unloaded or not Configs["Auto Mohato"].Value or not Fluent.Database.Mohato.Spawned or not Fluent.Database.Mohato.Position or not _MohatoPlaced(UnitData.Name) or (tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price))
                                    end
                                end
                            end
                        end
                    end
                )
            else
                Fluent.Database.Mohato.Action.Create(
                    {
                        ["Type"] = "SpawnUnit (Mohato)",
                        ["Unit"] = UnitData.Name,
                        ["Money"] = UnitData.Pirce
                    },
                    Fluent.Database.Mohato.Position
                )
                repeat
                    task.wait()
                until Fluent.Unloaded or not Configs["Auto Mohato"].Value or tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(UnitData.Pirce)

                if not Configs["Auto Mohato"].Value then
                    Fluent.Database.Mohato.Action.Delete()
                end

                if Configs["Auto Mohato"].Value and _MohatoPlaced() then
                    local sell = _MohatoPlaced().Key

                    Fluent.Database.Mohato.SellUnit = sell
                    game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Sell", sell)
                end

                if Configs["Auto Mohato"].Value and #Fluent.Database.Vanguards._CurrentPlaceUnit(Configs["Select Unit (Mohato)"].Value).Placed >= Fluent.Database.Vanguards._CurrentPlaceUnit(Configs["Select Unit (Mohato)"].Value).MaxPlace then
                    local sell = Fluent.Database.Vanguards._CurrentPlaceUnit(Configs["Select Unit (Mohato)"].Value).Placed[1]

                    Fluent.Database.Mohato.SellUnit = sell
                    game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Sell", sell)
                end

                if Configs["Auto Mohato"].Value and tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(UnitData.Pirce) then
                    game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Render",{
                        UnitData.Name,
                        UnitData.ID,
                        Fluent.Database.Mohato.Position,
                        0
                    })
                    task.wait(0.425)
                    Fluent.Database.Mohato.Action.Delete()
                    task.wait(0.235)
                    Fluent.Database.Mohato.SellUnit = false
                    task.spawn(
                        function()
                            while true and task.wait() do
                                if Fluent.Unloaded or not Configs["Auto Mohato"].Value or not Fluent.Database.Mohato.Spawned or not Fluent.Database.Mohato.Position or not _MohatoPlaced(UnitData.Name) then
                                    Fluent.Database.Mohato.Action.Delete()
                                    break
                                else
                                    if tonumber(_MohatoPlaced(UnitData.Name).CurrentUpgrade) < tonumber(Configs["Unit Max Upgrade"].Value + 1) and tonumber(_MohatoPlaced(UnitData.Name).CurrentUpgrade) ~= tonumber(#UnitData.Upgrades) then
                                        if tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price) then
                                            Fluent.Database.Mohato.Action.Create(
                                                {
                                                    ["Type"] = "UpgradeUnit (Mohato)",
                                                    ["Unit"] = UnitData.Name,
                                                    ["Money"] = tostring(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price)
                                                },
                                                Fluent.Database.Mohato.Position
                                            )
                                            game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Upgrade", _MohatoPlaced(UnitData.Name).Key)
                                            task.wait(0.425)
                                            Fluent.Database.Mohato.Action.Delete()
                                        else
                                            Fluent.Database.Mohato.Action.Create(
                                                {
                                                    ["Type"] = "UpgradeUnit (Mohato)",
                                                    ["Unit"] = UnitData.Name,
                                                    ["Money"] = tostring(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price)
                                                },
                                                Fluent.Database.Mohato.Position
                                            )
                                            repeat
                                                task.wait()
                                            until Fluent.Unloaded or not Configs["Auto Mohato"].Value or not Fluent.Database.Mohato.Spawned or not Fluent.Database.Mohato.Position or not _MohatoPlaced(UnitData.Name) or (tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(UnitData.Upgrades[_MohatoPlaced(UnitData.Name).CurrentUpgrade + 1].Price))
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    end

    task.spawn(
        function()
            for r, v in next, Fluent.Database.Vanguards._ActiveUnits() do
                if v.Player == game:GetService("Players").LocalPlayer and not Fluent.Database.Game.Units[tostring(r)] then
                    Fluent.Database.Game.Units[tostring(r)] = _UnitSpawned(tostring(r))
                end
            end
        end
    )

    task.spawn(
        function()
            while true and task.wait() do
                if Fluent.Unloaded then
                    break
                elseif Configs["Auto Skip"].Value and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SkipWave") and #game:GetService("Players").LocalPlayer.PlayerGui.Frames.Modifiers.Main:GetChildren() < 3 then
                    game:GetService("ReplicatedStorage").Networking.SkipWaveEvent:FireServer("Skip")
                    task.wait(2.735)
                elseif Configs["Auto Sell (Select Unit)"].Value and #Configs["Select Unit (Sell)"].Tables > 0 and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text) >= tonumber(Configs["Select Wave (Sell / Leave)"].Value) then
                    for r, v in next, Fluent.Database.Vanguards._ActiveUnits() do
                        if v.Player == game:GetService("Players").LocalPlayer and v.Data.Sellable == nil and table.find(Configs["Select Unit (Sell)"].Tables, v.Data.Name) then
                            game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Sell", r)
                        end
                    end
                elseif Configs["Auto Leave Select Wave"].Value and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text) >= tonumber(Configs["Select Wave (Sell / Leave)"].Value) then
                    game:GetService("ReplicatedStorage").Networking.TeleportEvent:FireServer("Lobby")
                    break
                elseif Configs["Auto Lobby Challenge"].Value and Fluent.Database["Half Hourly Challenge just changed"] and _StageType() ~= "Challenge" then
                    game:GetService("ReplicatedStorage").Networking.TeleportEvent:FireServer("Lobby")
                    break
                end
            end
        end
    )

    task.spawn(
        function()
            while true and task.wait() do
                if Fluent.Unloaded then
                    break
                elseif Configs["Macro Status"].Value then
                    pcall(
                        function()
                            if Fluent.Database.Notifys["Macro Status"] then
                                Fluent.Database.Notifys["Macro Status"].SubContentLabel.Text = "Game Time : "..tostring(_TickFirst()).._MacroUpdateStatus()
                                Fluent.Database.Notifys["Macro Status"].Title.Text = Fluent.Database.Macro.Status

                                local a, b = string.gsub(Fluent.Database.Notifys["Macro Status"].SubContentLabel.Text, "\n", "")
                                Fluent.Database.Notifys["Macro Status"].Holder.Size = UDim2.new(1, 0, 0, (80 + (10.5 * b)))
                            else
                                Fluent.Database.Buttons["Macro Status"]:SetDesc("\nGame Time : "..tostring(_TickFirst()).._MacroUpdateStatus())
                                Fluent.Database.Buttons["Macro Status"]:SetTitle(Fluent.Database.Macro.Status)
                            end
                        end
                    )
                end
            end
        end
    )

    task.spawn(
        function()
            for t, u in next, game:GetService("Players").LocalPlayer.PlayerGui.HUD.BossHealth:GetChildren() do
                if u:IsA("Frame") and u:FindFirstChild("EnemyInfo") and u.EnemyInfo.EnemyName.Text == "Mohato Clone" then
                    if u.HealthBar:FindFirstChild("MohatoHealth") == nil then
                        Fluent.Database.Mohato.Spawned = true
                    end

                    Fluent.Database.Signals["MohatoRemove"] = u:GetPropertyChangedSignal("Parent"):Connect(
                        function()
                            if Configs["Auto Mohato"].Value and Fluent.Database.Mohato.Position then
                                for r, i in next, Fluent.Database.Vanguards._ActiveUnits() do
                                    if i.Player == game:GetService("Players").LocalPlayer and (i.Position == Fluent.Database.Mohato.Position or (i.Position - Fluent.Database.Mohato.Position).Magnitude <= 1.625) then
                                        if i.Data.Sellable == nil then
                                            Fluent.Database.Mohato.Action.Delete()
                                            Fluent.Database.Mohato.Action.Create(
                                                {
                                                    ["Type"] = "SellUnit (Mohato)",
                                                    ["Unit"] = i.Data.Name,
                                                    ["Money"] = 0
                                                },
                                                Fluent.Database.Mohato.Position
                                            )
                                            game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Sell", r)
                                            task.wait(0.125)
                                        end
                                    end
                                end
                            end
                            Fluent.Database.Mohato.Placed = false
                            Fluent.Database.Mohato.Spawned = false
                            Fluent.Database.Mohato.Position = false
                            Fluent.Database.Mohato.Action.Delete()

                            if Fluent.Database.Signals["MohatoRemove"] then
                                Fluent.Database.Signals["MohatoRemove"]:Disconnect()
                                Fluent.Database.Signals["MohatoRemove"] = nil
                            end
                        end
                    )
                end
            end
        end
    )

    Fluent.Database.Signals["Fluent WindowsRoot"] = Windows.Root:GetPropertyChangedSignal("Visible"):Connect(
        function()
            if Configs["Macro Status"].Value and not Fluent.Unloaded and not Windows.Root.Visible and not Fluent.Database.Notifys["Macro Status"] then
                Fluent.Database.Notifys["Macro Status"] = Fluent:Notify(
                    {
                        Title = Fluent.Database.Macro.Status,
                        SubContent = "Game Time : 0.00",
                        Disable = true
                    }
                )
            elseif not Fluent.Unloaded and (not Configs["Macro Status"].Value or Windows.Root.Visible) and Fluent.Database.Notifys["Macro Status"] then
                Fluent.Database.Notifys["Macro Status"]:Close()
                Fluent.Database.Notifys["Macro Status"] = nil
            end
        end
    )

    Fluent.Database.Signals["Fluent WindowsSize"] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(
        function()
            Windows.Root.Size = UDim2.fromOffset(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 1.5)
            Windows.Root.Position = UDim2.fromOffset((workspace.CurrentCamera.ViewportSize.X/2) - (Windows.Root.Size.X.Offset / 2), (workspace.CurrentCamera.ViewportSize.Y/2) - (Windows.Root.Size.Y.Offset / 2))
        end
    )

    Fluent.Database.Signals["BossHealthMohato"] = game:GetService("Players").LocalPlayer.PlayerGui.HUD.BossHealth.ChildAdded:Connect(
        function(child)
            if child:IsA("Frame") and child:FindFirstChild("EnemyInfo") and child.EnemyInfo.EnemyName.Text == "Mohato Clone" and not Fluent.Database.Signals["MohatoRemove"] then
                Fluent.Database.Signals["MohatoRemove"] = child:GetPropertyChangedSignal("Parent"):Connect(
                    function()
                        if Configs["Auto Mohato"].Value and Fluent.Database.Mohato.Position then
                            for r, i in next, Fluent.Database.Vanguards._ActiveUnits() do
                                if i.Player == game:GetService("Players").LocalPlayer and (i.Position == Fluent.Database.Mohato.Position or (i.Position - Fluent.Database.Mohato.Position).Magnitude <= 1.625) then
                                    if i.Data.Sellable == nil then
                                        Fluent.Database.Mohato.Action.Delete()
                                        Fluent.Database.Mohato.Action.Create(
                                            {
                                                ["Type"] = "SellUnit (Mohato)",
                                                ["Unit"] = i.Data.Name,
                                                ["Money"] = 0
                                            },
                                            Fluent.Database.Mohato.Position
                                        )
                                        game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Sell", r)
                                        task.wait(0.125)
                                    end
                                end
                            end
                        end
                        Fluent.Database.Mohato.Placed = false
                        Fluent.Database.Mohato.Spawned = false
                        Fluent.Database.Mohato.Position = false
                        Fluent.Database.Mohato.Action.Delete()

                        if Fluent.Database.Signals["MohatoRemove"] then
                            Fluent.Database.Signals["MohatoRemove"]:Disconnect()
                            Fluent.Database.Signals["MohatoRemove"] = nil
                        end
                    end
                )
            end
        end
    )

    Fluent.Database.Signals["ShowEndScreenEvent"] = game:GetService("ReplicatedStorage").Networking.EndScreen.ShowEndScreenEvent.OnClientEvent:Connect(
        function(t)
            if Configs["Macro Record"].Value then
               Configs["Macro Record"]:SetValue(false)
            end
            if Configs["Auto Lobby Green Essence Stone"].Value and Fluent.Database.Vanguards._InventoryHandler("Green Essence Stone") >= 100 and Fluent.Database.Vanguards._Yen() >= 500 then
                task.delay(1, function()
                    game:GetService("ReplicatedStorage").Networking.TeleportEvent:FireServer("Lobby")
                end)
            else
                Configs["Auto Lobby Green Essence Stone"]:SetDesc("Automatically teleport to lobby when you reached maximum amout of Green Essence Stone ("..tostring(Fluent.Database.Vanguards._InventoryHandler("Green Essence Stone")).."/100)")
                task.spawn(
                    function()
                        repeat
                            if game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Enabled then
                                if game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Container.EndScreen.Leave.Visible and (Configs["Auto Leave"].Value or (t.StageType == "Challenge" and t.Status == "Finished")) then
                                    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Container.EndScreen.Leave.Button.Activated)
                                    break
                                elseif game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Container.EndScreen.Next.Visible and not Fluent.Database["Cannot be next act"] and  t.Status ~= "Failed" and Configs["Auto Next"].Value then
                                    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Container.EndScreen.Next.Button.Activated)
                                    task.wait(1)
                                elseif game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Container.EndScreen.Retry.Visible and not Fluent.Database["Cannot be retry"] and Configs["Auto Retry"].Value then
                                    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Container.EndScreen.Retry.Button.Activated)
                                    task.wait(1)
                                end
                            end
                            task.wait()
                        until Fluent.Unloaded or Fluent.Database.Game.Reset or game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text == "0"
                    end
                )
            end
            local content, database = nil, {
                stages = {
                    difficulty = t.Difficulty,
                    status = t.Status,
                    waves = t.WavesCompleted,
                    taken = string.format("%02i:%02i:%02i", t.TimeTaken/60^2, t.TimeTaken/60%60, t.TimeTaken%60),
                    name = require(game:GetService("ReplicatedStorage").Modules.Data.StagesData[t.StageType][t.Stage][t.Stage]).Name,
                    act = t.ParagonLevel and "Level "..tostring(t.ParagonLevel) or t.Act
                },
                currencies = {},
                unitsrewards = {},
                unitsdatabase = {},
            }
            for r, x in next, t.Rewards.Items or {} do
                table.insert(
                    Fluent.Database.Rewards.Main,
                    "+"..x.Amount.." "..r..(Fluent.Database.Vanguards._InventoryHandler(r) > 0 and " ["..tostring(Fluent.Database.Vanguards._InventoryHandler(r)).."]" or "")
                )
            end
            for r, x in next, t.Rewards.Units or {} do
                table.insert(
                    Fluent.Database.Rewards.Main,
                    "+1 "..r.." ["..getupvalues(getupvalues(require(game:GetService("StarterPlayer").Modules.Interface.Loader.Misc.UnitWindowHover)._HandleHover)[1].GetUnits)[1][r].Rarity.."]"..(x.Shiny and "(Shiny)" or "")
                )
                table.insert(
                    database.unitsrewards,
                    Fluent.Database.Rewards.Main[#Fluent.Database.Rewards.Main]:split("+1 ")[2]
                )
            end
            for r, x in next, t.Rewards.Currencies or {} do
                table.insert(
                    Fluent.Database.Rewards.Main,
                    "+"..x.Amount.." "..r
                )
            end
            for r, x in next, t.Rewards.Experience or {} do
                table.insert(
                    Fluent.Database.Rewards.Main,
                    "+"..x.." Experience"
                )
            end
            for r, x in next, Fluent.Database.Rewards.Misc do
                local nc
                local ti = 0
                if #x > 0 then
                    for e = 1, #x do
                        ti += x[e]
                        nc = "+"..ti.." "..r..(Fluent.Database.Vanguards._InventoryHandler(r) > 0 and " ["..tostring(Fluent.Database.Vanguards._InventoryHandler(r)).."]" or "")
                    end
                    table.insert(Fluent.Database.Rewards.Main, tostring(nc))
                end
            end
            for r, x in next, t.Rewards.UnitExperience or {} do
                table.insert(
                    Fluent.Database.Rewards.Main,
                    "+"..x.." UnitExperience"
                )
            end
            for x = 1, #Fluent.Database.Vanguards._Slot().Unit do
                local r = Fluent.Database.Vanguards._Slot().Data[tostring(x)]
                table.insert(
                    database.unitsdatabase,
                    "["..tostring(r.Level).."] "..Fluent.Database.Vanguards._Slot().Unit[x].." ("..tostring(":crossed_swords: "..Otherfunction:NumberToString(r.Takedowns))..")["..tostring(tonumber(r.Worthiness) >= 100 and 100 or r.Worthiness).."/100%]"
                )
            end
            for r, x in next, Fluent.Database.Vanguards._CurrencyHandler() do
                if table.find({"Gold", "Gems", "TraitRerolls"}, r) then
                    table.insert(
                        database.currencies,
                        r..": "..Otherfunction:NumberToString(x)
                    )
                end
            end
            if Configs["Send Webhook"].Value and string.find(Configs["Webhook Url"].Value, "https://discord.com/api/webhooks/") then
                local ue = game:GetService("HttpService"):JSONEncode(
                    {
                        ["username"] = "Anime Vanguards : Notification",
                        ["avatar_url"] = "https://tr.rbxcdn.com/d97f56d5c00cb039ac7abb4bd87df61b/256/256/Image/Webp",
                        content = (Configs["Ping Webhook"].Value and #database.unitsrewards > 0 and "<@"..tostring(Configs["Webhook Id"].Value)..">\n`You received:` "..table.concat(database.unitsrewards, "\n`You received:` ")) or nil,
                        embeds = {
                            {
                                ["title"] = "**✦ Webhook Notifaction ✦**",
                                ["description"] = nil,
                                ["color"] = database.stages.status == "Finished" and 0x00ff00 or 0xe9190c,
                                ["footer"] =
                                {
                                    ["text"] = "Time: "..os.date("%c").."\nCredit: YT » @crazyday3693",
                                    ["icon_url"] = "https://yt3.ggpht.com/yti/ANjgQV_KI8R3VhsnEhzYD0M1EJXUU29p0YC5gzrrhv8nWzA7j6s=s88-c-k-c0x00ffffff-no-rj"
                                },
                                ["thumbnail"] =
                                {
                                    ["url"] = "https://tr.rbxcdn.com/d97f56d5c00cb039ac7abb4bd87df61b/256/256/Image/Webp",
                                },
                                ["fields"] =
                                {
                                    {
                                        ["name"] = "**User: ||"..game:GetService("Players").LocalPlayer.Name.."||**",
                                        ["value"] = game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Level.Level.Text,
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "**Units**",
                                        ["value"] = "\n"..table.concat(database.unitsdatabase, "\n"),
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "**Rewards**",
                                        ["value"] = "\n"..table.concat(Fluent.Database.Rewards.Main, "\n"),
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "**Currencies**",
                                        ["value"] = "\n"..table.concat(database.currencies, "\n"),
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "**Match Result ["..database.stages.status.."!]**",
                                        ["value"] = tostring(database.stages.taken).." - Wave "..tostring(database.stages.waves).."\n"..database.stages.name.." "..database.stages.act.. " - " .._StageType().. " ["..database.stages.difficulty.."]",
                                        ["inline"] = false
                                    }

                                }
                            }
                        }
                    }
                )
                local ne = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or (request)
                ne(
                    {
                        Url = Configs["Webhook Url"].Value,
                        Method = "POST",
                        Headers =
                        {
                            ["Content-Type"] = "application/json"
                        },
                        Body = ue
                    }
                )
            end
        end
    )

    Fluent.Database.Signals["ItemInfNotification"] = game:GetService("ReplicatedStorage").Networking.Interface.ItemNotificationEvent.OnClientEvent:Connect(
        function(t)
            if not table.find({"Gems"}, t.ItemName) then
                if not Fluent.Database.Rewards.Misc[t.ItemName] then
                       Fluent.Database.Rewards.Misc[t.ItemName] = {}
                end
                table.insert(Fluent.Database.Rewards.Misc[t.ItemName], tonumber(t.ItemAmount))
            end
        end
    )

    Fluent.Database.Signals["HideEndScreenEvent"] = game:GetService("ReplicatedStorage").Networking.EndScreen.HideEndScreenEvent.OnClientEvent:Connect(
        function(t)
            table.clear(Fluent.Database.Rewards.Main)
            table.clear(Fluent.Database.Rewards.Misc)
            Fluent.Database.Game.Reset = true
            Fluent.Database["Cannot be next act"] = false
            Fluent.Database["Cannot be retry"] = false
        end
    )

    Fluent.Database.Signals["WaveScreenChange"] = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount:GetPropertyChangedSignal("Text"):Connect(
        function()
            if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text == "0" then
                task.spawn(
                    function()
                        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BoogieMove") then
                            firesignal(game:GetService("Players").LocalPlayer.PlayerGui.BoogieMove.Holder.Cancel.Button.Activated)
                        end
                        Fluent.Database.Macro.Action.Delete()
                        Fluent.Database.Mohato.Action.Delete()
                        table.clear(Fluent.Database.Macro.Value)
                        Fluent.Database.Macro.Value.Database = {World = "", Units = {}}

                        repeat
                            task.wait()
                        until not getupvalues(require(game:GetService("StarterPlayer").Modules.Gameplay.WaveSkipHandler)._Init)[2]
                        Fluent.Database.Game.Reset = false
                    end
                )
                if Configs["Macro Play"].Value then
                    Fluent.Database.Macro.Action.Delete()

                    Configs["Macro Play"].Value = false

                    Configs["Macro Play"]:SetValue(false)
                    task.wait(0.125)
                    Configs["Macro Play"]:SetValue(true)
                end
            end
        end
    )

    Fluent.Database.Signals["MohatoHealthEvent"] = game:GetService("ReplicatedStorage").Networking.ClientListeners.HealthBar.MohatoHealthEvent.OnClientEvent:Connect(
        function(t, v)
            if t == "Update" and v.WavesElapsed == v.WavesNeeded then
                Fluent.Database.Mohato.Spawned = true
                task.spawn(_MohatoPlaying)
            end
        end
    )

    Configs["Auto Mohato"]:OnChanged(
        function(v)
            if Configs["Auto Save Configuration"] and Configs["Auto Save Configuration"].Value then
                SaveSettings:Save("Configuration")
            end
            if v and Fluent.Database.Mohato.Spawned and table.find(Fluent.Database.Vanguards._Slot().Unit, Configs["Select Unit (Mohato)"].Value) then
                task.spawn(_MohatoPlaying)
            else
                Fluent.Database.Mohato.Action.Delete()
            end
        end
    )

    Configs["Auto Choose Modifier"]:OnChanged(
        function(v)
            if Configs["Auto Save Configuration"] and Configs["Auto Save Configuration"].Value then
                SaveSettings:Save("Configuration")
            end
            if v and #game:GetService("Players").LocalPlayer.PlayerGui.Frames.Modifiers.Main:GetChildren() > 4 then
                task.spawn(_ModifiersVote)
            end
        end
    )

    Fluent.Database.Signals["ModifierShowUp"] = game:GetService("Players").LocalPlayer.PlayerGui.Frames.Modifiers.Main.ChildAdded:Connect(
        function(child)
            if child:IsA("Frame") and Configs["Auto Vote Debuff"].Value and not Fluent.Database.Game.Vote then
                Fluent.Database.Game.Vote = ""
                task.wait(0.325)
                task.spawn(_ModifiersVote)
            end
        end
    )

    Fluent.Database.Signals["RewardsDisplay"] = game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(
        function(child)
            if child.Name == "RewardsDisplay" then
                task.spawn(
                    function()
                        repeat
                            Fluent.Database.Game.Click()
                            task.wait()
                        until Fluent.Unloaded or not child.Parent
                    end
                )
            end
        end
    )

    Fluent.Database.Signals["RecordEvent"] = game:GetService("ReplicatedStorage").Networking.UnitEvent.OnClientEvent:Connect(
        function(t, v, u)
            if t == "Render" and v.Player == game:GetService("Players").LocalPlayer then
                task.spawn(
                    function()
                        repeat
                            task.wait()
                        until Fluent.Unloaded or _UnitSpawned(tostring(v.UniqueIdentifier))
                        if not Fluent.Database.Game.Units[tostring(v.UniqueIdentifier)] then
                               Fluent.Database.Game.Units[tostring(v.UniqueIdentifier)] = _UnitSpawned(tostring(v.UniqueIdentifier))
                        end
                    end
                )
                if Configs["Macro Record"].Value and not (Configs["Auto Mohato"].Value and Fluent.Database.Mohato.Spawned and Fluent.Database.Mohato.Position and (Fluent.Database.Mohato.Position == v.Position or (Fluent.Database.Mohato.Position - v.Position).Magnitude <= 1.625)) then
                    local c = function()
                        return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                    end

                    Fluent.Database.Macro.Action.Delete()
                    _MacroDatabase(v.Data.Name)
                    _MacroInsert(
                        {
                            ["Type"] = "SpawnUnit",
                            ["Unit"] = v.Data.Name,
                            ["Time"] = tostring(_UseTime()),
                            ["Money"] = tostring(_UseMoney("Place", v.Data.Name)),
                            ["CFrame"] = tostring(v.Position),
                            ["Rotation"] = tostring(v.Rotation)
                        }
                    )
                    _MacroWrite()
                    Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
                end
            elseif t == "Remove" and Fluent.Database.Game.Units[tostring(v)] then
                if Configs["Macro Record"].Value and not Fluent.Database.Game.Reset then
                    if Configs["Auto Sell (Select Unit)"].Value and #Configs["Select Unit (Sell)"].Tables > 0 and table.find(Configs["Select Unit (Sell)"].Tables, Fluent.Database.Game.Units[tostring(v)].Name) and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text) >= tonumber(Configs["Select Wave (Sell / Leave)"].Value) then
                    elseif Configs["Auto Mohato"].Value and Fluent.Database.Mohato.LastPosition and (Fluent.Database.Mohato.LastPosition == Vector3.new(table.unpack(Fluent.Database.Game.Units[tostring(v)].Position:gsub(" ", ""):split(","))) or (Fluent.Database.Mohato.LastPosition - Vector3.new(table.unpack(Fluent.Database.Game.Units[tostring(v)].Position:gsub(" ", ""):split(",")))).Magnitude <= 1.625) then
                        Fluent.Database.Mohato.LastPosition = false
                    elseif Configs["Auto Mohato"].Value and Fluent.Database.Mohato.SellUnit and tostring(Fluent.Database.Mohato.SellUnit) == tostring(v) then
                        Fluent.Database.Mohato.SellUnit = false
                    else
                        local n, c = Fluent.Database.Game.Units[tostring(v)], function()
                            return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                        end

                        Fluent.Database.Macro.Action.Delete()
                        _MacroDatabase(n.Name)
                        _MacroInsert(
                            {
                                ["Type"] = "SellUnit",
                                ["Unit"] = n.Name,
                                ["Time"] = tostring(_UseTime()),
                                ["Money"] = "0",
                                ["CFrame"] = n.Position
                            }
                        )
                        _MacroWrite()
                        Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
                    end
                end
                Fluent.Database.Game.Units[tostring(v)] = nil
            elseif t == "Upgrade" and u.Player == game:GetService("Players").LocalPlayer then
                if Configs["Macro Record"].Value and not (Configs["Auto Mohato"].Value and Fluent.Database.Mohato.Spawned and Fluent.Database.Mohato.Position and (Fluent.Database.Mohato.Position == u.Position or (Fluent.Database.Mohato.Position - u.Position).Magnitude <= 1.625)) then
                    local c = function()
                        return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                    end

                    Fluent.Database.Macro.Action.Delete()
                    _MacroDatabase(u.Data.Name)
                    _MacroInsert(
                        {
                            ["Type"] = "UpgradeUnit",
                            ["Unit"] = u.Data.Name,
                            ["Time"] = tostring(_UseTime()),
                            ["Money"] = tostring(_UnitsData(u.Data.Name).Upgrades[u.Data.CurrentUpgrade].Price),
                            ["Value"] = tostring(u.Data.CurrentUpgrade - 1),
                            ["CFrame"] = tostring(u.Position)
                        }
                    )
                    _MacroWrite()
                    Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
                end
            elseif t == "ChangePriority" and u.Player == game:GetService("Players").LocalPlayer then
                if Configs["Macro Record"].Value then
                    local c = function()
                        return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                    end

                    Fluent.Database.Macro.Action.Delete()
                    _MacroDatabase(u.Data.Name)
                    _MacroInsert(
                        {
                            ["Type"] = "ChangePriority",
                            ["Unit"] = u.Data.Name,
                            ["Time"] = tostring(_UseTime()),
                            ["Money"] = "0",
                            ["Value"] = _PriorityWithNumber(u.Data.Priority),
                            ["CFrame"] = tostring(u.Position)
                        }
                    )
                    _MacroWrite()
                    Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
                end
            elseif t == "ChangePosition" and Fluent.Database.Boogies.Start and tostring(v.UnitGUID) ~= tostring(Fluent.Database.Boogies.Start.Key) then
                local n, c = Fluent.Database.Game.Units[tostring(v.UnitGUID)], function()
                    return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                end
                Fluent.Database.Boogies.Select = n

                if Configs["Macro Record"].Value and Fluent.Database.Boogies.Select and Fluent.Database.Boogies.Start then
                    local s1, s2 = Fluent.Database.Boogies.Start,
                                   Fluent.Database.Boogies.Select

                    Fluent.Database.Macro.Action.Delete()
                    _MacroDatabase(s1.Name)
                    _MacroDatabase(s2.Name)
                    _MacroInsert(
                        {
                            ["Type"] = "BoogieMove",
                            ["Unit"] = s1.Name,
                            ["Selected"] = {
                                ["Unit"] = s2.Name,
                                ["CFrame"] = s2.Position
                            },
                            ["Time"] = tostring(_UseTime()),
                            ["Money"] = "0",
                            ["CFrame"] = s1.Position
                        }
                    )
                    _MacroWrite()
                    Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
                    Fluent.Database.Macro.Action.Create(c(), c()["Selected"]["CFrame"], s2.Name)
                end
                if Fluent.Database.Boogies.Select and Fluent.Database.Boogies.Start then
                    local s1, s2 = Fluent.Database.Boogies.Start,
                                   Fluent.Database.Boogies.Select

                    if Fluent.Database.Game.Units[tostring(s1.Key)] and Fluent.Database.Game.Units[tostring(s2.Key)] then
                        task.spawn(
                            function()
                                repeat
                                    task.wait()
                                until Fluent.Unloaded or (s1.Position ~= _UnitSpawned(tostring(s1.Key)).Position and s2.Position ~= _UnitSpawned(tostring(s2.Key)).Position)
                                Fluent.Database.Game.Units[tostring(s1.Key)] = _UnitSpawned(tostring(s1.Key))
                                Fluent.Database.Game.Units[tostring(s2.Key)] = _UnitSpawned(tostring(s2.Key))
                                Fluent.Database.Boogies.Select = nil
                                Fluent.Database.Boogies.Start = nil
                            end
                        )
                    end
                end
            end
        end
    )

    Fluent.Database.Signals["BoogieStart"] = game:GetService("ReplicatedStorage").Networking.Abilities.BoogieEvent.OnClientEvent:Connect(
        function(t, v)
            if t == "Start" and Fluent.Database.Game.Units[tostring(v.UnitGUID)] then
                Fluent.Database.Boogies.Start = Fluent.Database.Game.Units[tostring(v.UnitGUID)]
            end
        end
    )

    Fluent.Database.Signals["RecordAbility"] = game:GetService("ReplicatedStorage").Networking.AbilityEvent.OnClientEvent:Connect(
        function(t, v, u)
            if t == "UpdateCooldown" and not table.find({"Boogie"}, u.AbilityName) and Fluent.Database.Game.Units[tostring(v)] then
                if Configs["Macro Record"].Value then
                    local n, c = Fluent.Database.Game.Units[tostring(v)], function()
                        return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                    end

                    Fluent.Database.Macro.Action.Delete()
                    _MacroDatabase(n.Name)
                    _MacroInsert(
                        {
                            ["Type"] = "UseAbility",
                            ["Unit"] = n.Name,
                            ["Time"] = tostring(_UseTime()),
                            ["Money"] = "0",
                            ["Value"] = tostring(u.AbilityName),
                            ["CFrame"] = n.Position
                        }
                    )
                    _MacroWrite()
                    Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
                end
            end
        end
    )

    Fluent.Database.Signals["RecordAutoAbility"] = game:GetService("ReplicatedStorage").Networking.ClientListeners.Units.AutoAbilityEvent.OnClientEvent:Connect(
        function(v, i)
            if Configs["Macro Record"].Value then
                local n, c = Fluent.Database.Game.Units[tostring(v)], function()
                    return Fluent.Database.Macro.Value[tostring(#Fluent.Database.Macro.Value)]
                end

                Fluent.Database.Macro.Action.Delete()
                _MacroDatabase(n.Name)
                _MacroInsert(
                    {
                        ["Type"] = "AutoAbility",
                        ["Unit"] = n.Name,
                        ["Time"] = tostring(_UseTime()),
                        ["Money"] = "0",
                        ["CFrame"] = n.Position
                    }
                )
                _MacroWrite()
                Fluent.Database.Macro.Action.Create(c(), c()["CFrame"])
            end
        end
    )

    Configs["Macro Play"]:OnChanged(
        function()
            if Configs["Auto Save Configuration"] and Configs["Auto Save Configuration"].Value then
                SaveSettings:Save("Configuration")
            end
            if Fluent.Unloaded or not Configs["Macro Play"].Value then
                Fluent.Database.Macro.Index = 0
                Fluent.Database.Macro.Ended = nil
                Fluent.Database.Macro.Playing = nil
                Fluent.Database.Macro.Action.Delete()
            else
                if not isfile then
                    Fluent:Notify(
                        {
                            Title = "Notification",
                            SubContent = "The executor doesn't support isfile",
                            Disable = true,
                            Duration = 5
                        }
                    )
                    Configs["Macro Play"]:SetValue(false)
                elseif not readfile then
                    Fluent:Notify(
                        {
                            Title = "Notification",
                            SubContent = "The executor doesn't support readfile",
                            Disable = true,
                            Duration = 5
                        }
                    )
                    Configs["Macro Play"]:SetValue(false)
                elseif not _MacroSelect() then
                    Fluent:Notify(
                        {
                            Title = "Notification",
                            SubContent = "Select macro file first",
                            Disable = true,
                            Duration = 5
                        }
                    )
                    Configs["Macro Play"]:SetValue(false)
                elseif not isfile(Otherfunction:FormatLocation(_MacroSelect())) then
                    Fluent:Notify(
                        {
                            Title = "Notification",
                            SubContent = "Can't find selected file",
                            Disable = true,
                            Duration = 5
                        }
                    )
                    Configs["Macro Play"]:SetValue(false)
                else
                    Fluent.Database.Macro.Playing = game:GetService("HttpService"):JSONDecode(readfile(Otherfunction:FormatLocation(_MacroSelect())))
                    setmetatable(Fluent.Database.Macro.Playing, Fluent.Database._len({"Database"}))
                    if #Fluent.Database.Macro.Playing == 0 then
                        Fluent:Notify(
                            {
                                Title = "Notification",
                                SubContent = "Record action first",
                                Disable = true,
                                Duration = 5
                            }
                        )
                        Configs["Macro Play"]:SetValue(false)
                    elseif Fluent.Database.Macro.Playing.Database.World ~= _StageName() then
                        Fluent:Notify(
                            {
                                Title = "Notification",
                                SubContent = "World doesn't match the database",
                                Disable = true,
                                Duration = 5
                            }
                        )
                        Configs["Macro Play"]:SetValue(false)
                    else
                        task.wait(0.125)
                        for i = 1, #Fluent.Database.Macro.Playing do
                            task.wait(
                                Configs["Macro Delay"].Value
                            )
                            Fluent.Database.Macro.Index = i
                            local n = Fluent.Database.Macro.Playing[tostring(i)]

                            if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                break
                            end
                            if n["Type"] == "SpawnUnit" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not table.find(Fluent.Database.Vanguards._Slot().Unit, n["Unit"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to SpawnUnit",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif _UnitPlaced(n["Unit"], n["CFrame"], "Check", "Anything") then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit already on this place",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif #Fluent.Database.Vanguards._CurrentPlaceUnit(n["Unit"]).Placed >= Fluent.Database.Vanguards._CurrentPlaceUnit(n["Unit"]).MaxPlace then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit already on max place",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if not _UnitPlaced(n["Unit"], n["CFrame"], "Check", "Anything") then
                                        game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Render",
                                        {
                                            n["Unit"],
                                            _UnitsData(n["Unit"]).ID,
                                            Vector3.new(table.unpack(n["CFrame"]:gsub(" ", ""):split(","))),
                                            tonumber(n["Rotation"])
                                        }
                                    )
                                    task.wait(0.425)
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            elseif n["Type"] == "SellUnit" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to SellUnit",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) then
                                        game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Sell", _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                        task.wait(0.125)
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            elseif n["Type"] == "UseAbility" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to UseAbility",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]).ActiveAbility or _UnitPlaced(n["Unit"], n["CFrame"]).ActiveAbility ~= n["Value"] then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit can't find ability to use",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) then
                                        game:GetService("ReplicatedStorage").Networking.AbilityEvent:FireServer("Activate", _UnitPlaced(n["Unit"], n["CFrame"]).Key, n["Value"])
                                        task.wait(0.125)
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            elseif n["Type"] == "AutoAbility" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to UseAbility",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]).ActiveAbility then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit can't find ability to use",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) then
                                        game:GetService("ReplicatedStorage").Networking.ClientListeners.Units.AutoAbilityEvent:FireServer("Enable", _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                        task.wait(0.125)
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            elseif n["Type"] == "UpgradeUnit" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to UpgradeUnit",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif _UnitPlaced(n["Unit"], n["CFrame"]).CurrentUpgrade >= tonumber(n["Value"] + 1) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit already on this upgrade",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) then
                                        game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Upgrade", _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                        task.wait(0.425)
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) and _UnitPlaced(n["Unit"], n["CFrame"]).CurrentUpgrade < tonumber(n["Value"] + 1) then
                                        repeat
                                            if _UnitPlaced(n["Unit"], n["CFrame"]) and tonumber(Fluent.Database.Vanguards._Yen()) >= tonumber(_UnitsData(n["Unit"]).Upgrades[tonumber(n["Value"] + 1)].Price) then
                                                game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("Upgrade", _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                                task.wait(0.425)
                                            end
                                            task.wait()
                                        until Fluent.Unloaded or not Configs["Macro Play"].Value or not _UnitPlaced(n["Unit"], n["CFrame"]) or _UnitPlaced(n["Unit"], n["CFrame"]).CurrentUpgrade >= tonumber(n["Value"] + 1)
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            elseif n["Type"] == "ChangePriority" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to ChangePriority",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif _PriorityWithNumber(_UnitPlaced(n["Unit"], n["CFrame"]).Priority) == n["Value"] then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit already on this priority",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) then
                                        game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("ChangePriority", _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                        task.wait(0.425)
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) and _PriorityWithNumber(_UnitPlaced(n["Unit"], n["CFrame"]).Priority) ~= n["Value"] then
                                        repeat
                                            game:GetService("ReplicatedStorage").Networking.UnitEvent:FireServer("ChangePriority", _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                            task.wait(0.425)
                                        until Fluent.Unloaded or not Configs["Macro Play"].Value or not _UnitPlaced(n["Unit"], n["CFrame"]) or _PriorityWithNumber(_UnitPlaced(n["Unit"], n["CFrame"]).Priority) == n["Value"]
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            elseif n["Type"] == "BoogieMove" then
                                if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                    break
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]) or not _UnitPlaced(n["Selected"]["Unit"], n["Selected"]["CFrame"]) then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Invalid unit to BoogieMove",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                elseif not _UnitPlaced(n["Unit"], n["CFrame"]).ActiveAbility then
                                    Fluent:Notify(
                                        {
                                            Title = "Notification",
                                            SubContent = "Unit can't find ability to use",
                                            Disable = true,
                                            Duration = 5
                                        }
                                    )
                                else
                                    local h = 0
                                    Fluent.Database.Macro.Action.Create(n, n["CFrame"])
                                    Fluent.Database.Macro.Action.Create(n, n["Selected"]["CFrame"], n["Selected"]["Unit"])
                                    _MacroWating(n)
                                    if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                        Fluent.Database.Macro.Action.Delete()
                                        break
                                    end
                                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BoogieMove") then
                                        firesignal(game:GetService("Players").LocalPlayer.PlayerGui.BoogieMove.Holder.Cancel.Button.Activated)
                                        task.wait(0.125)
                                    end
                                    if _UnitPlaced(n["Unit"], n["CFrame"]) then
                                        game:GetService("ReplicatedStorage").Networking.AbilityEvent:FireServer("Activate", _UnitPlaced(n["Unit"], n["CFrame"]).Key, "Boogie")
                                        task.wait(0.325)
                                    end
                                    repeat
                                        h += 1
                                        task.wait(0.1)
                                    until Fluent.Unloaded or not Configs["Macro Play"].Value or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BoogieMove") or h >= 500 or (Fluent.Database.Boogies.Start and Fluent.Database.Boogies.Start.Key == _UnitPlaced(n["Unit"], n["CFrame"]).Key)
                                    if Fluent.Database.Boogies.Start and _UnitPlaced(n["Unit"], n["CFrame"]) and Fluent.Database.Boogies.Start.Key == _UnitPlaced(n["Unit"], n["CFrame"]).Key then
                                        if _UnitPlaced(n["Unit"], n["CFrame"]) and _UnitPlaced(n["Selected"]["Unit"], n["Selected"]["CFrame"]) then
                                            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BoogieMove") == nil then
                                                game:GetService("ReplicatedStorage").Networking.AbilityEvent:FireServer("Activate", _UnitPlaced(n["Unit"], n["CFrame"]).Key, "Boogie")
                                                task.wait(0.325)
                                                game:GetService("ReplicatedStorage").Networking.Abilities.BoogieEvent:FireServer("Move", {["SelectedUnitGUID"] = _UnitPlaced(n["Selected"]["Unit"], n["Selected"]["CFrame"]).Key, ["UnitGUID"] = _UnitPlaced(n["Unit"], n["CFrame"]).Key})
                                                task.wait(0.125)
                                                game:GetService("ReplicatedStorage").Networking.Abilities.BoogieEvent:FireServer("CancelMove", {})
                                            else
                                                firesignal(game:GetService("Players").LocalPlayer.PlayerGui.BoogieMove.Holder.Cancel.Button.Activated)
                                                task.wait(0.125)
                                                game:GetService("ReplicatedStorage").Networking.AbilityEvent:FireServer("Activate", _UnitPlaced(n["Unit"], n["CFrame"]).Key, "Boogie")
                                                task.wait(0.325)
                                                game:GetService("ReplicatedStorage").Networking.Abilities.BoogieEvent:FireServer("Move", {["SelectedUnitGUID"] = _UnitPlaced(n["Selected"]["Unit"], n["Selected"]["CFrame"]).Key, ["UnitGUID"] = _UnitPlaced(n["Unit"], n["CFrame"]).Key})
                                                task.wait(0.125)
                                                game:GetService("ReplicatedStorage").Networking.Abilities.BoogieEvent:FireServer("CancelMove", {})
                                            end
                                        end
                                    end
                                    Fluent.Database.Macro.Action.Delete()
                                end
                            end
                            if Fluent.Unloaded or not Configs["Macro Play"].Value or not Fluent.Database.Macro.Playing then
                                break
                            elseif i >= #Fluent.Database.Macro.Playing then
                                Fluent.Database.Macro.Ended = ""
                            end
                            task.wait(0.0875)
                        end
                    end
                end
            end
        end
    )

end
