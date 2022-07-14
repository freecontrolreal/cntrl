function RandomLetterGen(length)
    local data = ''
    for i=1,tonumber(length) do
        data = data..''..string.char(math.random(97, 122))
    end
    return data
end

function FormatNumToStyle(arg)
    return tostring(arg):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function FormAirlock(hieght)
    if workspace:FindFirstChild("Float") then
        workspace:FindFirstChild("Float"):Destroy()
    end
    for i,v in pairs(game:service"Players".LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid'):GetPlayingAnimationTracks()) do
        if v.Name == "Float" then
            v:Stop()
        end
    end
    game:service"Players".LocalPlayer.Character.HumanoidRootPart.Anchored = false
    local Part = Instance.new("Part",workspace)
    Part.Transparency = 1
    Part.Size = Vector3.new(5,1,5)
    Part.CFrame = game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,tonumber(hieght),0)
    Part.Anchored = true
    game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame=game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,tonumber(hieght)+1,0)
    wait(1)
    local Anim = Instance.new("Animation",workspace)
    Anim.Name = "Float"
    Anim.AnimationId = 'rbxassetid://3541114300'
    game:service"Players".LocalPlayer.Character.Humanoid:LoadAnimation(Anim):Play()
    game:service"Players".LocalPlayer.Character.HumanoidRootPart.Anchored = true
    Part:Destroy()
end

function CheckForPlr(userid)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.UserId == userid then
            return true
        end
    end
    return false
end

function ReformAltList()
    if Alts then
        local new = {}
        for _, v2 in pairs(Alts) do
            if CheckForPlr(v2) == true then
                table.insert(new,v2)
            end
        end
        return new
    end
end

function FormLine(anchor,listofcords)
    local list = ReformAltList()
    for i,v in pairs(list) do
        if v == game:service"Players".LocalPlayer.UserId then
            game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame = anchor.CFrame*CFrame.new(listofcords[i]:split(",")[1],0,0)
        end
    end
end

function ResetAlt()
    local oldpos = game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game:service"Players".LocalPlayer.Character:GetChildren()) do
        if v:IsA("MeshPart") then
            v:Destroy()
        end
    end
    game:service"Players".LocalPlayer.CharacterAdded:Wait()
    game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
end

function Setup(listofcords)
    local new = ReformAltList()
    for i,v in pairs(new) do
        if v == game:service"Players".LocalPlayer.UserId then
            local x,y,z = v:split(listofcords[i],",")[1],v:split(listofcords[i],",")[2],v:split(listofcords[i],",")[3]
            game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
        end
    end
end
