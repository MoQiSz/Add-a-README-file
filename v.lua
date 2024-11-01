getgenv().Settings = {
-- Start Game Settings
StartGame = {
World = "", -- World Name (CHECK DISCORD)
    Level = "", -- Level Name (CHECK DISCORD)
},

-- Main Configuration
MainConfigurations = {
IsRecording = false, -- Create A Recording (CHECK DISCORD) // false = off / true == on
IsFarming = false, -- Use A Recording (CHECK DISCORD) // false == off / true == on
RecordingName = "", -- Recording File Name ex. SAVE159135.txt / must be inside of workspace folder
}
}

loadstring(game:HttpGet("https://polarsblade.xyz/Hub/AnimeAdventures.txt"))()


------------------------
repeat task.wait() until game:IsLoaded()
-- GetService's
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local CurrentCamera = Workspace.CurrentCamera
local Mouse = Players.LocalPlayer:GetMouse()

-- Script Begins
if game.PlaceId == 8304191830 then
    repeat task.wait() until not Players.LocalPlayer.PlayerGui:FindFirstChild("Loading")

	-- Teleport To Open Lobby
	local AllLobbies = Workspace["_LOBBIES"].Story
	
	for i, Lobby in ipairs(AllLobbies:GetChildren()) do
		if Lobby.Owner.Value == nil then
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Lobby.Door.CFrame
			firetouchinterest(Players.LocalPlayer.Character.HumanoidRootPart, Lobby.Door, 1)
			repeat task.wait() until Players.LocalPlayer.PlayerGui.LevelSelectGui.Enabled == true
			firesignal(Players.LocalPlayer.PlayerGui.LevelSelectGui.MapSelect.Main.Wrapper.Container[getgenv().Settings.StartGame.World].Activated)
			repeat task.wait() until Players.LocalPlayer.PlayerGui.LevelSelectGui.LevelSelect.InfoFrame.LevelButtons:FindFirstChildOfClass("TextButton")

			for i, Level in ipairs(Players.LocalPlayer.PlayerGui.LevelSelectGui.LevelSelect.InfoFrame.LevelButtons:GetChildren()) do
				if Level:IsA("TextButton") and Level.Main:FindFirstChild("text") then
					if Level:FindFirstChild("Main"):FindFirstChild("text").Text == getgenv().Settings.StartGame.Level then
						firesignal(Level.Activated)
						firesignal(Players.LocalPlayer.PlayerGui.LevelSelectGui.LevelSelect.Buttons.Select.Activated)
						firesignal(Players.LocalPlayer.PlayerGui.LevelSelectGui.Buttons.Start.Activated)
					end
				end
			end

			return
		end
	end
