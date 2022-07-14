for _, plr in pairs(workspace.Players:GetChildren()) do
    if game:service"Players"[plr.Name].UserId == game:service"Players".LocalPlayer.UserId then return end
    if game:service"Players"[plr.Name].UserId == Settings['host'] then return end
    if not table.find(Alts,plr.UserId) then return end
    print("W?")
    repeat wait() until plr.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart")
    print("Big W")
    plr:Destroy()
end

game:service"Workspace".Players.ChildAdded:Connect(function(plr)
    if game:service"Players"[plr.Name].UserId == game:service"Players".LocalPlayer.UserId then return end
    if game:service"Players"[plr.Name].UserId == Settings['host'] then return end
    if not table.find(Alts,plr.UserId) then return end
    print("W?")
    repeat wait() until plr.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart")
    print("Big W")
    plr:Destroy()
end)

game:service"Players".LocalPlayer.Idled:Connect(function()
    game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
