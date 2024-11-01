    if (game:GetService"Players".LocalPlayer.Character or game:GetService"Players".LocalPlayer.CharacterAdded:Wait()) and game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Name = "Destroy After Finish"
        local Clone_hum = game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Clone()
        Clone_hum.Parent = game:GetService"Players".LocalPlayer.Character
        Clone_hum.Name = "Humanoid"
        wait(0.1)
        game:GetService"Players".LocalPlayer.Character:FindFirstChild("Destroy After Finish"):Destroy()
        game:GetService"Workspace".CurrentCamera.CameraSubject = game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        game:GetService"Players".LocalPlayer.Character.Animate.Disabled = true
        wait(0.1)
        game:GetService"Players".LocalPlayer.Character.Animate.Disabled = false
    end
