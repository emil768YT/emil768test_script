local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = Players.LocalPlayer

-- Система локализации (Языки)
local currentLang = "RU"

local translations = {
    RU = {
        MainTab = "MAIN",
        MM2Tab = "MM2",
        BindsTabTitle = "🔩 НАСТРОЙКИ И БИНДЫ",
        ThemeTitle = "🎨 ТЕМА ИНТЕРФЕЙСА",
        LangBtn = "🌐 ЯЗЫК: РУССКИЙ",
        SpeedBox = "ВВЕДИТЕ СКОРОСТЬ (НАПР. 50)",
        SetSpeed = "ПРИМЕНИТЬ СКОРОСТЬ",
        SpeedApplied = "УСПЕШНО ПРИМЕНЕНО",
        ResetSpeed = "СБРОСИТЬ СКОРОСТЬ",
        InfJumpOn = "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВКЛ",
        InfJumpOff = "БЕСКОНЕЧНЫЙ ПРЫЖОК: ВЫКЛ",
        NoclipOn = "СКВОЗЬ СТЕНЫ (NOCLIP): ВКЛ",
        NoclipOff = "СКВОЗЬ СТЕНЫ (NOCLIP): ВЫКЛ",
        FlyOn = "ПОЛЕТ (FLY): ВКЛ",
        FlyOff = "ПОЛЕТ (FLY): ВЫКЛ",
        ClimbOn = "ПОЛЗАТЬ ПО СТЕНАМ: ВКЛ",
        ClimbOff = "ПОЛЗАТЬ ПО СТЕНАМ: ВЫКЛ",
        TpBox = "НИКНЕЙМ ИГРОКА ДЛЯ ТП",
        TpBtn = "ТЕЛЕПОРТИРОВАТЬСЯ",
        TpSuccess = "УСПЕШНО!",
        PlayerNotFound = "ИГРОК НЕ НАЙДЕН!",
        FlingBox = "НИКНЕЙМ ИГРОКА ДЛЯ ФЛИНГА",
        FlingBtnOff = "ЗАПУСТИТЬ ФЛИНГ: ВЫКЛ",
        FlingBtnAttack = "АТАКА: ",
        FlingAllBtn = "FLING EVERYONE (ФЛИНГ ВСЕХ)",
        FlingAllActive = "УНИЧТОЖЕНИЕ СЕРВЕРА...",
        EspOn = "ПОКАЗАТЬ РОЛИ (ESP): ВКЛ",
        EspOff = "ПОКАЗАТЬ РОЛИ (ESP): ВЫКЛ",
        KillAllBtn = "KILL EVERYONE (УБИТЬ ВСЕХ)",
        KillAllNeedKnife = "НУЖЕН НОЖ (MURDER)!",
        AutoSheriffOn = "АВТОТЕЛЕПОРТ И СБОР ПИСТОЛЕТА: ВКЛ",
        AutoSheriffOff = "АВТОТЕЛЕПОРТ И СБОР ПИСТОЛЕТА: ВЫКЛ",
        AutoFarmCoinsOn = "АВТОФАРМ МОНЕТ: ВКЛ",
        AutoFarmCoinsOff = "АВТОФАРМ МОНЕТ: ВЫКЛ",
        KeyBox = "КЛАВИША",
        BindFly = "FLY (ПОЛЕТ)",
        BindNoclip = "NOCLIP",
        BindInfJump = "INF JUMP",
        BindFling = "FLING",
        BindFlingAll = "FLING ALL",
        BindEsp = "ESP MM2",
        BindKillAll = "KILL ALL",
        BindAutoSheriff = "AUTO SHERIFF",
        BindAutoFarmCoins = "AUTO FARM COINS",
        Contacts = "TELEGRAM - @EMILL768\nDISCORD - EMIL768",
        RoleMurder = "Murder",
        RoleSheriff = "Sheriff",
        RoleInnocent = "Innocent"
    },
    EN = {
        MainTab = "MAIN",
        MM2Tab = "MM2",
        BindsTabTitle = "🔩 SETTINGS & BINDS",
        ThemeTitle = "🎨 UI THEME COLOR",
        LangBtn = "🌐 LANGUAGE: ENGLISH",
        SpeedBox = "ENTER SPEED (E.G. 50)",
        SetSpeed = "APPLY SPEED",
        SpeedApplied = "SUCCESSFULLY APPLIED",
        ResetSpeed = "RESET SPEED",
        InfJumpOn = "INFINITE JUMP: ON",
        InfJumpOff = "INFINITE JUMP: OFF",
        NoclipOn = "NOCLIP: ON",
        NoclipOff = "NOCLIP: OFF",
        FlyOn = "FLY: ON",
        FlyOff = "FLY: OFF",
        ClimbOn = "WALL CLIMB: ON",
        ClimbOff = "WALL CLIMB: OFF",
        TpBox = "PLAYER NAME FOR TP",
        TpBtn = "TELEPORT",
        TpSuccess = "SUCCESS!",
        PlayerNotFound = "PLAYER NOT FOUND!",
        FlingBox = "PLAYER NAME FOR FLING",
        FlingBtnOff = "START FLING: OFF",
        FlingBtnAttack = "ATTACKING: ",
        FlingAllBtn = "FLING EVERYONE",
        FlingAllActive = "DESTROYING SERVER...",
        EspOn = "SHOW ROLES (ESP): ON",
        EspOff = "SHOW ROLES (ESP): OFF",
        KillAllBtn = "KILL EVERYONE",
        KillAllNeedKnife = "NEED KNIFE (MURDER)!",
        AutoSheriffOn = "AUTO TP & PICKUP GUN: ON",
        AutoSheriffOff = "AUTO TP & PICKUP GUN: OFF",
        AutoFarmCoinsOn = "AUTO FARM COINS: ON",
        AutoFarmCoinsOff = "AUTO FARM COINS: OFF",
        KeyBox = "KEY",
        BindFly = "FLY",
        BindNoclip = "NOCLIP",
        BindInfJump = "INF JUMP",
        BindFling = "FLING",
        BindFlingAll = "FLING ALL",
        BindEsp = "ESP MM2",
        BindKillAll = "KILL ALL",
        BindAutoSheriff = "AUTO SHERIFF",
        BindAutoFarmCoins = "AUTO FARM COINS",
        Contacts = "TELEGRAM - @EMILL768\nDISCORD - EMIL768",
        RoleMurder = "Murder",
        RoleSheriff = "Sheriff",
        RoleInnocent = "Innocent"
    }
}

local function t(key)
    return translations[currentLang][key] or key
end

-- ==================== СИСТЕМА ТЕМ ====================
local currentTheme = {
    main = Color3.fromRGB(0, 215, 255),
    dark = Color3.fromRGB(0, 150, 255)
}

