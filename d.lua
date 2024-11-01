while true and wait() do
    if getgenv().stop then break end
    if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("MoonFragment") and workspace.Map.MoonFragment:FindFirstChild("Part") and workspace.Map.MoonFragment.Part:FindFirstChild("ProximityPrompt") and workspace.Map.MoonFragment.Part.ProximityPrompt.Enabled then
        if fireproximityprompt then
           game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.MoonFragment.Part.CFrame
           fireproximityprompt(workspace.Map.MoonFragment.Part.ProximityPrompt, 1, true)
        else
            workspace.Map.MoonFragment.Part.ProximityPrompt.HoldDuration = 0
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.MoonFragment.Part.CFrame
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, nil)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, nil)
        end
    end
end

getgenv().stop = false
