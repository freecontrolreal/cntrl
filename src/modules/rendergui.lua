local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local NameOut = Instance.new("TextLabel")
local CashOut = Instance.new("TextLabel")

ScreenGui.Parent = game:service"CoreGui"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = RandomLetterGen(math.random(5,10))

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Frame.BorderColor3 = Color3.fromRGB(22, 22, 22)
Frame.BorderSizePixel = 100
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)

NameOut.Name = RandomLetterGen(math.random(5,10))
NameOut.Parent = Frame
NameOut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameOut.BackgroundTransparency = 1.000
NameOut.Position = UDim2.new(0.416597515, 0, 0.391304374, 0)
NameOut.Size = UDim2.new(0, 200, 0, 50)
NameOut.Font = Enum.Font.GothamMedium
NameOut.Text = game:service"Players".LocalPlayer.Name
NameOut.TextColor3 = Color3.fromRGB(255, 255, 255)
NameOut.TextSize = 20.000

CashOut.Name = RandomLetterGen(math.random(5,10))
CashOut.Parent = Frame
CashOut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CashOut.BackgroundTransparency = 1.000
CashOut.Position = UDim2.new(0.416597515, 0, 0.461769134, 0)
CashOut.Size = UDim2.new(0, 200, 0, 50)
CashOut.Font = Enum.Font.GothamMedium
CashOut.Text = "$0"
CashOut.TextColor3 = Color3.fromRGB(255, 255, 255)
CashOut.TextSize = 20.000

spawn(function()
    repeat wait() until workspace.Players:FindFirstChild(game:service"Players".LocalPlayer.Name)
    CashOut.Text = FormatNumToStyle(game:service"Players".LocalPlayer.DataFolder.Currency.Value)
    game:service"Players".LocalPlayer.DataFolder.Currency.Changed:Connect(function()
        CashOut.Text = FormatNumToStyle(game:service"Players".LocalPlayer.DataFolder.Currency.Value)
    end)
end)

game:service"RunService":Set3dRenderingEnabled(false)