local themeObjects = {
    gradients = {},
    toggles = {}
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Emil768_ScriptGui"
ScreenGui.Parent = game:GetService("CoreGui") or lp:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- ==================== ОСНОВНОЙ ИНТЕРФЕЙС ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -250)
MainFrame.Size = UDim2.new(0, 280, 0, 600)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.Color = currentTheme.main
MainFrameStroke.Thickness = 1.5
MainFrameStroke.Transparency = 0.3
MainFrameStroke.Parent = MainFrame

local FrameGradient = Instance.new("UIGradient")
FrameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
}
FrameGradient.Rotation = 45
FrameGradient.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 16, 0, 0)
Title.Size = UDim2.new(1, -60, 0, 45)
Title.Font = Enum.Font.GothamBlack
Title.Text = "EMIL768 SCRIPT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, currentTheme.main),
    ColorSequenceKeypoint.new(1, currentTheme.dark)
}
TitleGradient.Parent = Title

local TabSystem = Instance.new("Frame")
TabSystem.Name = "TabSystem"
TabSystem.Parent = MainFrame
TabSystem.BackgroundTransparency = 1
TabSystem.Position = UDim2.new(0.04, 0, 0, 45)
TabSystem.Size = UDim2.new(0.92, 0, 0, 34)

local function CreateTabButton(name, text, pos, size, active)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = TabSystem
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.BackgroundTransparency = active and 0.2 or 0.7
    btn.Position = pos
    btn.Size = size
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = active and currentTheme.main or Color3.fromRGB(150, 150, 160)
    btn.TextSize = 11
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = active and currentTheme.main or Color3.fromRGB(50, 50, 60)
    stroke.Thickness = 1
    stroke.Parent = btn

    return btn, stroke
end

local MainTabBtn, MainTabStroke = CreateTabButton("MainTabBtn", "MAIN", UDim2.new(0, 0, 0, 0), UDim2.new(0.35, -2, 1, 0), true)
local MM2TabBtn, MM2TabStroke = CreateTabButton("MM2TabBtn", "MM2", UDim2.new(0.35, 2, 0, 0), UDim2.new(0.35, -4, 1, 0), false)
local BindsTabBtn, BindsTabStroke = CreateTabButton("BindsTabBtn", "⚙️", UDim2.new(0.70, 2, 0, 0), UDim2.new(0.30, -2, 1, 0), false)

local MainContainer = Instance.new("ScrollingFrame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = MainFrame
MainContainer.BackgroundTransparency = 1
MainContainer.Position = UDim2.new(0.04, 0, 0, 90)
MainContainer.Size = UDim2.new(0.92, 0, 1, -100)
MainContainer.ScrollBarThickness = 2
MainContainer.VerticalScrollBarInset = Enum.ScrollBarInset.None
MainContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
MainContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
MainContainer.Visible = true

local MainLayout = Instance.new("UIListLayout")
MainLayout.Parent = MainContainer
MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainLayout.Padding = UDim.new(0, 8)

local MM2Container = Instance.new("ScrollingFrame")
MM2Container.Name = "MM2Container"
MM2Container.Parent = MainFrame
MM2Container.BackgroundTransparency = 1
MM2Container.Position = UDim2.new(0.04, 0, 0, 90)
MM2Container.Size = UDim2.new(0.92, 0, 1, -100)
MM2Container.ScrollBarThickness = 2
MM2Container.VerticalScrollBarInset = Enum.ScrollBarInset.None
MM2Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
MM2Container.CanvasSize = UDim2.new(0, 0, 0, 0)
MM2Container.Visible = false

local MM2Layout = Instance.new("UIListLayout")
MM2Layout.Parent = MM2Container
MM2Layout.SortOrder = Enum.SortOrder.LayoutOrder
MM2Layout.Padding = UDim.new(0, 8)

local BindsContainer = Instance.new("ScrollingFrame")
BindsContainer.Name = "BindsContainer"
BindsContainer.Parent = MainFrame
BindsContainer.BackgroundTransparency = 1
BindsContainer.Position = UDim2.new(0.04, 0, 0, 90)
BindsContainer.Size = UDim2.new(0.92, 0, 1, -100)
BindsContainer.ScrollBarThickness = 2
BindsContainer.VerticalScrollBarInset = Enum.ScrollBarInset.None
BindsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
BindsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
BindsContainer.Visible = false

local BindsLayout = Instance.new("UIListLayout")
BindsLayout.Parent = BindsContainer
BindsLayout.SortOrder = Enum.SortOrder.LayoutOrder
BindsLayout.Padding = UDim.new(0, 8)

local BindsTitle = Instance.new("TextLabel")
BindsTitle.Name = "BindsTitle"
BindsTitle.Parent = BindsContainer
BindsTitle.BackgroundTransparency = 1
BindsTitle.Size = UDim2.new(1, 0, 0, 25)
BindsTitle.Font = Enum.Font.GothamBold
BindsTitle.Text = t("BindsTabTitle")
BindsTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
BindsTitle.TextSize = 13
BindsTitle.TextXAlignment = Enum.TextXAlignment.Center

-- ==================== WELCOME MENU ====================
local GlassOverlay = Instance.new("Frame")
GlassOverlay.Name = "GlassOverlay"
GlassOverlay.Parent = ScreenGui
GlassOverlay.BackgroundTransparency = 1
GlassOverlay.Position = UDim2.new(0, 0, 0, 0)
GlassOverlay.Size = UDim2.new(1, 0, 1, 0)

local GlassCard = Instance.new("Frame")
GlassCard.Name = "GlassCard"
GlassCard.Parent = GlassOverlay
GlassCard.AnchorPoint = Vector2.new(0.5, 0.5)
GlassCard.Position = UDim2.new(0.5, 0, 0.5, 0)
GlassCard.Size = UDim2.new(0, 0, 0, 0)
GlassCard.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
GlassCard.BackgroundTransparency = 1

local GlassCorner = Instance.new("UICorner")
GlassCorner.CornerRadius = UDim.new(0, 20)
GlassCorner.Parent = GlassCard

local GlassStroke = Instance.new("UIStroke")
GlassStroke.Color = currentTheme.main
GlassStroke.Thickness = 2
GlassStroke.Transparency = 1
GlassStroke.Parent = GlassCard

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = GlassCard
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Position = UDim2.new(0, 10, 0, 20)
WelcomeTitle.Size = UDim2.new(1, -20, 0, 45)
WelcomeTitle.Font = Enum.Font.GothamBlack
WelcomeTitle.Text = "Hello,\n" .. lp.DisplayName .. "!"
WelcomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeTitle.TextTransparency = 1
WelcomeTitle.TextSize = 18
WelcomeTitle.TextWrapped = true

local WelcomeSub = Instance.new("TextLabel")
WelcomeSub.Parent = GlassCard
WelcomeSub.BackgroundTransparency = 1
WelcomeSub.Position = UDim2.new(0, 10, 0, 75)
WelcomeSub.Size = UDim2.new(1, -20, 0, 35)
WelcomeSub.Font = Enum.Font.GothamMedium
WelcomeSub.Text = "Выбери язык / Choose language"
WelcomeSub.TextColor3 = currentTheme.main
WelcomeSub.TextTransparency = 1
WelcomeSub.TextSize = 12
WelcomeSub.TextWrapped = true

local BtnContainer = Instance.new("Frame")
BtnContainer.Parent = GlassCard
BtnContainer.BackgroundTransparency = 1
BtnContainer.Position = UDim2.new(0, 20, 0, 125)
BtnContainer.Size = UDim2.new(1, -40, 0, 100)

local RuBtn = Instance.new("TextButton")
RuBtn.Parent = BtnContainer
RuBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
RuBtn.BackgroundTransparency = 1
RuBtn.Position = UDim2.new(0, 0, 0, 0)
RuBtn.Size = UDim2.new(1, 0, 0, 42)
RuBtn.Font = Enum.Font.GothamBold
RuBtn.Text = "🇷🇺 РУССКИЙ"
RuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RuBtn.TextTransparency = 1
RuBtn.TextSize = 13
local RuCorner = Instance.new("UICorner") RuCorner.CornerRadius = UDim.new(0, 10) RuCorner.Parent = RuBtn
local RuStroke = Instance.new("UIStroke") RuStroke.Color = currentTheme.main RuStroke.Thickness = 1 RuStroke.Transparency = 1 RuStroke.Parent = RuBtn

local EnBtn = Instance.new("TextButton")
EnBtn.Parent = BtnContainer
EnBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
EnBtn.BackgroundTransparency = 1
EnBtn.Position = UDim2.new(0, 0, 0, 52)
EnBtn.Size = UDim2.new(1, 0, 0, 42)
EnBtn.Font = Enum.Font.GothamBold
EnBtn.Text = "🇬🇧 ENGLISH"
EnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnBtn.TextTransparency = 1
EnBtn.TextSize = 13
local EnCorner = Instance.new("UICorner") EnCorner.CornerRadius = UDim.new(0, 10) EnCorner.Parent = EnBtn
local EnStroke = Instance.new("UIStroke") EnStroke.Color = currentTheme.main EnStroke.Thickness = 1 EnStroke.Transparency = 1 EnStroke.Parent = EnBtn

local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
TweenService:Create(GlassCard, tweenInfo, {Size = UDim2.new(0, 280, 0, 270), BackgroundTransparency = 0.2}):Play()
TweenService:Create(GlassStroke, tweenInfo, {Transparency = 0}):Play()
TweenService:Create(WelcomeTitle, tweenInfo, {TextTransparency = 0}):Play()
TweenService:Create(WelcomeSub, tweenInfo, {TextTransparency = 0}):Play()
TweenService:Create(RuBtn, tweenInfo, {BackgroundTransparency = 0.4, TextTransparency = 0}):Play()
TweenService:Create(RuStroke, tweenInfo, {Transparency = 0.2}):Play()
TweenService:Create(EnBtn, tweenInfo, {BackgroundTransparency = 0.4, TextTransparency = 0}):Play()
TweenService:Create(EnStroke, tweenInfo, {Transparency = 0.2}):Play()

local function addGlassHover(btn, stroke)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.3), {Thickness = 2, Color = currentTheme.dark}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0.4}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.3), {Thickness = 1, Color = currentTheme.main}):Play()
    end)
