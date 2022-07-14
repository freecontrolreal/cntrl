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

function HeadLockDisattachment()
    if workspace:FindFirstChild("HeadLockPiece") then
        workspace:FindFirstChild("HeadLockPiece"):Destroy()
    end
    if workspace:FindFirstChild("HeadLockWelder") then
        workspace:FindFirstChild("HeadLockWelder"):Destroy()
    end
end

function HeadLockAttachment()
    HeadLockDisattachment()
    local Part = Instance.new("Part",workspace)
    local Weld = Instance.new("Weld",workspace)
    Part.Position = game.Players.LocalPlayer.Character.Head.Position
    Part.Transparency = 1
    Part.Massless = false
    Part.CanCollide = false
    Weld.Part0 = game.Players.LocalPlayer.Character.Head
    Weld.Part1 = Part
    Part.Anchored = true
end
