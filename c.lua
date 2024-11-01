getgenv().Configs = {
    Units = {"Dio Greatest High"},
    Ability = {1, 2}
}

while true and wait(1) do
    if workspace:FindFirstChild("Towers") then
        for i,v in next, workspace.Towers:GetChildren() do
            if table.find(getgenv().Configs.Units, v.Name) then
                if #getgenv().Configs.Ability <= 1 then
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ability"):InvokeServer(v, 1)
                else
                    for X = 1, #getgenv().Configs.Ability do
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ability"):InvokeServer(v, X)
                    end
                end
            end
        end
    end
end