end
addGlassHover(RuBtn, RuStroke)
addGlassHover(EnBtn, EnStroke)

local activeTab = "Main"

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = MainFrame
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -40, 0, 5)
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(150, 150, 170)
MinimizeBtn.TextSize = 16

local isMinimized = false
local normalSize = UDim2.new(0, 280, 0, 600)
local minimizedSize = UDim2.new(0, 280, 0, 45)

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
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)

MinimizeBtn.MouseEnter:Connect(function() TweenService:Create(MinimizeBtn, TweenInfo.new(0.2), {TextColor3 = currentTheme.main}):Play() end)
MinimizeBtn.MouseLeave:Connect(function() TweenService:Create(MinimizeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 170)}):Play() end)

local function createTextBox(placeholder)
    local box = Instance.new("TextBox")
    box.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    box.BackgroundTransparency = 0.3
    box.Size = UDim2.new(1, 0, 0, 36)
    box.Font = Enum.Font.GothamMedium
    box.PlaceholderText = placeholder or ""
    box.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 12
    
    local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 8) corner.Parent = box
    local stroke = Instance.new("UIStroke") stroke.Color = Color3.fromRGB(60, 60, 80) stroke.Thickness = 1 stroke.Parent = box
    
    box.Focused:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.3), {Color = currentTheme.main, Thickness = 1.5}):Play()
        TweenService:Create(box, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play()
    end)
    box.FocusLost:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(60, 60, 80), Thickness = 1}):Play()
        TweenService:Create(box, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
    end)
    return box
end

local function createButton(text, isActionBtn)
    local btn = Instance.new("TextButton")
    btn.BackgroundColor3 = isActionBtn and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(30, 30, 45)
    btn.BackgroundTransparency = isActionBtn and 0 or 0.3
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = isActionBtn and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(220, 220, 220)
    btn.TextSize = 12
    btn.AutoButtonColor = false
    
    local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 8) corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.Color = isActionBtn and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(50, 50, 70)
    stroke.Thickness = 1
    stroke.Transparency = isActionBtn and 1 or 0
    stroke.Parent = btn

    if isActionBtn then
        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, currentTheme.main),
            ColorSequenceKeypoint.new(1, currentTheme.dark)
        }
        gradient.Parent = btn
        table.insert(themeObjects.gradients, gradient)
    end
    
    btn.MouseEnter:Connect(function()
        if isActionBtn then
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0.2}):Play()
        else
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(40, 40, 60), BackgroundTransparency = 0.1}):Play()
            TweenService:Create(stroke, TweenInfo.new(0.3), {Color = currentTheme.main}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if isActionBtn then
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        else
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(30, 30, 45), BackgroundTransparency = 0.3}):Play()
            TweenService:Create(stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(50, 50, 70)}):Play()
        end
    end)
    return btn
end

local function createVisualGroup(parent, height)
    local group = Instance.new("Frame")
    group.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    group.BackgroundTransparency = 0.4
    group.Size = UDim2.new(1, 0, 0, height)
    group.Parent = parent
    local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 10) corner.Parent = group
    local stroke = Instance.new("UIStroke") stroke.Color = Color3.fromRGB(60, 60, 80) stroke.Thickness = 1 stroke.Parent = group
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 8) padding.PaddingBottom = UDim.new(0, 8)
    padding.PaddingLeft = UDim.new(0, 8) padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = group
    local layout = Instance.new("UIListLayout") layout.Parent = group layout.SortOrder = Enum.SortOrder.LayoutOrder layout.Padding = UDim.new(0, 6)
    return group
