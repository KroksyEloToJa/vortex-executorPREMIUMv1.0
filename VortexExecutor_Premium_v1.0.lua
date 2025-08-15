-- Vortex Executor Premium v1.0
local player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VortexExecutor_Premium"
screenGui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,0)
title.Text = "Vortex Executor Premium v1.0"
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

-- Key prompt
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0,50)
keyBox.PlaceholderText = "Enter Premium Key"
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
keyBox.Parent = frame

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.8,0,0,40)
submitBtn.Position = UDim2.new(0.1,0,0,100)
submitBtn.Text = "Submit Key"
submitBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.Parent = frame

-- Function to create buttons
local function createButton(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Parent = frame
    btn.MouseButton1Click:Connect(callback)
end

-- Function to unlock premium GUI
local function unlockPremium()
    if keyBox.Text ~= "V94JASF" then
        warn("Invalid key!")
        return
    end

    -- Resize main frame
    frame.Size = UDim2.new(0, 400, 0, 550)

    -- Remove key input
    keyBox:Destroy()
    submitBtn:Destroy()

    -- Free features
    createButton("Infinite Yield", 60, function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    createButton("Dex Explorer", 110, function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
    end)

    createButton("Fly (Better)", 160, function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
    end)

    createButton("Kick Player", 210, function()
        local username = game:GetService("Players"):GetPlayers()[1] and game:GetService("Players"):GetPlayers()[1].Name
        local target = game:GetService("Players"):FindFirstChild(username)
        if target then target:Kick("Kicked via Vortex Executor Premium") end
    end)

    createButton("Ban Player", 260, function()
        local username = game:GetService("Players"):GetPlayers()[1] and game:GetService("Players"):GetPlayers()[1].Name
        local target = game:GetService("Players"):FindFirstChild(username)
        if target then target:Kick("Banned via Vortex Executor Premium") end
    end)

    -- Premium features
    createButton("Lua Executor", 310, function()
        local execFrame = Instance.new("Frame")
        execFrame.Size = UDim2.new(0, 400, 0, 300)
        execFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
        execFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
        execFrame.BorderSizePixel = 0
        execFrame.Active = true
        execFrame.Draggable = true
        execFrame.Parent = screenGui

        local codeBox = Instance.new("TextBox")
        codeBox.Size = UDim2.new(1, -20, 1, -60)
        codeBox.Position = UDim2.new(0, 10, 0, 10)
        codeBox.ClearTextOnFocus = false
        codeBox.MultiLine = true
        codeBox.Text = "-- Write Lua here"
        codeBox.TextWrapped = true
        codeBox.TextColor3 = Color3.new(1,1,1)
        codeBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
        codeBox.Parent = execFrame

        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(0, 100, 0, 40)
        runBtn.Position = UDim2.new(0.5, -50, 1, -50)
        runBtn.Text = "Execute"
        runBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
        runBtn.TextColor3 = Color3.new(1,1,1)
        runBtn.Parent = execFrame

        runBtn.MouseButton1Click:Connect(function()
            local success, err = pcall(function()
                loadstring(codeBox.Text)()
            end)
            if not success then warn("Error: "..err) end
        end)
    end)

    createButton("CoolKid GUI", 360, function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/199083/scripts/C00LKID.lua"))()
    end)

    createButton("Noclip (Hold Shift)", 410, function()
        local noclip = false
        local character = player.Character
        local function toggleNoclip()
            noclip = not noclip
        end

        UserInputService.InputBegan:Connect(function(input, gpe)
            if input.KeyCode == Enum.KeyCode.LeftShift then
                toggleNoclip()
            end
        end)

        RunService.Stepped:Connect(function()
            if noclip and character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end)

    -- Copy Game
    createButton("Copy Game", 460, function()
        local cloneFolder = Instance.new("Folder")
        cloneFolder.Name = "VortexCopiedGame"
        cloneFolder.Parent = game:GetService("ReplicatedStorage")

        local servicesToCopy = {game:GetService("Workspace"), game:GetService("StarterGui"), game:GetService("Lighting"), game:GetService("ReplicatedStorage")}
        for _, service in pairs(servicesToCopy) do
            local clone = service:Clone()
            clone.Parent = cloneFolder
        end

        warn("Game copied to ReplicatedStorage.VortexCopiedGame!")
    end)

    createButton("Close Vortex Executor", 510, function()
        screenGui:Destroy()
    end)
end

submitBtn.MouseButton1Click:Connect(unlockPremium)