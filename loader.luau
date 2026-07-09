local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local FlingTargetBox = Instance.new("TextBox") -- Новое поле для ввода никнейма жертвы
local SetSpeedBtn = Instance.new("TextButton")
local ResetSpeedBtn = Instance.new("TextButton")
local InfJumpBtn = Instance.new("TextButton")
local NoclipBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local FlingBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local UICorner_6 = Instance.new("UICorner")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
local UICorner_9 = Instance.new("UICorner") -- Для нового TextBox

ScreenGui.Name = "Emil768TestScript_Gui"
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -205) -- Сдвинул чуть выше
MainFrame.Size = UDim2.new(0, 250, 0, 410) -- Увеличил высоту до 410
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "эмил768 тест скрипт"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 18.000

-- ПОЛЕ ВВОДА СКОРОСТИ
TextBox.Parent = MainFrame
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBox.Position = UDim2.new(0.08, 0, 0.10, 0)
TextBox.Size = UDim2.new(0.84, 0, 0, 30)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Введите скорость (напр. 50)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 15.000

UICorner_2.Parent = TextBox

SetSpeedBtn.Name = "SetSpeedBtn"
SetSpeedBtn.Parent = MainFrame
SetSpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
SetSpeedBtn.Position = UDim2.new(0.08, 0, 0.20, 0)
SetSpeedBtn.Size = UDim2.new(0.84, 0, 0, 30)
SetSpeedBtn.Font = Enum.Font.SourceSansBold
SetSpeedBtn.Text = "ПРИМЕНИТЬ СКОРОСТЬ"
SetSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SetSpeedBtn.TextSize = 13.000

UICorner_3.Parent = SetSpeedBtn

ResetSpeedBtn.Name = "ResetSpeedBtn"
ResetSpeedBtn.Parent = MainFrame
ResetSpeedBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ResetSpeedBtn.Position = UDim2.new(0.08, 0, 0.30, 0)
ResetSpeedBtn.Size = UDim2.new(0.84, 0, 0, 30)
ResetSpeedBtn.Font = Enum.Font.SourceSansBold
ResetSpeedBtn.Text = "СБРОСИТЬ НА СТАНДАРТ"
ResetSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetSpeedBtn.TextSize = 12.000

UICorner_4.Parent = ResetSpeedBtn

InfJumpBtn.Name = "InfJumpBtn"
InfJumpBtn.Parent = MainFrame
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
InfJumpBtn.Position = UDim2.new(0.08, 0, 0.41, 0)
InfJumpBtn.Size = UDim2.new(0.84, 0, 0, 30)
InfJumpBtn.Font = Enum.Font.SourceSansBold
InfJumpBtn.Text = "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВЫКЛ"
InfJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJumpBtn.TextSize = 12.000

UICorner_5.Parent = InfJumpBtn

NoclipBtn.Name = "NoclipBtn"
NoclipBtn.Parent = MainFrame
NoclipBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
NoclipBtn.Position = UDim2.new(0.08, 0, 0.51, 0)
NoclipBtn.Size = UDim2.new(0.84, 0, 0, 30)
NoclipBtn.Font = Enum.Font.SourceSansBold
NoclipBtn.Text = "NOCLIP (СКВОЗЬ СТЕНЫ): ВЫКЛ"
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipBtn.TextSize = 11.000

UICorner_6.Parent = NoclipBtn

FlyBtn.Name = "FlyBtn"
FlyBtn.Parent = MainFrame
FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
FlyBtn.Position = UDim2.new(0.08, 0, 0.61, 0)
FlyBtn.Size = UDim2.new(0.84, 0, 0, 30)
FlyBtn.Font = Enum.Font.SourceSansBold
FlyBtn.Text = "ПОЛЕТ (FLY): ВЫКЛ"
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyBtn.TextSize = 12.000

UICorner_7.Parent = FlyBtn

-- ПОЛЕ ВВОДА НИКНЕЙМА ЖЕРТВЫ
FlingTargetBox.Name = "FlingTargetBox"
FlingTargetBox.Parent = MainFrame
FlingTargetBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
FlingTargetBox.Position = UDim2.new(0.08, 0, 0.73, 0)
FlingTargetBox.Size = UDim2.new(0.84, 0, 0, 30)
FlingTargetBox.Font = Enum.Font.SourceSans
FlingTargetBox.PlaceholderText = "Ник игрока (можно часть)"
FlingTargetBox.Text = ""
FlingTargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingTargetBox.TextSize = 15.000

UICorner_9.Parent = FlingTargetBox

-- КНОПКА АКТИВАЦИИ ФЛИНГА
FlingBtn.Name = "FlingBtn"
FlingBtn.Parent = MainFrame
FlingBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
FlingBtn.Position = UDim2.new(0.08, 0, 0.84, 0)
FlingBtn.Size = UDim2.new(0.84, 0, 0, 32)
FlingBtn.Font = Enum.Font.SourceSansBold
FlingBtn.Text = "ФЛИНГ (FLING): ВЫКЛ"
FlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingBtn.TextSize = 13.000

UICorner_8.Parent = FlingBtn

local targetSpeed = 16

local function changeSpeed(value)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    changeSpeed(targetSpeed)
end)