end

local bindLabels = {}

local function createBindSettingRow(parent, labelKey)
    local row = Instance.new("Frame")
    row.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    row.BackgroundTransparency = 0.3
    row.Size = UDim2.new(1, 0, 0, 36)
    row.Parent = parent

    local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 8) corner.Parent = row
    local stroke = Instance.new("UIStroke") stroke.Color = Color3.fromRGB(50, 50, 65) stroke.Parent = row

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 12, 0, 0)
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Font = Enum.Font.GothamBold
    label.Text = t(labelKey)
    label.TextColor3 = Color3.fromRGB(230, 230, 240)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row
    bindLabels[labelKey] = label

    local box = createTextBox(t("KeyBox"))
    box.Size = UDim2.new(0.25, 0, 0.75, 0)
    box.Position = UDim2.new(0.72, 0, 0.125, 0)
    box.TextSize = 12
    box.Parent = row
    return box
end

local function GetPlayer(name)
    if not name or name == "" then return nil end
    name = name:lower()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp then
            if p.Name:lower():find(name, 1, true) or p.DisplayName:lower():find(name, 1, true) then
                return p
            end
        end
    end
    return nil
end

-- ==================== ПАЛИТРА ТЕМ В НАСТРОЙКАХ ====================
local ThemeGroup = createVisualGroup(BindsContainer, 70)
local ThemeLabel = Instance.new("TextLabel")
ThemeLabel.Parent = ThemeGroup
ThemeLabel.BackgroundTransparency = 1
ThemeLabel.Size = UDim2.new(1, 0, 0, 15)
ThemeLabel.Font = Enum.Font.GothamBold
ThemeLabel.Text = t("ThemeTitle")
ThemeLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
ThemeLabel.TextSize = 11

local PaletteFrame = Instance.new("Frame")
PaletteFrame.Parent = ThemeGroup
PaletteFrame.BackgroundTransparency = 1
PaletteFrame.Size = UDim2.new(1, 0, 0, 30)

local PaletteLayout = Instance.new("UIListLayout")
PaletteLayout.Parent = PaletteFrame
PaletteLayout.FillDirection = Enum.FillDirection.Horizontal
PaletteLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PaletteLayout.Padding = UDim.new(0, 10)

local function UpdateThemeSystem()
    TweenService:Create(MainFrameStroke, TweenInfo.new(0.4), {Color = currentTheme.main}):Play()
    TitleGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, currentTheme.main), ColorSequenceKeypoint.new(1, currentTheme.dark)
    }
    for _, grad in ipairs(themeObjects.gradients) do
        grad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, currentTheme.main), ColorSequenceKeypoint.new(1, currentTheme.dark)
        }
    end
    if activeTab == "Main" then 
        TweenService:Create(MainTabBtn, TweenInfo.new(0.3), {TextColor3 = currentTheme.main}):Play()
        TweenService:Create(MainTabStroke, TweenInfo.new(0.3), {Color = currentTheme.main}):Play()
    elseif activeTab == "MM2" then
        TweenService:Create(MM2TabBtn, TweenInfo.new(0.3), {TextColor3 = currentTheme.main}):Play()
        TweenService:Create(MM2TabStroke, TweenInfo.new(0.3), {Color = currentTheme.main}):Play()
    elseif activeTab == "Binds" then
        TweenService:Create(BindsTabBtn, TweenInfo.new(0.3), {TextColor3 = currentTheme.main}):Play()
        TweenService:Create(BindsTabStroke, TweenInfo.new(0.3), {Color = currentTheme.main}):Play()
    end
    for _, t in ipairs(themeObjects.toggles) do
        if t.getState() then
            TweenService:Create(t.btn, TweenInfo.new(0.3), {TextColor3 = currentTheme.main}):Play()
        end
    end
end

local function createColorBtn(cMain, cDark)
    local btn = Instance.new("TextButton")
    btn.Parent = PaletteFrame
    btn.Size = UDim2.new(0, 24, 0, 24)
    btn.BackgroundColor3 = cMain
    btn.Text = ""
    local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(1, 0) corner.Parent = btn
    local stroke = Instance.new("UIStroke") stroke.Color = Color3.fromRGB(255, 255, 255) stroke.Transparency = 0.8 stroke.Thickness = 1 stroke.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        currentTheme.main = cMain
        currentTheme.dark = cDark
        UpdateThemeSystem()
    end)
    btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 28, 0, 28)}):Play() end)
    btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 24, 0, 24)}):Play() end)
end

-- Пресеты цветов
createColorBtn(Color3.fromRGB(0, 215, 255), Color3.fromRGB(0, 150, 255))   -- Cyan
createColorBtn(Color3.fromRGB(255, 50, 50), Color3.fromRGB(200, 0, 0))     -- Red
createColorBtn(Color3.fromRGB(170, 85, 255), Color3.fromRGB(120, 50, 200)) -- Purple
createColorBtn(Color3.fromRGB(0, 255, 127), Color3.fromRGB(0, 180, 90))    -- Green
createColorBtn(Color3.fromRGB(255, 105, 180), Color3.fromRGB(255, 20, 147))-- Pink
createColorBtn(Color3.fromRGB(255, 215, 0), Color3.fromRGB(200, 150, 0))   -- Yellow

-- ==================== СОЗДАНИЕ КНОПОК И UI ====================
local LangToggleBtn = createButton(t("LangBtn"), true) LangToggleBtn.Parent = BindsContainer

local SpeedGroup = createVisualGroup(MainContainer, 128)
local SpeedBox = createTextBox(t("SpeedBox")) SpeedBox.Parent = SpeedGroup
local SetSpeedBtn = createButton(t("SetSpeed"), true) SetSpeedBtn.Parent = SpeedGroup
local ResetSpeedBtn = createButton(t("ResetSpeed"), false) ResetSpeedBtn.Parent = SpeedGroup

local InfJumpBtn = createButton(t("InfJumpOff"), false) InfJumpBtn.Parent = MainContainer
local NoclipBtn = createButton(t("NoclipOff"), false) NoclipBtn.Parent = MainContainer
local FlyBtn = createButton(t("FlyOff"), false) FlyBtn.Parent = MainContainer
local ClimbBtn = createButton(t("ClimbOff"), false) ClimbBtn.Parent = MainContainer

local TpGroup = createVisualGroup(MainContainer, 86)
local TpTargetBox = createTextBox(t("TpBox")) TpTargetBox.Parent = TpGroup
local TpBtn = createButton(t("TpBtn"), true) TpBtn.Parent = TpGroup

