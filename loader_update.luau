local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Emil768_TestScriptGui"
ScreenGui.Parent = game:GetService("CoreGui") or lp:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
MainFrame.Position = UDim2.new(0.5, -135, 0.5, -240)
MainFrame.Size = UDim2.new(0, 270, 0, 595)
MainFrame.ClipsDescendants = true
MainFrame.Visible = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(45, 45, 60)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Size = UDim2.new(1, -50, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "EMIL768 TEST SCRIPT"
Title.TextColor3 = Color3.fromRGB(0, 215, 255)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

local TabSystem = Instance.new("Frame")
TabSystem.Name = "TabSystem"
TabSystem.Parent = MainFrame
TabSystem.BackgroundTransparency = 1
TabSystem.Position = UDim2.new(0.05, 0, 0, 42)
TabSystem.Size = UDim2.new(0.9, 0, 0, 30)

local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Name = "MainTabBtn"
MainTabBtn.Parent = TabSystem
MainTabBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
MainTabBtn.Size = UDim2.new(0.35, 0, 1, 0)
MainTabBtn.Font = Enum.Font.GothamBold
MainTabBtn.Text = "MAIN"
MainTabBtn.TextColor3 = Color3.fromRGB(0, 215, 255)
MainTabBtn.TextSize = 11

local MainTabCorner = Instance.new("UICorner")
MainTabCorner.CornerRadius = UDim.new(0, 6)
MainTabCorner.Parent = MainTabBtn

local MM2TabBtn = Instance.new("TextButton")
MM2TabBtn.Name = "MM2TabBtn"
MM2TabBtn.Parent = TabSystem
MM2TabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MM2TabBtn.Position = UDim2.new(0.39, 0, 0, 0)
MM2TabBtn.Size = UDim2.new(0.35, 0, 1, 0)
MM2TabBtn.Font = Enum.Font.GothamBold
MM2TabBtn.Text = "MM2"
MM2TabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
MM2TabBtn.TextSize = 11

local MM2TabCorner = Instance.new("UICorner")
MM2TabCorner.CornerRadius = UDim.new(0, 6)
MM2TabCorner.Parent = MM2TabBtn

local BindsTabBtn = Instance.new("TextButton")
BindsTabBtn.Name = "BindsTabBtn"
BindsTabBtn.Parent = TabSystem
BindsTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
BindsTabBtn.Position = UDim2.new(0.78, 0, 0, 0)
BindsTabBtn.Size = UDim2.new(0.22, 0, 1, 0)
BindsTabBtn.Font = Enum.Font.GothamBold
BindsTabBtn.Text = "🔩"
BindsTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
BindsTabBtn.TextSize = 12

local BindsTabCorner = Instance.new("UICorner")
BindsTabCorner.CornerRadius = UDim.new(0, 6)
BindsTabCorner.Parent = BindsTabBtn

local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = MainFrame
MainContainer.BackgroundTransparency = 1
MainContainer.Position = UDim2.new(0.05, 0, 0, 80)
MainContainer.Size = UDim2.new(0.9, 0, 0, 500)
MainContainer.Visible = true

local MainLayout = Instance.new("UIListLayout")
MainLayout.Parent = MainContainer
MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainLayout.Padding = UDim.new(0, 6)

local MM2Container = Instance.new("Frame")
MM2Container.Name = "MM2Container"
MM2Container.Parent = MainFrame
MM2Container.BackgroundTransparency = 1
MM2Container.Position = UDim2.new(0.05, 0, 0, 80)
MM2Container.Size = UDim2.new(0.9, 0, 0, 500)
MM2Container.Visible = false

local MM2Layout = Instance.new("UIListLayout")
MM2Layout.Parent = MM2Container
MM2Layout.SortOrder = Enum.SortOrder.LayoutOrder
MM2Layout.Padding = UDim.new(0, 6)

local BindsContainer = Instance.new("Frame")
BindsContainer.Name = "BindsContainer"
BindsContainer.Parent = MainFrame
BindsContainer.BackgroundTransparency = 1
BindsContainer.Position = UDim2.new(0.05, 0, 0, 80)
BindsContainer.Size = UDim2.new(0.9, 0, 0, 500)
BindsContainer.Visible = false

local BindsLayout = Instance.new("UIListLayout")
BindsLayout.Parent = BindsContainer
BindsLayout.SortOrder = Enum.SortOrder.LayoutOrder
BindsLayout.Padding = UDim.new(0, 5)

local BindsTitle = Instance.new("TextLabel")
BindsTitle.Name = "BindsTitle"
BindsTitle.Parent = BindsContainer
BindsTitle.BackgroundTransparency = 1
BindsTitle.Size = UDim2.new(1, 0, 0, 22)
BindsTitle.Font = Enum.Font.GothamBold
BindsTitle.Text = "🔩 BINDS"
BindsTitle.TextColor3 = Color3.fromRGB(0, 215, 255)
BindsTitle.TextSize = 12
BindsTitle.TextXAlignment = Enum.TextXAlignment.Center

local activeTab = "Main"

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = MainFrame
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -35, 0, 5)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(150, 150, 170)
MinimizeBtn.TextSize = 14

