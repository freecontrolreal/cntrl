for _, plr in pairs(workspace.Players:GetChildren()) do
    print('reading')
    if game:service"Players"[plr.Name].UserId ~= game:service"Players".LocalPlayer.UserId and game:service"Players"[plr.Name].UserId ~= Settings['host'] and table.find(Alts,plr.UserId) then
        for i,v in pairs(plr:GetChildren()) do
            v:Destroy()
        end
    end
end

game:service"Workspace".Players.ChildAdded:Connect(function(plr)
    print('reading')
    if game:service"Players"[plr.Name].UserId ~= game:service"Players".LocalPlayer.UserId and game:service"Players"[plr.Name].UserId ~= Settings['host'] and table.find(Alts,plr.UserId) then
        for i,v in pairs(plr:GetChildren()) do
            v:Destroy()
        end
    end
end)

game:service"Players".LocalPlayer.Idled:Connect(function()
    game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