local FlingGroup = createVisualGroup(MainContainer, 86)
local FlingTargetBox = createTextBox(t("FlingBox")) FlingTargetBox.Parent = FlingGroup
local FlingBtn = createButton(t("FlingBtnOff"), false) FlingBtn.Parent = FlingGroup
local FlingAllBtn = createButton(t("FlingAllBtn"), true) FlingAllBtn.Parent = MainContainer

local MM2EspBtn = createButton(t("EspOff"), false) MM2EspBtn.Parent = MM2Container
local KillBindGroup = createVisualGroup(MM2Container, 52)
local KillAllBtn = createButton(t("KillAllBtn"), true) KillAllBtn.Parent = KillBindGroup
local AutoSheriffTpBtn = createButton(t("AutoSheriffOff"), false) AutoSheriffTpBtn.Parent = MM2Container
local AutoFarmCoinsBtn = createButton(t("AutoFarmCoinsOff"), false) AutoFarmCoinsBtn.Parent = MM2Container

local FlyBindBox = createBindSettingRow(BindsContainer, "BindFly")
local NoclipBindBox = createBindSettingRow(BindsContainer, "BindNoclip")
local InfJumpBindBox = createBindSettingRow(BindsContainer, "BindInfJump")
local FlingBindBox = createBindSettingRow(BindsContainer, "BindFling")
local FlingAllBindBox = createBindSettingRow(BindsContainer, "BindFlingAll")
local EspBindBox = createBindSettingRow(BindsContainer, "BindEsp")
local KillAllBindBox = createBindSettingRow(BindsContainer, "BindKillAll")
local AutoSheriffBindBox = createBindSettingRow(BindsContainer, "BindAutoSheriff")
local AutoFarmCoinsBindBox = createBindSettingRow(BindsContainer, "BindAutoFarmCoins")

-- ======= БЛОК КОНТАКТОВ =======
local ContactLabel = Instance.new("TextLabel")
ContactLabel.Name = "ContactLabel"
ContactLabel.Parent = BindsContainer
ContactLabel.BackgroundTransparency = 1
ContactLabel.Size = UDim2.new(1, 0, 0, 35)
ContactLabel.Font = Enum.Font.GothamMedium
ContactLabel.Text = t("Contacts")
ContactLabel.TextColor3 = Color3.fromRGB(130, 130, 150)
ContactLabel.TextSize = 11
ContactLabel.TextWrapped = true
ContactLabel.TextYAlignment = Enum.TextYAlignment.Bottom
ContactLabel.LayoutOrder = 9999 -- Всегда в самом низу списка

local keyBinds = { Fly = nil, Noclip = nil, InfJump = nil, Fling = nil, FlingAll = nil, Esp = nil, KillAll = nil, AutoSheriff = nil, AutoFarmCoins = nil }

local function setupKeyBindLogic(box, keyName)
    box.FocusLost:Connect(function()
        local text = box.Text:upper():sub(1, 1)
        if text ~= "" then
            local success, keyEnum = pcall(function() return Enum.KeyCode[text] end)
            if success then keyBinds[keyName] = keyEnum box.Text = text box.TextColor3 = Color3.fromRGB(0, 255, 150)
            else keyBinds[keyName] = nil box.Text = "" box.TextColor3 = Color3.fromRGB(255, 80, 80) end
        else keyBinds[keyName] = nil box.Text = "" box.TextColor3 = Color3.fromRGB(255, 255, 255) end
    end)
end

setupKeyBindLogic(FlyBindBox, "Fly") setupKeyBindLogic(NoclipBindBox, "Noclip") setupKeyBindLogic(InfJumpBindBox, "InfJump")
setupKeyBindLogic(FlingBindBox, "Fling") setupKeyBindLogic(FlingAllBindBox, "FlingAll") setupKeyBindLogic(EspBindBox, "Esp")
setupKeyBindLogic(KillAllBindBox, "KillAll") setupKeyBindLogic(AutoSheriffBindBox, "AutoSheriff") setupKeyBindLogic(AutoFarmCoinsBindBox, "AutoFarmCoins")

local infJumpEnabled, noclipEnabled, flyEnabled, flingEnabled, flingAllEnabled = false, false, false, false, false
local climbEnabled, mm2EspEnabled, autoSheriffTpEnabled, autoFarmCoinsEnabled = false, false, false, false

-- Регистрация кнопок для системы тем
table.insert(themeObjects.toggles, {btn = InfJumpBtn, getState = function() return infJumpEnabled end})
table.insert(themeObjects.toggles, {btn = NoclipBtn, getState = function() return noclipEnabled end})
table.insert(themeObjects.toggles, {btn = FlyBtn, getState = function() return flyEnabled end})
table.insert(themeObjects.toggles, {btn = ClimbBtn, getState = function() return climbEnabled end})
table.insert(themeObjects.toggles, {btn = MM2EspBtn, getState = function() return mm2EspEnabled end})
table.insert(themeObjects.toggles, {btn = AutoSheriffTpBtn, getState = function() return autoSheriffTpEnabled end})
table.insert(themeObjects.toggles, {btn = AutoFarmCoinsBtn, getState = function() return autoFarmCoinsEnabled end})

local function updateUiTexts()
    BindsTitle.Text = t("BindsTabTitle") ThemeLabel.Text = t("ThemeTitle") LangToggleBtn.Text = t("LangBtn")
    SpeedBox.PlaceholderText = t("SpeedBox") SetSpeedBtn.Text = t("SetSpeed") ResetSpeedBtn.Text = t("ResetSpeed")
    InfJumpBtn.Text = infJumpEnabled and t("InfJumpOn") or t("InfJumpOff")
    NoclipBtn.Text = noclipEnabled and t("NoclipOn") or t("NoclipOff")
    FlyBtn.Text = flyEnabled and t("FlyOn") or t("FlyOff")
    ClimbBtn.Text = climbEnabled and t("ClimbOn") or t("ClimbOff")
    TpTargetBox.PlaceholderText = t("TpBox") TpBtn.Text = t("TpBtn")
    FlingTargetBox.PlaceholderText = t("FlingBox")
    ContactLabel.Text = t("Contacts")
    if not flingEnabled then FlingBtn.Text = t("FlingBtnOff") end
    if not flingAllEnabled then FlingAllBtn.Text = t("FlingAllBtn") end
    MM2EspBtn.Text = mm2EspEnabled and t("EspOn") or t("EspOff")
    KillAllBtn.Text = t("KillAllBtn")
    AutoSheriffTpBtn.Text = autoSheriffTpEnabled and t("AutoSheriffOn") or t("AutoSheriffOff")
    AutoFarmCoinsBtn.Text = autoFarmCoinsEnabled and t("AutoFarmCoinsOn") or t("AutoFarmCoinsOff")
    for key, label in pairs(bindLabels) do label.Text = t(key) end