local isMinimized = false
local normalSize = UDim2.new(0, 270, 0, 595)
local minimizedSize = UDim2.new(0, 270, 0, 40)

MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and minimizedSize or normalSize
    MinimizeBtn.Text = isMinimized and "+" or "—"
    
    if isMinimized then
        TabSystem.Visible = false
        MainContainer.Visible = false
        MM2Container.Visible = false
        BindsContainer.Visible = false
    else
        TabSystem.Visible = true
        MainContainer.Visible = (activeTab == "Main")
        MM2Container.Visible = (activeTab == "MM2")
        BindsContainer.Visible = (activeTab == "Binds")
    end
    
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)

MinimizeBtn.MouseEnter:Connect(function()
    TweenService:Create(MinimizeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 215, 255)}):Play()
end)
MinimizeBtn.MouseLeave:Connect(function()
    TweenService:Create(MinimizeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 170)}):Play()
end)

local function createTextBox(placeholder)
    local box = Instance.new("TextBox")
    box.BackgroundColor3 = Color3.fromRGB(34, 34, 44)
    box.Size = UDim2.new(1, 0, 0, 30)
    box.Font = Enum.Font.Gotham
    box.PlaceholderText = placeholder or ""
    box.PlaceholderColor3 = Color3.fromRGB(140, 140, 160)
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 11
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = box
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(50, 50, 65)
    stroke.Thickness = 1
    stroke.Parent = box
    
    box.Focused:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 215, 255)}):Play()
    end)
    box.FocusLost:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(50, 50, 65)}):Play()
    end)
    
    return box
end

local function createButton(text, isActionBtn)
    local btn = Instance.new("TextButton")
    btn.BackgroundColor3 = isActionBtn and Color3.fromRGB(0, 130, 215) or Color3.fromRGB(38, 38, 48)
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.AutoButtonColor = false
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = isActionBtn and Color3.fromRGB(0, 160, 255) or Color3.fromRGB(48, 48, 62)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = isActionBtn and Color3.fromRGB(0, 130, 215) or Color3.fromRGB(38, 38, 48)}):Play()
    end)
    
    return btn
end

local function createVisualGroup(parent, height)
    local group = Instance.new("Frame")
    group.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    group.Size = UDim2.new(1, 0, 0, height)
    group.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = group
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 160, 255)
    stroke.Thickness = 1.5
    stroke.Parent = group
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 6)
    padding.PaddingBottom = UDim.new(0, 6)
    padding.PaddingLeft = UDim.new(0, 6)
    padding.PaddingRight = UDim.new(0, 6)
    padding.Parent = group
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = group
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    
    return group
end

local function createBindSettingRow(parent, labelText)
    local row = Instance.new("Frame")
    row.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    row.Size = UDim2.new(1, 0, 0, 32)
    row.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = row

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 8, 0, 0)
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Font = Enum.Font.GothamBold
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(220, 220, 230)
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local box = createTextBox("КЛАВИША")
    box.Size = UDim2.new(0.28, 0, 0.8, 0)
    box.Position = UDim2.new(0.7, 0, 0.1, 0)
    box.TextSize = 11
    box.Parent = row

    return box