SetSpeedBtn.MouseButton1Click:Connect(function()
    local text = TextBox.Text
    local speedValue = tonumber(text:match("%d+"))
    
    if speedValue and speedValue >= 0 then
        targetSpeed = speedValue
        SetSpeedBtn.Text = "УСПЕШНО!"
        SetSpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        task.wait(1)
        SetSpeedBtn.Text = "ПРИМЕНИТЬ СКОРОСТЬ"
        SetSpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    else
        SetSpeedBtn.Text = "ОШИБКА ВВОДА!"
        SetSpeedBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1)
        SetSpeedBtn.Text = "ПРИМЕНИТЬ СКОРОСТЬ"
        SetSpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    end
end)

ResetSpeedBtn.MouseButton1Click:Connect(function()
    targetSpeed = 16
    TextBox.Text = ""
    ResetSpeedBtn.Text = "СБРОШЕНО"
    task.wait(1)
    ResetSpeedBtn.Text = "СБРОСИТЬ НА СТАНДАРТ"
end)

local infJumpEnabled = false
local UserInputService = game:GetService("UserInputService")

InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    if infJumpEnabled then
        InfJumpBtn.Text = "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВКЛ"
        InfJumpBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
    else
        InfJumpBtn.Text = "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВЫКЛ"
        InfJumpBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

local noclipEnabled = false

NoclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NoclipBtn.Text = "NOCLIP (СКВОЗЬ СТЕНЫ): ВКЛ"
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
    else
        NoclipBtn.Text = "NOCLIP (СКВОЗЬ СТЕНЫ): ВЫКЛ"
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
    end
end)

local flingEnabled = false

game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled or flingEnabled then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide == true then
                    part.CanCollide = false
                end
            end
        end
    end
end)

local flyEnabled = false
local bodyVelocity = nil
local bodyGyro = nil

local function startFlying()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Parent = rootPart

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.CFrame = rootPart.CFrame
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.P = 3000
    bodyGyro.Parent = rootPart

    task.spawn(function()
        local camera = workspace.CurrentCamera
        while flyEnabled do
            if not rootPart or not rootPart.Parent then break end
            
            local direction = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                direction = direction + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                direction = direction - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                direction = direction - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                direction = direction + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                direction = direction - Vector3.new(0, 1, 0)
            end

            bodyVelocity.Velocity = direction.Magnitude > 0 and direction.Unit * targetSpeed or Vector3.new(0, 0, 0)
            bodyGyro.CFrame = camera.CFrame
            task.wait()
        end
    end)
end

local function stopFlying()
    flyEnabled = false
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
end

FlyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    if flyEnabled then
        FlyBtn.Text = "ПОЛЕТ (FLY): ВКЛ"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
        startFlying()
    else
        FlyBtn.Text = "ПОЛЕТ (FLY): ВЫКЛ"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        stopFlying()
    end
end)

-- УЛУЧШЕННАЯ ЛОГИКА ТАРГЕТ-ФЛИНГА
local flingConnection = nil

-- Функция поиска игрока по части никнейма
local function GetPlayer(name)
    name = name:lower()
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and (p.Name:lower():sub(1, #name) == name or p.DisplayName:lower():sub(1, #name) == name) then
            return p
        end
    end
    return nil
end

FlingBtn.MouseButton1Click:Connect(function()
    if not flingEnabled then
        local targetPlayer = GetPlayer(FlingTargetBox.Text)
        
        if FlingTargetBox.Text == "" or not targetPlayer then
            FlingBtn.Text = "ИГРОК НЕ НАЙДЕН!"
            FlingBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            task.wait(1.5)
            FlingBtn.Text = "ФЛИНГ (FLING): ВЫКЛ"
            FlingBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
            return
        end

        flingEnabled = true
        FlingBtn.Text = "ФЛИНГ: " .. targetPlayer.Name:upper()
        FlingBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
        
        -- Цикл удержания флинга и автонаведения
        flingConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local lp = game.Players.LocalPlayer
            if not flingEnabled or not lp.Character or not targetPlayer.Character then return end
            
            local myRoot = lp.Character:FindFirstChild("HumanoidRootPart")
            local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            local myHumanoid = lp.Character:FindFirstChildOfClass("Humanoid")
            
            if myRoot and targetRoot then
                -- Включаем бешеное вращение
                myRoot.RotVelocity = Vector3.new(0, 99999, 0)
                -- Телепортируем прямо в торс жертвы с микро-сдвигом для импульса физики
                myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 0.1)
                
                -- Симулируем ходьбу, чтобы Roblox обновлял позицию физики
                if myHumanoid then
                    myHumanoid:Move(Vector3.new(0, 0, 0.1))
                end
            end
        end)
    else
        -- Выключение флинга
        flingEnabled = false
        FlingBtn.Text = "ФЛИНГ (FLING): ВЫКЛ"
        FlingBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        
        if flingConnection then
            flingConnection:Disconnect()
            flingConnection = nil
        end
        
        -- Возвращаем скорость вращения в норму
        local lp = game.Players.LocalPlayer
        if lp.Character then
            local myRoot = lp.Character:FindFirstChild("HumanoidRootPart")
            if myRoot then
                myRoot.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)

-- Автосброс при респавне
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flyEnabled then
        stopFlying()
        flyEnabled = true
        startFlying()
    end
    if flingEnabled then
        flingEnabled = false
        FlingBtn.Text = "ФЛИНГ (FLING): ВЫКЛ"
        FlingBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        if flingConnection then flingConnection:Disconnect() end
    end
end)