end

local function selectLanguage(lang)
    currentLang = lang updateUiTexts()
    local fadeOutInfo = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    TweenService:Create(GlassCard, fadeOutInfo, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    TweenService:Create(GlassStroke, fadeOutInfo, {Transparency = 1}):Play()
    TweenService:Create(WelcomeTitle, fadeOutInfo, {TextTransparency = 1}):Play()
    TweenService:Create(WelcomeSub, fadeOutInfo, {TextTransparency = 1}):Play()
    TweenService:Create(RuBtn, fadeOutInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(EnBtn, fadeOutInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    
    task.wait(0.4) GlassOverlay:Destroy()
    MainFrame.Visible = true MainFrame.Size = UDim2.new(0, 280, 0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = normalSize}):Play()
end

RuBtn.MouseButton1Click:Connect(function() selectLanguage("RU") end)
EnBtn.MouseButton1Click:Connect(function() selectLanguage("EN") end)
LangToggleBtn.MouseButton1Click:Connect(function() currentLang = (currentLang == "RU") and "EN" or "RU" updateUiTexts() end)

local function switchTab(tabName)
    activeTab = tabName
    local isMain = (tabName == "Main")
    local isMM2 = (tabName == "MM2")
    local isBinds = (tabName == "Binds")

    if not isMinimized then
        MainContainer.Visible = isMain
        MM2Container.Visible = isMM2
        BindsContainer.Visible = isBinds
    end

    local function updateBtnUI(btn, stroke, active)
        TweenService:Create(btn, TweenInfo.new(0.3), {
            BackgroundTransparency = active and 0.2 or 0.7,
            TextColor3 = active and currentTheme.main or Color3.fromRGB(150, 150, 160)
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.3), {
            Color = active and currentTheme.main or Color3.fromRGB(50, 50, 60)
        }):Play()
    end
    updateBtnUI(MainTabBtn, MainTabStroke, isMain) updateBtnUI(MM2TabBtn, MM2TabStroke, isMM2) updateBtnUI(BindsTabBtn, BindsTabStroke, isBinds)
end

MainTabBtn.MouseButton1Click:Connect(function() switchTab("Main") end)
MM2TabBtn.MouseButton1Click:Connect(function() switchTab("MM2") end)
BindsTabBtn.MouseButton1Click:Connect(function() switchTab("Binds") end)

local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

local menuVisible = true
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.RightShift then
        menuVisible = not menuVisible
        local targetSize = menuVisible and (isMinimized and minimizedSize or normalSize) or UDim2.new(0, 280, 0, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    end
end)

TpBtn.MouseButton1Click:Connect(function()
    local target = GetPlayer(TpTargetBox.Text)
    if TpTargetBox.Text == "" or not target then
        TpBtn.Text = t("PlayerNotFound") TweenService:Create(TpBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 80, 80)}):Play()
        task.wait(1) TpBtn.Text = t("TpBtn") TweenService:Create(TpBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
        return
    end
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        lp.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
        TpBtn.Text = t("TpSuccess") TweenService:Create(TpBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 255, 100)}):Play()
        task.wait(1) TpBtn.Text = t("TpBtn") TweenService:Create(TpBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
    end
end)

local targetSpeed = 16

local function toggleState(btn, stateVar, textOn, textOff)
    local newState = not stateVar
    btn.Text = newState and textOn or textOff
    local newColor = newState and currentTheme.main or Color3.fromRGB(220, 220, 220)
    TweenService:Create(btn, TweenInfo.new(0.3), {TextColor3 = newColor}):Play()
    return newState
end

local function toggleInfJump() infJumpEnabled = toggleState(InfJumpBtn, infJumpEnabled, t("InfJumpOn"), t("InfJumpOff")) end
local function toggleNoclip() noclipEnabled = toggleState(NoclipBtn, noclipEnabled, t("NoclipOn"), t("NoclipOff")) end
local function toggleFly() flyEnabled = toggleState(FlyBtn, flyEnabled, t("FlyOn"), t("FlyOff")) if flyEnabled then startFlying() else stopFlying() end end

local bodyVelocity, bodyGyro
function stopFlying() flyEnabled = false if bodyVelocity then bodyVelocity:Destroy() end if bodyGyro then bodyGyro:Destroy() end end
function startFlying()
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

RunService.Heartbeat:Connect(function() if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = targetSpeed end end)

SetSpeedBtn.MouseButton1Click:Connect(function()
    local num = tonumber(SpeedBox.Text:match("%d+"))
    if num and num >= 0 then
        targetSpeed = num SetSpeedBtn.Text = t("SpeedApplied") TweenService:Create(SetSpeedBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 150, 50)}):Play()
        task.wait(1) SetSpeedBtn.Text = t("SetSpeed") TweenService:Create(SetSpeedBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
    end
end)

ResetSpeedBtn.MouseButton1Click:Connect(function() targetSpeed = 16 SpeedBox.Text = "" end)
InfJumpBtn.MouseButton1Click:Connect(toggleInfJump) NoclipBtn.MouseButton1Click:Connect(toggleNoclip) FlyBtn.MouseButton1Click:Connect(toggleFly)

UserInputService.JumpRequest:Connect(function() if infJumpEnabled and lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end)