end

local function GetPlayer(name)
    name = name:lower()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and (p.Name:lower():sub(1, #name) == name or p.DisplayName:lower():sub(1, #name) == name) then
            return p
        end
    end
    return nil
end

-- СЕКЦИЯ СКОРОСТИ
local SpeedGroup = createVisualGroup(MainContainer, 110)
local SpeedBox = createTextBox("ВВЕДИТЕ СКОРОСТЬ (НАПР. 50)")
local SetSpeedBtn = createButton("ПРИМЕНИТЬ СКОРОСТЬ", true)
local ResetSpeedBtn = createButton("СБРОСИТЬ СКОРОСТЬ", false)
SpeedBox.Parent = SpeedGroup
SetSpeedBtn.Parent = SpeedGroup
ResetSpeedBtn.Parent = SpeedGroup

-- КНОПКИ ДВИЖЕНИЯ
local InfJumpBtn = createButton("БЕСКОНЕЧНЫЙ ПРЫЖОК: ВЫКЛ", false)
local NoclipBtn = createButton("СКВОЗЬ СТЕНЫ (NOCLIP): ВЫКЛ", false)
local FlyBtn = createButton("ПОЛЕТ (FLY): ВЫКЛ", false)
local ClimbBtn = createButton("ПОЛЗАТЬ ПО СТЕНАМ: ВЫКЛ", false)
InfJumpBtn.Parent = MainContainer
NoclipBtn.Parent = MainContainer
FlyBtn.Parent = MainContainer
ClimbBtn.Parent = MainContainer

-- СЕКЦИЯ ТЕЛЕПОРТА
local TpGroup = createVisualGroup(MainContainer, 75)
local TpTargetBox = createTextBox("НИКНЕЙМ ИГРОКА ДЛЯ ТП")
local TpBtn = createButton("ТЕЛЕПОРТИРОВАТЬСЯ", true)
TpTargetBox.Parent = TpGroup
TpBtn.Parent = TpGroup

-- СЕКЦИЯ ФЛИНГА
local FlingGroup = createVisualGroup(MainContainer, 75)
local FlingTargetBox = createTextBox("НИКНЕЙМ ИГРОКА ДЛЯ ФЛИНГА")
local FlingBtn = createButton("ЗАПУСТИТЬ ФЛИНГ: ВЫКЛ", false)
FlingTargetBox.Parent = FlingGroup
FlingBtn.Parent = FlingGroup

local FlingAllBtn = createButton("FLING EVERYONE (ФЛИНГ ВСЕХ)", true)
FlingAllBtn.Parent = MainContainer

local MM2EspBtn = createButton("ПОКАЗАТЬ РОЛИ (ESP): ВЫКЛ", false)
MM2EspBtn.Parent = MM2Container

local KillBindGroup = createVisualGroup(MM2Container, 44)
local KillAllBtn = createButton("KILL EVERYONE (УБИТЬ ВСЕХ)", true)
KillAllBtn.Parent = KillBindGroup

local AutoSheriffTpBtn = createButton("АВТОТЕЛЕПОРТ И СБОР ПИСТОЛЕТА: ВЫКЛ", false)
AutoSheriffTpBtn.Parent = MM2Container

local FlyBindBox = createBindSettingRow(BindsContainer, "FLY (ПОЛЕТ)")
local NoclipBindBox = createBindSettingRow(BindsContainer, "NOCLIP")
local InfJumpBindBox = createBindSettingRow(BindsContainer, "INF JUMP")
local FlingBindBox = createBindSettingRow(BindsContainer, "FLING")
local FlingAllBindBox = createBindSettingRow(BindsContainer, "FLING ALL")
local EspBindBox = createBindSettingRow(BindsContainer, "ESP MM2")
local KillAllBindBox = createBindSettingRow(BindsContainer, "KILL ALL")
local AutoSheriffBindBox = createBindSettingRow(BindsContainer, "AUTO SHERIFF")

local keyBinds = {
    Fly = nil,
    Noclip = nil,
    InfJump = nil,
    Fling = nil,
    FlingAll = nil,
    Esp = nil,
    KillAll = nil,
    AutoSheriff = nil
}

local function setupKeyBindLogic(box, keyName)
    box.FocusLost:Connect(function()
        local text = box.Text:upper():sub(1, 1)
        if text ~= "" then
            local success, keyEnum = pcall(function() return Enum.KeyCode[text] end)
            if success then
                keyBinds[keyName] = keyEnum
                box.Text = text
                box.TextColor3 = Color3.fromRGB(0, 255, 150)
            else
                keyBinds[keyName] = nil
                box.Text = ""
                box.TextColor3 = Color3.fromRGB(255, 50, 50)
            end
        else
            keyBinds[keyName] = nil
            box.Text = ""
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)
end

setupKeyBindLogic(FlyBindBox, "Fly")
setupKeyBindLogic(NoclipBindBox, "Noclip")
setupKeyBindLogic(InfJumpBindBox, "InfJump")
setupKeyBindLogic(FlingBindBox, "Fling")
setupKeyBindLogic(FlingAllBindBox, "FlingAll")
setupKeyBindLogic(EspBindBox, "Esp")
setupKeyBindLogic(KillAllBindBox, "KillAll")
setupKeyBindLogic(AutoSheriffBindBox, "AutoSheriff")

MainTabBtn.MouseButton1Click:Connect(function()
    activeTab = "Main"
    if not isMinimized then
        MainContainer.Visible = true
        MM2Container.Visible = false
        BindsContainer.Visible = false
    end
    MainTabBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
    MainTabBtn.TextColor3 = Color3.fromRGB(0, 215, 255)
    MM2TabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    MM2TabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
    BindsTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    BindsTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
end)

MM2TabBtn.MouseButton1Click:Connect(function()
    activeTab = "MM2"
    if not isMinimized then
        MainContainer.Visible = false
        MM2Container.Visible = true
        BindsContainer.Visible = false
    end
    MM2TabBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
    MM2TabBtn.TextColor3 = Color3.fromRGB(0, 215, 255)
    MainTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    MainTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
    BindsTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    BindsTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
end)

BindsTabBtn.MouseButton1Click:Connect(function()
    activeTab = "Binds"
    if not isMinimized then
        MainContainer.Visible = false
        MM2Container.Visible = false
        BindsContainer.Visible = true
    end
    BindsTabBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
    BindsTabBtn.TextColor3 = Color3.fromRGB(0, 215, 255)
    MainTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    MainTabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
    MM2TabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    MM2TabBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
end)

local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

local menuVisible = true
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.RightShift then
        menuVisible = not menuVisible
        local targetSize = menuVisible and (isMinimized and minimizedSize or normalSize) or UDim2.new(0, 270, 0, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    end
end)

TpBtn.MouseButton1Click:Connect(function()
    local target = GetPlayer(TpTargetBox.Text)
    if TpTargetBox.Text == "" or not target then
        TpBtn.Text = "ИГРОК НЕ НАЙДЕН!"
        TpBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
        task.wait(1)
        TpBtn.Text = "ТЕЛЕПОРТИРОВАТЬСЯ"
        TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        return
    end

    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        lp.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
        TpBtn.Text = "УСПЕШНО!"
        TpBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
        task.wait(1)
        TpBtn.Text = "ТЕЛЕПОРТИРОВАТЬСЯ"
        TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

local targetSpeed = 16
local infJumpEnabled = false
local noclipEnabled = false
local flyEnabled = false
local flingEnabled = false
local flingAllEnabled = false
local climbEnabled = false

local function toggleInfJump()
    infJumpEnabled = not infJumpEnabled
    InfJumpBtn.Text = infJumpEnabled and "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВКЛ" or "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВЫКЛ"
    TweenService:Create(InfJumpBtn, TweenInfo.new(0.2), {TextColor3 = infJumpEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)}):Play()
end

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and "СКВОЗЬ СТЕНЫ (NOCLIP): ВКЛ" or "СКВОЗЬ СТЕНЫ (NOCLIP): ВЫКЛ"
    TweenService:Create(NoclipBtn, TweenInfo.new(0.2), {TextColor3 = noclipEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)}):Play()
end

local bodyVelocity, bodyGyro
local function stopFlying() flyEnabled = false if bodyVelocity then bodyVelocity:Destroy() end if bodyGyro then bodyGyro:Destroy() end end
local function startFlying()
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local root = lp.Character.HumanoidRootPart
    bodyVelocity = Instance.new("BodyVelocity") bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge) bodyVelocity.Parent = root
    bodyGyro = Instance.new("BodyGyro") bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge) bodyGyro.P = 3000 bodyGyro.Parent = root
    task.spawn(function()
        local cam = workspace.CurrentCamera
        while flyEnabled and root and root.Parent do
            local dir = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0, 1, 0) end
            bodyVelocity.Velocity = dir.Magnitude > 0 and dir.Unit * targetSpeed or Vector3.new(0, 0, 0)
            bodyGyro.CFrame = cam.CFrame task.wait()
        end
    end)