else
	if getgenv().Settings.MainConfigurations.IsRecording == true then
		-- Autostart Match
		firesignal(Players.LocalPlayer.PlayerGui.VoteStart.Holder.ButtonHolder.Yes.Activated)

		-- Start Table
		getgenv().CurrentRecording = {

		}
		
		local UnitTable = {

		}

		-- Place Variables
		local UnitContainer = Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Frame.Units
		local CurrentSelection = "0"
		local UnitCount = 0
        local SelectedUnit
		getgenv().Time = tick()

		-- Detect Unit Placements
		Workspace["_UNITS"].ChildAdded:Connect(function(Unit) -- On Object Creation, Run Checks To Detect If It Is A Unit.
			if Unit:WaitForChild("_stats"):WaitForChild("total_spent") then -- Wait For Total Spent
				if Unit:FindFirstChild("_stats"):FindFirstChild("total_spent").Value > 0 then
					UnitCount += 1

					table.insert(getgenv().CurrentRecording, {["Wait"] = tick() - getgenv().Time})
					getgenv().Time = tick()

					table.insert(getgenv().CurrentRecording, {["Place"] = {["UnitNumber"] = CurrentSelection, ["Position"] = tostring(Unit:WaitForChild("HumanoidRootPart").Position)}})
					table.insert(UnitTable, Unit)

					-- Detect Upgrades
					task.spawn(function()
						local AssignedNumber = UnitCount
						Unit:FindFirstChild("_stats"):FindFirstChild("total_spent"):GetPropertyChangedSignal("Value"):Connect(function()
							table.insert(getgenv().CurrentRecording, {["Wait"] = tick() - getgenv().Time})
							getgenv().Time = tick()

							table.insert(getgenv().CurrentRecording, {["Upgrade"] = {["UnitPlacement"] = AssignedNumber}})
						end)

                        local Ignore = false
                        Unit:GetPropertyChangedSignal("Parent"):Connect(function()
                            print("changed")
                            if Unit.Parent ~= game.Workspace["_UNITS"] and Ignore == false then
                                table.insert(getgenv().CurrentRecording, {["Wait"] = tick() - getgenv().Time})
                                getgenv().Time = tick()

                                table.insert(getgenv().CurrentRecording, {["Sell"] = {["UnitPlacement"] = AssignedNumber}})
                                Ignore = true
                            end
                        end)
					end)
				end
			end
		end)

		-- Detect Placement .Activated
		for i, v in ipairs(UnitContainer:GetChildren()) do
			pcall(function()    
				if v:IsA("ImageButton") then
					v.Activated:Connect(function(Button)
						CurrentAction = v.Name
					end)
				end
			end)
		end

		Players.LocalPlayer.PlayerGui.VoteSkip.Holder.ButtonHolder.Yes.Activated:Connect(function()
			table.insert(getgenv().CurrentRecording, {["Wait"] = tick() - getgenv().Time})
			getgenv().Time = tick()

			table.insert(getgenv().CurrentRecording, {["Skip"] = true})
		end)

        -- Unit Selection Detection
        Mouse.Button1Down:Connect(function()
            local Unit
            for i, v in ipairs(Workspace["_UNITS"]:GetChildren()) do
                for i, v2 in ipairs(v:GetDescendants()) do
                    if v2 == Mouse.Target then
                        Unit = v
                    end
                end
            end

            if Unit.Parent == Workspace["_UNITS"] then
                if table.find(UnitTable, Unit) then
                    SelectedUnit = table.find(UnitTable, Unit)
                    print(SelectedUnit)
                end
            end
        end)

        -- Detect Ability Changes
        Players.LocalPlayer.PlayerGui.UnitUpgrade.Primary.Container.Main.Actives.ActiveButton.Activated:Connect(function()
            table.insert(getgenv().CurrentRecording, {["Wait"] = tick() - getgenv().Time})
            getgenv().Time = tick()

            table.insert(getgenv().CurrentRecording, {["ActivateAbility"] = SelectedUnit})
        end)

        Players.LocalPlayer.PlayerGui.UnitUpgrade.Primary.Container.Main.Actives.ActiveButton.Auto.Activated:Connect(function()
            table.insert(getgenv().CurrentRecording, {["Wait"] = tick() - getgenv().Time})
            getgenv().Time = tick()

            table.insert(getgenv().CurrentRecording, {["ActivateAutoAbility"] = SelectedUnit})
        end)

		-- Detect Placement .InputBegan
		UserInputService.InputBegan:Connect(function(Input)
			if Input.KeyCode == Enum.KeyCode.One then
				CurrentSelection = "1"
			elseif Input.KeyCode == Enum.KeyCode.Two then
				CurrentSelection = "2"
			elseif Input.KeyCode == Enum.KeyCode.Three then
				CurrentSelection = "3"
			elseif Input.KeyCode == Enum.KeyCode.Four then
				CurrentSelection = "4"
			elseif Input.KeyCode == Enum.KeyCode.Five then
				CurrentSelection = "5"
			elseif Input.KeyCode == Enum.KeyCode.Six then
				CurrentSelection = "6"
			elseif Input.KeyCode == Enum.KeyCode.Zero then
				SaveNumber = math.random(10000, 99999)
				writefile("SAVE"..tostring(SaveNumber)..".txt", HttpService:JSONEncode(getgenv().CurrentRecording))
				warn("SAVED AS: SAVE"..tostring(SaveNumber)..".txt")
			end
		end)
	elseif getgenv().Settings.MainConfigurations.IsFarming == true then
		-- Wait For Loading
		repeat task.wait() until game:IsLoaded()
		repeat task.wait() until Players.LocalPlayer.PlayerGui:FindFirstChild("spawn_units")
		
		-- Lock Mouse
		game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter

		task.wait(3)
		-- Process Recording
		local File = readfile(getgenv().Settings.MainConfigurations.RecordingName)
		getgenv().Recording = HttpService:JSONDecode(File)

		-- Modify Camera
		CurrentCamera.CameraType = Enum.CameraType.Scriptable

		-- String > Vector3
		local function ToVector3(String, Separator)
			local Separator = Separator or ','
			local axes = {}
			for axis in String:gmatch('[^'..Separator..']+') do
				axes[#axes + 1] = axis
			end

			return Vector3.new(axes[1], axes[2], axes[3])
		end

		-- Start Match
		firesignal(Players.LocalPlayer.PlayerGui.VoteStart.Holder.ButtonHolder.Yes.Activated)

		-- Place Variables
		local Time = tick()
		local UnitContainer = Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Frame.Units

		-- Unit List
		local UnitList = {}
		Workspace["_UNITS"].ChildAdded:Connect(function(Unit)
			if Unit and Unit:WaitForChild("_stats"):WaitForChild("total_spent") then
				if Unit:WaitForChild("_stats"):WaitForChild("total_spent").Value > 0 then
					table.insert(UnitList, Unit)
				end
			end
		end)

        local function Click()
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local X = Workspace.CurrentCamera.ViewportSize.X / 2
            local Y = Workspace.CurrentCamera.ViewportSize.Y / 2
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 0)
            task.wait()
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 0)
        end

        local function CloseOffMenu()
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local X = Workspace.CurrentCamera.ViewportSize.X
            local Y = Workspace.CurrentCamera.ViewportSize.Y
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 0)
            task.wait()
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 0)
        end

		-- Unit Functions
		local function PlaceUnit(UnitNumber, UnitPosition)
			if Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true then
				repeat
					Click()
                    CloseOffMenu()
					task.wait()
				until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
			end

            repeat task.wait() until tonumber(Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Frame.Resource.Money.text.Text) >= tonumber(UnitContainer[UnitNumber].Cost.text.Text)
            CurrentCamera.CFrame = CFrame.new(UnitPosition + Vector3.new(0, 5, 0), UnitPosition)

            firesignal(UnitContainer[UnitNumber].Activated)

            if Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false then
                repeat
					Click()
                    task.wait()
                until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true
            end

			repeat
                Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
		end

		local function UpgradeUnit(UnitNumber)
			CurrentCamera.CFrame = CFrame.new(UnitList[UnitNumber].HumanoidRootPart.Position + Vector3.new(0, 5, 0), UnitList[UnitNumber].HumanoidRootPart.Position)
			if Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true then
				repeat
					Click()
                    CloseOffMenu()
					task.wait()
				until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
			end
			repeat
                Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true

			local CurrentAmount = UnitList[UnitNumber]:FindFirstChild("_stats"):FindFirstChild("total_spent").Value
			repeat
				firesignal(Players.LocalPlayer.PlayerGui.UnitUpgrade.Primary.Container.Main.Main.Buttons.Upgrade.Activated)
				task.wait()
			until CurrentAmount < UnitList[UnitNumber]:FindFirstChild("_stats"):FindFirstChild("total_spent").Value

            repeat
                Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
		end

		local function SellUnit(UnitNumber)
			CurrentCamera.CFrame = CFrame.new(UnitList[UnitNumber].HumanoidRootPart.Position + Vector3.new(0, 5, 0), UnitList[UnitNumber].HumanoidRootPart.Position)
			if Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true then
				repeat
					Click()
                    CloseOffMenu()
					task.wait()
				until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
			end
			
			repeat
                Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true
			
			repeat
				firesignal(Players.LocalPlayer.PlayerGui.UnitUpgrade.Primary.Container.Main.Main.Buttons.Sell.Activated)
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
		end

		local function SkipRound()
			firesignal(Players.LocalPlayer.PlayerGui.VoteSkip.Holder.ButtonHolder.Yes.Activated)
		end

        local function ActivateAutoAbility(UnitNumber)
			CurrentCamera.CFrame = CFrame.new(UnitList[UnitNumber].HumanoidRootPart.Position + Vector3.new(0, 5, 0), UnitList[UnitNumber].HumanoidRootPart.Position)
			if Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true then
				repeat
					Click()
                    CloseOffMenu()
					task.wait()
				until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
			end
			
			repeat
                Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true
		
            firesignal(Players.LocalPlayer.PlayerGui.UnitUpgrade.Primary.Container.Main.Actives.ActiveButton.Auto.Activated)
	
			repeat
		        Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
        end

        local function ActivateAbility(UnitNumber)
			CurrentCamera.CFrame = CFrame.new(UnitList[UnitNumber].HumanoidRootPart.Position + Vector3.new(0, 5, 0), UnitList[UnitNumber].HumanoidRootPart.Position)
			if Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true then
				repeat
					Click()
                    CloseOffMenu()
					task.wait()
				until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
			end
			
			repeat
                Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == true
		
            firesignal(Players.LocalPlayer.PlayerGui.UnitUpgrade.Primary.Container.Main.Actives.ActiveButton.Activated)
	
			repeat
		        Click()
                CloseOffMenu()
				task.wait()
			until Players.LocalPlayer.PlayerGui.UnitUpgrade.Enabled == false
        end

		-- Begin Playing Recording
		task.spawn(function()
			for i = 1, #getgenv().Recording do
				for i, v in pairs(getgenv().Recording[i]) do
					pcall(function()
						if i == "Wait" then
							task.wait(v)
						elseif i == "Place" then
							PlaceUnit(v["UnitNumber"], ToVector3(v["Position"]))
						elseif i == "Upgrade" then
							UpgradeUnit(v["UnitPlacement"])
						elseif i == "Sell" then
							SellUnit(v["UnitPlacement"])
						elseif i == "Skip" then
							SkipRound()
                        elseif i == "ActivateAutoAbility" then
                            ActivateAutoAbility(v)
                        elseif i == "ActivateAbility" then
                            ActivateAbility(v)
						end
					end)
				end
			end
		end)

		repeat
			task.wait()
		until game.Players.LocalPlayer.PlayerGui.ResultsUI.Enabled == true

		firesignal(game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.Buttons.Next.Activated)

		repeat
			Click()
            CloseOffMenu()

            local TeleportService = game:GetService("TeleportService")
            local Player = game.Players.LocalPlayer
            TeleportService:Teleport(8304191830, Player)
			task.wait(0.5)
		until game.Players.LocalPlayer.PlayerGui.ResultsUI.Finished.Visible == true

		firesignal(game.Players.LocalPlayer.PlayerGui.ResultsUI.Finished.NextRetry.Activated)
	end	
end