RunService.Stepped:Connect(function() if noclipEnabled or autoFarmCoinsEnabled then if lp.Character then for _, part in ipairs(lp.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end end end)

ClimbBtn.MouseButton1Click:Connect(function() climbEnabled = toggleState(ClimbBtn, climbEnabled, t("ClimbOn"), t("ClimbOff")) end)

RunService.Heartbeat:Connect(function()
    if not climbEnabled or not lp.Character or flyEnabled then return end
    local root = lp.Character:FindFirstChild("HumanoidRootPart") local humanoid = lp.Character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end
    local raycastParams = RaycastParams.new() raycastParams.FilterDescendantsInstances = {lp.Character} raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local rayDirection = root.CFrame.LookVector * 2.5
    local raycastResult = workspace:Raycast(root.Position, rayDirection, raycastParams)
    if raycastResult then
        if humanoid.MoveDirection.Magnitude > 0 then root.Velocity = Vector3.new(root.Velocity.X, targetSpeed * 0.8, root.Velocity.Z) else root.Velocity = Vector3.new(root.Velocity.X, 0.1, root.Velocity.Z) end
    end
end)

local flingConnection = nil local savedCFrame = nil local flingTarget = nil

local function stopFling()
    flingEnabled = false
    if flingConnection then flingConnection:Disconnect() flingConnection = nil end
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        local root = lp.Character.HumanoidRootPart root.RotVelocity = Vector3.new(0, 0, 0) root.Velocity = Vector3.new(0, 0, 0)
        if savedCFrame then root.CFrame = savedCFrame savedCFrame = nil end
    end
    FlingBtn.Text = t("FlingBtnOff") TweenService:Create(FlingBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
end

local function toggleFling()
    if flingAllEnabled then print("FLING ALL активен") return end
    if not flingEnabled then
        local target = GetPlayer(FlingTargetBox.Text)
        if FlingTargetBox.Text == "" or not target then
            FlingBtn.Text = t("PlayerNotFound") TweenService:Create(FlingBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 80, 80)}):Play()
            task.wait(1) FlingBtn.Text = t("FlingBtnOff") TweenService:Create(FlingBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
            return
        end
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then savedCFrame = lp.Character.HumanoidRootPart.CFrame end
        flingEnabled = true flingTarget = target FlingBtn.Text = t("FlingBtnAttack") .. target.Name:upper() TweenService:Create(FlingBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 80, 80)}):Play()
        flingConnection = RunService.Heartbeat:Connect(function()
            if not flingEnabled or not lp.Character or not flingTarget or not flingTarget.Character then stopFling() return end
            local myRoot = lp.Character:FindFirstChild("HumanoidRootPart") local tRoot = flingTarget.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot or not tRoot then stopFling() return end
            myRoot.RotVelocity = Vector3.new(0, 999999, 0) myRoot.Velocity = Vector3.new(0, 0, 0)
            local predictedPosition = tRoot.Position + (tRoot.Velocity * 0.1) myRoot.CFrame = CFrame.new(predictedPosition)
        end)
    else stopFling() end
end

local function toggleFlingAll()
    if flingEnabled then return end
    if flingAllEnabled then flingAllEnabled = false FlingAllBtn.Text = t("FlingAllBtn") TweenService:Create(FlingAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play() return end
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local myRoot = lp.Character.HumanoidRootPart local oldCFrame = myRoot.CFrame
    flingAllEnabled = true FlingAllBtn.Text = t("FlingAllActive") TweenService:Create(FlingAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 80, 80)}):Play()
    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(targets, p) end end
    task.spawn(function()
        for _, target in ipairs(targets) do
            if not flingAllEnabled or not lp.Character then break end
            local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if tRoot then
                local startTime = tick()
                while flingAllEnabled and lp.Character and target.Character and tick() - startTime < 0.5 do
                    myRoot.RotVelocity = Vector3.new(0, 999999, 0) myRoot.Velocity = Vector3.new(0, 0, 0) myRoot.CFrame = CFrame.new(tRoot.Position + (tRoot.Velocity * 0.12)) RunService.Heartbeat:Wait()
                end
            end
        end
        flingAllEnabled = false
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then myRoot.RotVelocity = Vector3.new(0, 0, 0) myRoot.Velocity = Vector3.new(0, 0, 0) myRoot.CFrame = oldCFrame end
        FlingAllBtn.Text = t("FlingAllBtn") TweenService:Create(FlingAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
    end)
end

FlingBtn.MouseButton1Click:Connect(toggleFling) FlingAllBtn.MouseButton1Click:Connect(toggleFlingAll)

local currentSheriff = nil
local function removeTagFromChar(char)
    if not char then return end
    local head = char:FindFirstChild("Head") if head and head:FindFirstChild("MM2_Tag") then head.MM2_Tag:Destroy() end
    if char:FindFirstChild("MM2_Highlight") then char.MM2_Highlight:Destroy() end
end

local function updateEspForPlayer(player, roleName, color)
    local char = player.Character if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local head = char:FindFirstChild("Head") if not head then return end
    local bGui = head:FindFirstChild("MM2_Tag")
    if not bGui then
        bGui = Instance.new("BillboardGui") bGui.Name = "MM2_Tag" bGui.Size = UDim2.new(0, 180, 0, 35) bGui.AlwaysOnTop = true bGui.ExtentsOffset = Vector3.new(0, 3, 0) bGui.Parent = head
        local label = Instance.new("TextLabel") label.Name = "RoleLabel" label.Size = UDim2.new(1, 0, 1, 0) label.BackgroundTransparency = 1 label.Font = Enum.Font.GothamBold label.TextSize = 13 label.TextStrokeTransparency = 0.5 label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) label.Parent = bGui
    end
    local label = bGui:FindFirstChild("RoleLabel") if label then label.Text = player.DisplayName .. " [" .. roleName .. "]" label.TextColor3 = color end
    local highlight = char:FindFirstChild("MM2_Highlight")
    if not highlight then highlight = Instance.new("Highlight") highlight.Name = "MM2_Highlight" highlight.FillTransparency = 0.5 highlight.OutlineTransparency = 0 highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlight.Parent = char end
    highlight.FillColor = color highlight.OutlineColor = color
end

local function removeAllTags() for _, p in ipairs(Players:GetPlayers()) do if p.Character then removeTagFromChar(p.Character) end end end
Players.PlayerRemoving:Connect(function(p) if p.Character then removeTagFromChar(p.Character) end end)
for _, p in ipairs(Players:GetPlayers()) do p.CharacterAdded:Connect(function(newChar) task.wait(0.2) if not mm2EspEnabled then removeTagFromChar(newChar) end end) end
Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function(newChar) task.wait(0.2) if not mm2EspEnabled then removeTagFromChar(newChar) end end) end)

local function canCollectSheriffGun()
    local hasKnife = lp.Backpack:FindFirstChild("Knife") or (lp.Character and lp.Character:FindFirstChild("Knife"))
    if hasKnife then return false end
    local mainRoundManager = ReplicatedStorage:FindFirstChild("MainRound")
    if mainRoundManager and mainRoundManager:FindFirstChild("RoundStatus") then if mainRoundManager.RoundStatus.Value ~= "InGame" then return false end end
    return true
end