end

local function toggleFly()
    flyEnabled = not flyEnabled
    FlyBtn.Text = flyEnabled and "ПОЛЕТ (FLY): ВКЛ" or "ПОЛЕТ (FLY): ВЫКЛ"
    TweenService:Create(FlyBtn, TweenInfo.new(0.2), {TextColor3 = flyEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)}):Play()
    if flyEnabled then startFlying() else stopFlying() end
end

RunService.Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
        lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = targetSpeed
    end
end)

SetSpeedBtn.MouseButton1Click:Connect(function()
    local num = tonumber(SpeedBox.Text:match("%d+"))
    if num and num >= 0 then
        targetSpeed = num
        SetSpeedBtn.Text = "УСПЕШНО ПРИМЕНЕНО"
        SetSpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
        task.wait(1)
        SetSpeedBtn.Text = "ПРИМЕНИТЬ СКОРОСТЬ"
        SetSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

ResetSpeedBtn.MouseButton1Click:Connect(function() targetSpeed = 16 SpeedBox.Text = "" end)

InfJumpBtn.MouseButton1Click:Connect(toggleInfJump)
NoclipBtn.MouseButton1Click:Connect(toggleNoclip)
FlyBtn.MouseButton1Click:Connect(toggleFly)

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
        lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

RunService.Stepped:Connect(function()
    if noclipEnabled or flingEnabled or flingAllEnabled then
        if lp.Character then
            for _, part in ipairs(lp.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end
end)

ClimbBtn.MouseButton1Click:Connect(function()
    climbEnabled = not climbEnabled
    ClimbBtn.Text = climbEnabled and "ПОЛЗАТЬ ПО СТЕНАМ: ВКЛ" or "ПОЛЗАТЬ ПО СТЕНАМ: ВЫКЛ"
    TweenService:Create(ClimbBtn, TweenInfo.new(0.2), {TextColor3 = climbEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)}):Play()
end)

RunService.Heartbeat:Connect(function()
    if not climbEnabled or not lp.Character or flyEnabled then return end
    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    local humanoid = lp.Character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {lp.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local rayDirection = root.CFrame.LookVector * 2.5
    local raycastResult = workspace:Raycast(root.Position, rayDirection, raycastParams)

    if raycastResult then
        if humanoid.MoveDirection.Magnitude > 0 then
            root.Velocity = Vector3.new(root.Velocity.X, targetSpeed * 0.8, root.Velocity.Z)
        else
            root.Velocity = Vector3.new(root.Velocity.X, 0.1, root.Velocity.Z)
        end
    end
end)

local flingConnection, savedCFrame
local function disableFlingAndReturn()
    flingEnabled = false 
    FlingBtn.Text = "ЗАПУСТИТЬ ФЛИНГ: ВЫКЛ" 
    TweenService:Create(FlingBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    
    if flingConnection then flingConnection:Disconnect() end
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then 
        lp.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
        lp.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        if savedCFrame then 
            lp.Character.HumanoidRootPart.CFrame = savedCFrame 
            savedCFrame = nil 
        end 
    end
end

local function toggleFling()
    if flingAllEnabled then return end
    if not flingEnabled then
        local target = GetPlayer(FlingTargetBox.Text)
        if FlingTargetBox.Text == "" or not target then 
            FlingBtn.Text = "ИГРОК НЕ НАЙДЕН!" 
            FlingBtn.TextColor3 = Color3.fromRGB(255, 50, 50) 
            task.wait(1) 
            FlingBtn.Text = "ЗАПУСТИТЬ ФЛИНГ: ВЫКЛ" 
            FlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255) 
            return 
        end
        
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then 
            savedCFrame = lp.Character.HumanoidRootPart.CFrame 
        end
        
        flingEnabled = true 
        FlingBtn.Text = "АТАКА: " .. target.Name:upper() 
        TweenService:Create(FlingBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 50, 50)}):Play()
        
        flingConnection = RunService.Heartbeat:Connect(function()
            if not flingEnabled or not lp.Character or not target.Character then return end
            local myRoot = lp.Character:FindFirstChild("HumanoidRootPart") 
            local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
            
            if myRoot and tRoot then 
                if tRoot.Position.Y < -20 then
                    disableFlingAndReturn()
                    return
                end

                myRoot.RotVelocity = Vector3.new(0, 999999, 0)
                myRoot.Velocity = Vector3.new(0, 0, 0)
                
                local targetVelocity = tRoot.Velocity
                local predictedPosition = tRoot.Position + (targetVelocity * 0.12)
                
                myRoot.CFrame = CFrame.new(predictedPosition) * CFrame.new(0, 0.1, 0)
            end
        end)
    else
        disableFlingAndReturn()
    end
