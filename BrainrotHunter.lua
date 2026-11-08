
-- BRAINROT HUNTER
-- Roblox Studio - LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotHunter"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 320, 0, 300)
main.Position = UDim2.new(0.5, -160, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "BRAINROT HUNTER"
title.TextColor3 = Color3.fromRGB(255, 220, 70)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.Parent = main

local status = Instance.new("TextLabel")
status.Position = UDim2.new(0, 10, 0, 250)
status.Size = UDim2.new(1, -20, 0, 35)
status.BackgroundTransparency = 1
status.Text = "Status: Bereit"
status.TextColor3 = Color3.new(1, 1, 1)
status.TextSize = 14
status.Parent = main

local searching = false
local secretEnabled = true
local ogEnabled = true

local function createButton(name, text, y)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Position = UDim2.new(0, 20, 0, y)
    button.Size = UDim2.new(1, -40, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.TextSize = 15
    button.Font = Enum.Font.GothamBold
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    return button
end

local secretButton = createButton("SecretFilter", "Secret: ON", 65)
local ogButton = createButton("OGFilter", "OG: ON", 115)
local startButton = createButton("Start", "START AUTO JOIN", 165)
local stopButton = createButton("Stop", "STOP", 210)

secretButton.MouseButton1Click:Connect(function()
    secretEnabled = not secretEnabled
    secretButton.Text = "Secret: " .. (secretEnabled and "ON" or "OFF")
end)

ogButton.MouseButton1Click:Connect(function()
    ogEnabled = not ogEnabled
    ogButton.Text = "OG: " .. (ogEnabled and "ON" or "OFF")
end)

startButton.MouseButton1Click:Connect(function()
    if not secretEnabled and not ogEnabled then
        status.Text = "Aktiviere mindestens einen Filter!"
        return
    end

    searching = true
    status.Text = "Status: Suche aktiviert!"
end)

stopButton.MouseButton1Click:Connect(function()
    searching = false
    status.Text = "Status: Gestoppt"
end)

print("BRAINROT HUNTER geladen!")