task.spawn(function()
    while true do
        task.wait(0.2) local foundSheriff = nil
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= lp and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                local roleKey = "RoleInnocent" local color = Color3.fromRGB(0, 255, 100)
                local knife = p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife")
                local gun = p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun")
                if knife then roleKey = "RoleMurder" color = Color3.fromRGB(255, 50, 50) elseif gun then roleKey = "RoleSheriff" color = Color3.fromRGB(50, 150, 255) foundSheriff = p end
                if mm2EspEnabled then updateEspForPlayer(p, t(roleKey), color) else removeTagFromChar(p.Character) end
            elseif p.Character then removeTagFromChar(p.Character) end
        end
        currentSheriff = foundSheriff
        if autoSheriffTpEnabled and currentSheriff and currentSheriff.Character then
            local hum = currentSheriff.Character:FindFirstChildOfClass("Humanoid") local root = currentSheriff.Character:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health <= 0 and root and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                if canCollectSheriffGun() then
                    autoSheriffTpEnabled = false AutoSheriffTpBtn.Text = t("AutoSheriffOff") TweenService:Create(AutoSheriffTpBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
                    local myRoot = lp.Character.HumanoidRootPart local originalCFrame = myRoot.CFrame myRoot.CFrame = root.CFrame
                    task.spawn(function()
                        local startTime = tick()
                        while tick() - startTime < 3 do
                            local hasGun = lp.Backpack:FindFirstChild("Gun") or lp.Character:FindFirstChild("Gun")
                            if hasGun then break end task.wait(0.05)
                        end
                        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then lp.Character.HumanoidRootPart.CFrame = originalCFrame end
                    end)
                end
            end
        end
    end
end)

local function killEveryone()
    local knife = lp.Backpack:FindFirstChild("Knife") or (lp.Character and lp.Character:FindFirstChild("Knife"))
    if not knife then
        KillAllBtn.Text = t("KillAllNeedKnife") TweenService:Create(KillAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 50, 50)}):Play()
        task.wait(0.8) KillAllBtn.Text = t("KillAllBtn") TweenService:Create(KillAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play() return
    end
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local myCharacter = lp.Character local myRoot = myCharacter.HumanoidRootPart local oldCFrame = myRoot.CFrame
    if knife.Parent == lp.Backpack then myCharacter:FindFirstChildOfClass("Humanoid"):EquipTool(knife) end
    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChildOfClass("Humanoid") then if p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then table.insert(targets, p) end end end
    for _, target in ipairs(targets) do
        local tChar = target.Character local tRoot = tChar:FindFirstChild("HumanoidRootPart") local tHum = tChar:FindFirstChildOfClass("Humanoid")
        if tRoot and tHum and tHum.Health > 0 then
            local startTime = tick()
            while tHum.Health > 0 and tick() - startTime < 1.0 and myRoot and tRoot do
                myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, -0.5) myRoot.Velocity = Vector3.new(0, 0, 0)
                if knife and knife.Parent == myCharacter then knife:Activate() end
                if knife:FindFirstChild("Stab") then knife.Stab:FireServer() end RunService.Heartbeat:Wait()
            end
        end
    end
    if myRoot then myRoot.CFrame = oldCFrame myRoot.Velocity = Vector3.new(0, 0, 0) end
end

KillAllBtn.MouseButton1Click:Connect(function()
    local knifeCheck = lp.Backpack:FindFirstChild("Knife") or (lp.Character and lp.Character:FindFirstChild("Knife"))
    if knifeCheck then KillAllBtn.Text = t("FlingAllActive") TweenService:Create(KillAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 50, 50)}):Play() end
    killEveryone() task.wait(0.2) KillAllBtn.Text = t("KillAllBtn") TweenService:Create(KillAllBtn, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
end)

local function toggleEsp() mm2EspEnabled = toggleState(MM2EspBtn, mm2EspEnabled, t("EspOn"), t("EspOff")) if not mm2EspEnabled then removeAllTags() end end
local function toggleAutoSheriff() autoSheriffTpEnabled = toggleState(AutoSheriffTpBtn, autoSheriffTpEnabled, t("AutoSheriffOn"), t("AutoSheriffOff")) end

local autoFarmCoinsLoopConnection = nil local autoFarmCoinsSearchConnection = nil local closestCoin = nil
local function findCoins()
    local coins = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:lower():find("coin") then
            local parent = obj.Parent local isPlayerPart = false
            while parent do if parent:IsA("Model") and parent:FindFirstChildOfClass("Humanoid") then isPlayerPart = true break end parent = parent.Parent end
            if not isPlayerPart then table.insert(coins, obj) end
        end
    end
    return coins
end

local function updateClosestCoin()
    if not autoFarmCoinsEnabled then return end
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    if flingEnabled or flingAllEnabled then closestCoin = nil return end
    local myPos = lp.Character.HumanoidRootPart.Position local coins = findCoins()
    if #coins > 0 then
        local closest, closestDist = nil, math.huge
        for _, coin in ipairs(coins) do local dist = (coin.Position - myPos).Magnitude if dist < closestDist then closestDist = dist closest = coin end end
        closestCoin = closest
    else closestCoin = nil end
end

local function toggleAutoFarmCoins()
    autoFarmCoinsEnabled = toggleState(AutoFarmCoinsBtn, autoFarmCoinsEnabled, t("AutoFarmCoinsOn"), t("AutoFarmCoinsOff"))
    if autoFarmCoinsEnabled then
        if autoFarmCoinsLoopConnection then autoFarmCoinsLoopConnection:Disconnect() end
        if autoFarmCoinsSearchConnection then autoFarmCoinsSearchConnection:Disconnect() end
        autoFarmCoinsSearchConnection = RunService.Heartbeat:Connect(updateClosestCoin)
        autoFarmCoinsLoopConnection = RunService.Heartbeat:Connect(function()
            if not autoFarmCoinsEnabled then
                if autoFarmCoinsLoopConnection then autoFarmCoinsLoopConnection:Disconnect() end
                if autoFarmCoinsSearchConnection then autoFarmCoinsSearchConnection:Disconnect() end
                autoFarmCoinsLoopConnection, autoFarmCoinsSearchConnection = nil, nil return
            end
            if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
            if flingEnabled or flingAllEnabled then return end
            if not closestCoin or not closestCoin.Parent then updateClosestCoin() return end
            local myRoot = lp.Character.HumanoidRootPart local head = lp.Character:FindFirstChild("Head") or myRoot
            local underMapPosition = closestCoin.Position - Vector3.new(0, 3.2, 0)
            myRoot.CFrame = CFrame.new(underMapPosition) myRoot.Velocity = Vector3.new(0, 0, 0) myRoot.RotVelocity = Vector3.new(0, 0, 0)
            if firetouchinterest then firetouchinterest(head, closestCoin, 0) firetouchinterest(head, closestCoin, 1) end
        end)
    else
        if autoFarmCoinsLoopConnection then autoFarmCoinsLoopConnection:Disconnect() autoFarmCoinsLoopConnection = nil end
        if autoFarmCoinsSearchConnection then autoFarmCoinsSearchConnection:Disconnect() autoFarmCoinsSearchConnection = nil end
        closestCoin = nil
    end
end

MM2EspBtn.MouseButton1Click:Connect(toggleEsp) AutoSheriffTpBtn.MouseButton1Click:Connect(toggleAutoSheriff) AutoFarmCoinsBtn.MouseButton1Click:Connect(toggleAutoFarmCoins)

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
    if k == keyBinds.AutoFarmCoins then toggleAutoFarmCoins() end
end)

lp.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flyEnabled then stopFlying() flyEnabled = true startFlying() end
    if flingEnabled then stopFling() end
    flingAllEnabled = false climbEnabled = false
end)