end

FlingBtn.MouseButton1Click:Connect(toggleFling)

local function toggleFlingAll()
    if flingEnabled or flingAllEnabled then return end
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local myRoot = lp.Character.HumanoidRootPart
    local oldCFrame = myRoot.CFrame
    flingAllEnabled = true
    
    FlingAllBtn.Text = "УНИЧТОЖЕНИЕ СЕРВЕРА..."
    FlingAllBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    
    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChildOfClass("Humanoid") then
            if p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                table.insert(targets, p)
            end
        end
    end
    
    task.spawn(function()
        for _, target in ipairs(targets) do
            if not flingAllEnabled or not lp.Character or not target.Character then continue end
            local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            
            if tRoot and tHum and tHum.Health > 0 then
                local startTime = tick()
                while tick() - startTime < 0.5 and flingAllEnabled and myRoot and tRoot and tHum.Health > 0 do
                    if tRoot.Position.Y < -20 then
                        break
                    end

                    myRoot.RotVelocity = Vector3.new(0, 999999, 0)
                    myRoot.Velocity = Vector3.new(0, 0, 0)
                    
                    local predPos = tRoot.Position + (tRoot.Velocity * 0.12)
                    myRoot.CFrame = CFrame.new(predPos)
                    
                    RunService.Heartbeat:Wait()
                end
            end
        end
        
        flingAllEnabled = false
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            myRoot.RotVelocity = Vector3.new(0, 0, 0)
            myRoot.Velocity = Vector3.new(0, 0, 0)
            myRoot.CFrame = oldCFrame
        end
        FlingAllBtn.Text = "FLING EVERYONE (ФЛИНГ ВСЕХ)"
        FlingAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

FlingAllBtn.MouseButton1Click:Connect(toggleFlingAll)

local mm2EspEnabled = false
local autoSheriffTpEnabled = false
local currentSheriff = nil

local function removeTagFromChar(char)
    if not char then return end
    local head = char:FindFirstChild("Head")
    if head and head:FindFirstChild("MM2_Tag") then
        head.MM2_Tag:Destroy()
    end
    if char:FindFirstChild("MM2_Highlight") then
        char.MM2_Highlight:Destroy()
    end
end

local function updateEspForPlayer(player, roleName, color)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local head = char:FindFirstChild("Head")
    if not head then return end

    local bGui = head:FindFirstChild("MM2_Tag")
    if not bGui then
        bGui = Instance.new("BillboardGui")
        bGui.Name = "MM2_Tag"
        bGui.Size = UDim2.new(0, 180, 0, 35)
        bGui.AlwaysOnTop = true
        bGui.ExtentsOffset = Vector3.new(0, 3, 0)
        bGui.Parent = head

        local label = Instance.new("TextLabel")
        label.Name = "RoleLabel"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 13
        label.TextStrokeTransparency = 0.5
        label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        label.Parent = bGui
    end

    local label = bGui:FindFirstChild("RoleLabel")
    if label then
        label.Text = player.DisplayName .. " [" .. roleName .. "]"
        label.TextColor3 = color
    end

    local highlight = char:FindFirstChild("MM2_Highlight")
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = "MM2_Highlight"
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = char
    end
    highlight.FillColor = color
    highlight.OutlineColor = color
end

local function removeAllTags()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then
            removeTagFromChar(p.Character)
        end
    end
end

Players.PlayerRemoving:Connect(function(p)
    if p.Character then removeTagFromChar(p.Character) end
end)

local function canCollectSheriffGun()
    local hasKnife = lp.Backpack:FindFirstChild("Knife") or (lp.Character and lp.Character:FindFirstChild("Knife"))
    if hasKnife then return false end
    
    local mainRoundManager = ReplicatedStorage:FindFirstChild("MainRound")
    if mainRoundManager and mainRoundManager:FindFirstChild("RoundStatus") then
        if mainRoundManager.RoundStatus.Value ~= "InGame" then
            return false
        end
    end
    return true
end

task.spawn(function()
    while true do
        task.wait(0.2)
        
        local foundSheriff = nil
        
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= lp and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                local role = "Innocent"
                local color = Color3.fromRGB(0, 255, 100)
                
                local knife = p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife")
                local gun = p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun")
                
                if knife then 
                    role = "Murder" 
                    color = Color3.fromRGB(255, 30, 30)
                elseif gun then 
                    role = "Sheriff" 
                    color = Color3.fromRGB(30, 140, 255)
                    foundSheriff = p
                end
                
                if mm2EspEnabled then
                    updateEspForPlayer(p, role, color)
                else
                    removeTagFromChar(p.Character)
                end
            elseif p.Character then
                removeTagFromChar(p.Character)
            end
        end
        
        currentSheriff = foundSheriff
        
        if autoSheriffTpEnabled and currentSheriff and currentSheriff.Character then
            local hum = currentSheriff.Character:FindFirstChildOfClass("Humanoid")
            local root = currentSheriff.Character:FindFirstChild("HumanoidRootPart")
            
            if hum and hum.Health <= 0 and root and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                if canCollectSheriffGun() then
                    autoSheriffTpEnabled = false
                    AutoSheriffTpBtn.Text = "АВТОТЕЛЕПОРТ И СБОР ПИСТОЛЕТА: ВЫКЛ"
                    TweenService:Create(AutoSheriffTpBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    
                    local myRoot = lp.Character.HumanoidRootPart
                    local originalCFrame = myRoot.CFrame
                    myRoot.CFrame = root.CFrame
                    
                    task.spawn(function()
                        local startTime = tick()
                        while tick() - startTime < 3 do
                            local hasGun = lp.Backpack:FindFirstChild("Gun") or lp.Character:FindFirstChild("Gun")
                            if hasGun then break end
                            task.wait(0.05)
                        end
                        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                            lp.Character.HumanoidRootPart.CFrame = originalCFrame
                        end
                    end)
                end
            end
        end
    end
end)

local function killEveryone()
    local knife = lp.Backpack:FindFirstChild("Knife") or (lp.Character and lp.Character:FindFirstChild("Knife"))
    if not knife then
        KillAllBtn.Text = "НУЖЕН НОЖ (MURDER)!"
        KillAllBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
        task.wait(0.8)
        KillAllBtn.Text = "KILL EVERYONE (УБИТЬ ВСЕХ)"
        KillAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        return
    end

    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local myCharacter = lp.Character
    local myRoot = myCharacter.HumanoidRootPart
    local oldCFrame = myRoot.CFrame
    
    if knife.Parent == lp.Backpack then myCharacter:FindFirstChildOfClass("Humanoid"):EquipTool(knife) end
    
    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChildOfClass("Humanoid") then
            if p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then table.insert(targets, p) end
        end
    end
    
    for _, target in ipairs(targets) do
        local tChar = target.Character
        local tRoot = tChar:FindFirstChild("HumanoidRootPart")
        local tHum = tChar:FindFirstChildOfClass("Humanoid")
        
        if tRoot and tHum and tHum.Health > 0 then
            local startTime = tick()
            while tHum.Health > 0 and tick() - startTime < 1.0 and myRoot and tRoot do
                myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, -0.5)
                myRoot.Velocity = Vector3.new(0, 0, 0)
                if knife and knife.Parent == myCharacter then knife:Activate() end
                if knife:FindFirstChild("Stab") then knife.Stab:FireServer() end
                RunService.Heartbeat:Wait()
            end
        end
    end
    if myRoot then myRoot.CFrame = oldCFrame myRoot.Velocity = Vector3.new(0, 0, 0) end
end

KillAllBtn.MouseButton1Click:Connect(function()
    local knifeCheck = lp.Backpack:FindFirstChild("Knife") or (lp.Character and lp.Character:FindFirstChild("Knife"))
    if knifeCheck then KillAllBtn.Text = "УНИЧТОЖЕНИЕ СЕРВЕРА..." KillAllBtn.TextColor3 = Color3.fromRGB(255, 50, 50) end
    killEveryone()
    task.wait(0.2)
    KillAllBtn.Text = "KILL EVERYONE (УБИТЬ ВСЕХ)"
    KillAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

local function toggleEsp()
    mm2EspEnabled = not mm2EspEnabled
    MM2EspBtn.Text = mm2EspEnabled and "ПОКАЗАТЬ РОЛИ (ESP): ВКЛ" or "ПОКАЗАТЬ РОЛИ (ESP): ВЫКЛ"
    TweenService:Create(MM2EspBtn, TweenInfo.new(0.2), {TextColor3 = mm2EspEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)}):Play()
    if not mm2EspEnabled then removeAllTags() end
end

local function toggleAutoSheriff()
    autoSheriffTpEnabled = not autoSheriffTpEnabled
    AutoSheriffTpBtn.Text = autoSheriffTpEnabled and "АВТОТЕЛЕПОРТ И СБОР ПИСТОЛЕТА: ВКЛ" or "АВТОТЕЛЕПОРТ И СБОР ПИСТОЛЕТА: ВЫКЛ"
    TweenService:Create(AutoSheriffTpBtn, TweenInfo.new(0.2), {TextColor3 = autoSheriffTpEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)}):Play()
end

MM2EspBtn.MouseButton1Click:Connect(toggleEsp)
AutoSheriffTpBtn.MouseButton1Click:Connect(toggleAutoSheriff)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    local k = input.KeyCode
    if k == keyBinds.Fly then toggleFly() end
    if k == keyBinds.Noclip then toggleNoclip() end
    if k == keyBinds.InfJump then toggleInfJump() end
    if k == keyBinds.Fling then toggleFling() end
    if k == keyBinds.FlingAll then toggleFlingAll() end
    if k == keyBinds.Esp then toggleEsp() end
    if k == keyBinds.KillAll then killEveryone() end
    if k == keyBinds.AutoSheriff then toggleAutoSheriff() end
end)

lp.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flyEnabled then stopFlying() flyEnabled = true startFlying() end
    if flingEnabled then flingEnabled = false FlingBtn.Text = "ЗАПУСТИТЬ ФЛИНГ: ВЫКЛ" FlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255) if flingConnection then flingConnection:Disconnect() end end
    flingAllEnabled = false
    climbEnabled = false
end)
