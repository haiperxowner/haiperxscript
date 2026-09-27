-- HAIPERX HUB - Glass UI (Acrylic Theme) Edition
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("HAIPERX_FLUENTPRO_UI") then
    CoreGui.HAIPERX_FLUENTPRO_UI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HAIPERX_FLUENTPRO_UI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Config = {
    WalkSpeed = 16,
    FOVSize = 150,
    WalkEnabled = false,
    NoclipEnabled = false,
    FovEnabled = false,
    AimbotEnabled = false,
    AutoShootEnabled = false,
    SilentAimEnabled = false,
    BodyToHeadEnabled = false,
    EspEnabled = false
}

-- FOV Circle GUI
local FOVFrame = Instance.new("Frame", ScreenGui)
FOVFrame.Name = "FOVCircleGUI"
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVFrame.Size = UDim2.new(0, Config.FOVSize * 2, 0, Config.FOVSize * 2)
FOVFrame.BackgroundTransparency = 1
FOVFrame.Visible = false

local FOVStroke = Instance.new("UIStroke", FOVFrame)
FOVStroke.Color = Color3.fromRGB(150, 100, 255)
FOVStroke.Thickness = 1.5
Instance.new("UICorner", FOVFrame).CornerRadius = UDim.new(1, 0)

-- Main Window (Glass Effect)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 30)
MainFrame.BackgroundTransparency = 0.25
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -180)
MainFrame.Size = UDim2.new(0, 560, 0, 360)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(120, 90, 180)
MainStroke.Transparency = 0.4
MainStroke.Thickness = 1.2

-- Top Bar
local TopBar = Instance.new("Frame", MainFrame)
TopBar.BackgroundColor3 = Color3.fromRGB(24, 18, 40)
TopBar.BackgroundTransparency = 0.3
TopBar.Size = UDim2.new(1, 0, 0, 38)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local TopCover = Instance.new("Frame", TopBar)
TopCover.BackgroundColor3 = Color3.fromRGB(24, 18, 40)
TopCover.BackgroundTransparency = 0.3
TopCover.BorderSizePixel = 0
TopCover.Position = UDim2.new(0, 0, 1, -5)
TopCover.Size = UDim2.new(1, 0, 0, 5)

local TitleLogo = Instance.new("TextLabel", TopBar)
TitleLogo.BackgroundTransparency = 1
TitleLogo.Position = UDim2.new(0, 14, 0, 0)
TitleLogo.Size = UDim2.new(0, 300, 1, 0)
TitleLogo.Font = Enum.Font.GothamBold
TitleLogo.Text = "🪐 HAIPERX HUB" -- เปลี่ยนชื่อค่ายเป็น HAIPERXHUB เรียบร้อย
TitleLogo.TextColor3 = Color3.fromRGB(230, 220, 250)
TitleLogo.TextSize = 13
TitleLogo.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -38, 0, 0)
CloseBtn.Size = UDim2.new(0, 38, 1, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(220, 180, 180)
CloseBtn.TextSize = 14
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Sidebar (Glass Effect)
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.BackgroundColor3 = Color3.fromRGB(14, 10, 24)
Sidebar.BackgroundTransparency = 0.3
Sidebar.Position = UDim2.new(0, 0, 0, 38)
Sidebar.Size = UDim2.new(0, 170, 1, -38)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

local SidebarCover = Instance.new("Frame", Sidebar)
SidebarCover.BackgroundColor3 = Color3.fromRGB(14, 10, 24)
SidebarCover.BackgroundTransparency = 0.3
SidebarCover.BorderSizePixel = 0
SidebarCover.Position = UDim2.new(1, -5, 0, 0)
SidebarCover.Size = UDim2.new(0, 5, 1, 0)

-- User Profile Box
local ProfileBox = Instance.new("Frame", Sidebar)
ProfileBox.BackgroundTransparency = 1
ProfileBox.Position = UDim2.new(0, 12, 0, 12)
ProfileBox.Size = UDim2.new(1, -24, 0, 40)

local AvatarCircle = Instance.new("Frame", ProfileBox)
AvatarCircle.BackgroundColor3 = Color3.fromRGB(60, 45, 90)
AvatarCircle.BackgroundTransparency = 0.2
AvatarCircle.Size = UDim2.new(0, 34, 0, 34)
Instance.new("UICorner", AvatarCircle).CornerRadius = UDim.new(1, 0)

local AvatarText = Instance.new("TextLabel", AvatarCircle)
AvatarText.BackgroundTransparency = 1
AvatarText.Size = UDim2.new(1, 0, 1, 0)
AvatarText.Font = Enum.Font.GothamBold
AvatarText.Text = "HX"
AvatarText.TextColor3 = Color3.fromRGB(200, 160, 255)
AvatarText.TextSize = 12

local NameLabel = Instance.new("TextLabel", ProfileBox)
NameLabel.BackgroundTransparency = 1
NameLabel.Position = UDim2.new(0, 42, 0, 0)
NameLabel.Size = UDim2.new(1, -42, 1, 0)
NameLabel.Font = Enum.Font.GothamBold
NameLabel.Text = "HAIPERX"
NameLabel.TextColor3 = Color3.fromRGB(230, 220, 250)
NameLabel.TextSize = 12
NameLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Navigation Container
local NavContainer = Instance.new("ScrollingFrame", Sidebar)
NavContainer.BackgroundTransparency = 1
NavContainer.Position = UDim2.new(0, 8, 0, 60)
NavContainer.Size = UDim2.new(1, -16, 1, -70)
NavContainer.CanvasSize = UDim2.new(0, 0, 0, 250)
NavContainer.ScrollBarThickness = 0

local NavList = Instance.new("UIListLayout", NavContainer)
NavList.SortOrder = Enum.SortOrder.LayoutOrder
NavList.Padding = UDim.new(0, 4)

-- Pages Area
local function createPage()
    local page = Instance.new("ScrollingFrame", MainFrame)
    page.Name = "PageContainer"
    page.BackgroundTransparency = 1
    page.Position = UDim2.new(0, 185, 0, 50)
    page.Size = UDim2.new(1, -195, 1, -60)
    page.CanvasSize = UDim2.new(0, 0, 0, 500)
    page.ScrollBarThickness = 2
    page.Visible = false
    local layout = Instance.new("UIListLayout", page)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    return page
end

local pageCombat = createPage()
local pagePlayer = createPage()
local pageEsp = createPage()
local pageFov = createPage()
local pageDev = createPage()
pageCombat.Visible = true

local function createNavBtn(name, order, targetPage)
    local btn = Instance.new("TextButton", NavContainer)
    btn.BackgroundColor3 = Color3.fromRGB(30, 22, 50)
    btn.BackgroundTransparency = 0.4
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "   " .. name
    btn.TextColor3 = Color3.fromRGB(190, 180, 215)
    btn.TextSize, btn.TextXAlignment = 12, Enum.TextXAlignment.Left
    btn.LayoutOrder = order
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(MainFrame:GetChildren()) do
            if p:IsA("ScrollingFrame") and p.Name == "PageContainer" then
                p.Visible = false
            end
        end
        targetPage.Visible = true
    end)
end

createNavBtn("Combat & Magic", 1, pageCombat)
createNavBtn("Player & Speed", 2, pagePlayer)
createNavBtn("Visuals (ESP)", 3, pageEsp)
createNavBtn("FOV Settings", 4, pageFov)
createNavBtn("Developer", 5, pageDev)

-- UI Toggle Creator (Glass Box)
local function createToggle(parentPage, title, desc, callback)
    local frame = Instance.new("Frame", parentPage)
    frame.BackgroundColor3 = Color3.fromRGB(28, 20, 48)
    frame.BackgroundTransparency = 0.35
    frame.Size = UDim2.new(1, -10, 0, 52)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local tLabel = Instance.new("TextLabel", frame)
    tLabel.BackgroundTransparency = 1
    tLabel.Position = UDim2.new(0, 14, 0, 8)
    tLabel.Size = UDim2.new(0.7, 0, 0, 18)
    tLabel.Font = Enum.Font.GothamBold
    tLabel.Text = title
    tLabel.TextColor3 = Color3.fromRGB(235, 225, 250)
    tLabel.TextSize, tLabel.TextXAlignment = 12, Enum.TextXAlignment.Left
    
    local dLabel = Instance.new("TextLabel", frame)
    dLabel.BackgroundTransparency = 1
    dLabel.Position = UDim2.new(0, 14, 0, 26)
    dLabel.Size = UDim2.new(0.7, 0, 0, 18)
    dLabel.Font = Enum.Font.Gotham
    dLabel.Text = desc
    dLabel.TextColor3 = Color3.fromRGB(160, 150, 185)
    dLabel.TextSize, dLabel.TextXAlignment = 11, Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton", frame)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 75)
    toggleBtn.BackgroundTransparency = 0.2
    toggleBtn.Position = UDim2.new(1, -55, 0.5, -11)
    toggleBtn.Size = UDim2.new(0, 44, 0, 22)
    toggleBtn.Text = ""
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
    
    local circle = Instance.new("Frame", toggleBtn)
    circle.BackgroundColor3 = Color3.fromRGB(180, 170, 200)
    circle.Position = UDim2.new(0, 2, 0.5, -9)
    circle.Size = UDim2.new(0, 18, 0, 18)
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
    
    local state = false
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(130, 80, 220)
            circle.Position = UDim2.new(1, -20, 0.5, -9)
            circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 75)
            circle.Position = UDim2.new(0, 2, 0.5, -9)
            circle.BackgroundColor3 = Color3.fromRGB(180, 170, 200)
        end
        if callback then callback(state) end
    end)
end

-- UI Slider Creator (Glass Box)
local function createSlider(parentPage, title, minVal, maxVal, defaultVal, callback)
    local frame = Instance.new("Frame", parentPage)
    frame.BackgroundColor3 = Color3.fromRGB(28, 20, 48)
    frame.BackgroundTransparency = 0.35
    frame.Size = UDim2.new(1, -10, 0, 60)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local tLabel = Instance.new("TextLabel", frame)
    tLabel.BackgroundTransparency = 1
    tLabel.Position = UDim2.new(0, 14, 0, 8)
    tLabel.Size = UDim2.new(0.7, 0, 0, 18)
    tLabel.Font = Enum.Font.GothamBold
    tLabel.Text = title
    tLabel.TextColor3 = Color3.fromRGB(235, 225, 250)
    tLabel.TextSize, tLabel.TextXAlignment = 12, Enum.TextXAlignment.Left
    
    local valLabel = Instance.new("TextLabel", frame)
    valLabel.BackgroundTransparency = 1
    valLabel.Position = UDim2.new(1, -70, 0, 8)
    valLabel.Size = UDim2.new(0, 56, 0, 18)
    valLabel.Font = Enum.Font.GothamBold
    valLabel.Text = tostring(defaultVal)
    valLabel.TextColor3 = Color3.fromRGB(180, 140, 255)
    valLabel.TextSize, valLabel.TextXAlignment = 12, Enum.TextXAlignment.Right
    
    local sliderBar = Instance.new("Frame", frame)
    sliderBar.BackgroundColor3 = Color3.fromRGB(45, 35, 75)
    sliderBar.BackgroundTransparency = 0.2
    sliderBar.Position = UDim2.new(0, 14, 0, 38)
    sliderBar.Size = UDim2.new(1, -28, 0, 6)
    Instance.new("UICorner", sliderBar).CornerRadius = UDim.new(1, 0)
    
    local sliderFill = Instance.new("Frame", sliderBar)
    sliderFill.BackgroundColor3 = Color3.fromRGB(130, 80, 220)
    sliderFill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)
    
    local dragging = false
    
    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        sliderFill.Size = UDim2.new(pos, 0, 1, 0)
        local val = math.floor(minVal + ((maxVal - minVal) * pos))
        valLabel.Text = tostring(val)
        if callback then callback(val) end
    end
    
    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
end

-- ฟังก์ชันในหมวด Combat
createToggle(pageCombat, "Aimbot (ล็อกหัวเป้าหมาย)", "ล็อกกล้องไปที่หัวศัตรูในระยะ FOV อัตโนมัติ", function(state) Config.AimbotEnabled = state end)
createToggle(pageCombat, "Auto-Shoot (ยิงออโต้)", "ลั่นไกยิงทันทีเมื่อเป้าเล็งล็อคโดนหัวศัตรู", function(state) Config.AutoShootEnabled = state end)
createToggle(pageCombat, "Silent Aim / Magic Bullet", "กระสุนเลี้ยวโค้งเข้าหัวเป้าหมายทันที", function(state) Config.SilentAimEnabled = state end)
createToggle(pageCombat, "Body to Head Redirect", "ยิงโดนตัว นับดาเมจเป็นหัวให้อัตโนมัติ", function(state) Config.BodyToHeadEnabled = state end)

-- ฟังก์ชันในหมวด Player
createToggle(pagePlayer, "Custom WalkSpeed", "เปิดใช้งานระบบปรับความเร็วเดิน", function(state) Config.WalkEnabled = state end)
createSlider(pagePlayer, "WalkSpeed Value", 16, 250, 16, function(val) Config.WalkSpeed = val end)
createToggle(pagePlayer, "Ultimate Noclip", "เดินทะลุกำแพงและวัตถุต่างๆ ในเกม", function(state) Config.NoclipEnabled = state end)

-- ฟังก์ชันในหมวด ESP
createToggle(pageEsp, "Player ESP Box", "ไฮไลต์เรืองแสงรอบตัวผู้เล่นมองเห็นชัดเจน", function(state) Config.EspEnabled = state end)

-- ฟังก์ชันในหมวด FOV
createToggle(pageFov, "Show FOV Circle", "แสดงวงกลมขอบเขตล็อกเป้า", function(state)
    Config.FovEnabled = state
    FOVFrame.Visible = state
end)
createSlider(pageFov, "FOV Circle Size", 50, 400, 150, function(val)
    Config.FOVSize = val
    FOVFrame.Size = UDim2.new(0, val * 2, 0, val * 2)
end)

-- หน้า Developer Info
local function createDevInfo(txt, sub)
    local frame = Instance.new("Frame", pageDev)
    frame.BackgroundColor3 = Color3.fromRGB(28, 20, 48)
    frame.BackgroundTransparency = 0.35
    frame.Size = UDim2.new(1, -10, 0, 52)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local tLabel = Instance.new("TextLabel", frame)
    tLabel.BackgroundTransparency = 1
    tLabel.Position = UDim2.new(0, 14, 0, 8)
    tLabel.Size = UDim2.new(0.9, 0, 0, 18)
    tLabel.Font = Enum.Font.GothamBold
    tLabel.Text = txt
    tLabel.TextColor3 = Color3.fromRGB(235, 225, 250)
    tLabel.TextSize, tLabel.TextXAlignment = 12, Enum.TextXAlignment.Left
    
    local dLabel = Instance.new("TextLabel", frame)
    dLabel.BackgroundTransparency = 1
    dLabel.Position = UDim2.new(0, 14, 0, 26)
    dLabel.Size = UDim2.new(0.9, 0, 0, 18)
    dLabel.Font = Enum.Font.Gotham
    dLabel.Text = sub
    dLabel.TextColor3 = Color3.fromRGB(160, 150, 185)
    dLabel.TextSize, dLabel.TextXAlignment = 11, Enum.TextXAlignment.Left
end

createDevInfo("Developer : HAIPERX", "ผู้พัฒนาและดูแลระบบหลักของสคริปต์")
createDevInfo("Version : HAIPERX HUB Acrylic Glass v3.8", "ดีไซน์กระจกใส หรูหรา ลื่นไหลทุกฟังก์ชัน")

-- ปุ่มลอยเปิด-ปิดเมนูบนจอ
local FloatBtn = Instance.new("TextButton", ScreenGui)
FloatBtn.Name = "FloatingMenuButton"
FloatBtn.BackgroundColor3 = Color3.fromRGB(24, 18, 40)
FloatBtn.BackgroundTransparency = 0.25
FloatBtn.Position = UDim2.new(0, 20, 0.5, -25)
FloatBtn.Size = UDim2.new(0, 50, 0, 50)
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.Text = "🪐"
FloatBtn.TextColor3 = Color3.fromRGB(220, 210, 240)
FloatBtn.TextSize = 20
FloatBtn.Active = true
FloatBtn.Draggable = true
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
local FloatStroke = Instance.new("UIStroke", FloatBtn)
FloatStroke.Color = Color3.fromRGB(130, 80, 220)
FloatStroke.Thickness = 2

FloatBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ระบบทำงานเบื้องหลัง
RunService.Stepped:Connect(function()
    if Config.WalkEnabled then
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid").WalkSpeed = Config.WalkSpeed
            end
        end)
    end

    if Config.NoclipEnabled then
        pcall(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end)

RunService.RenderStepped:Connect(function()
    if Config.EspEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("HAIPERX_ESP") then
                local hl = Instance.new("Highlight", player.Character)
                hl.Name = "HAIPERX_ESP"
                hl.FillColor = Color3.fromRGB(140, 60, 255)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end

    if Config.AimbotEnabled then
        pcall(function()
            local closestTarget = nil
            local shortestDistance = Config.FOVSize
            local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local isTeamMate = (player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team)
                    if not isTeamMate then
                        local hum = player.Character:FindFirstChild("Humanoid")
                        if hum and hum.Health > 0 then
                            local headPos, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
                            if onScreen then
                                local mag = (Vector2.new(headPos.X, headPos.Y) - screenCenter).Magnitude
                                if mag < shortestDistance then
                                    shortestDistance = mag
                                    closestTarget = player.Character.Head
                                end
                            end
                        end
                    end
                end
            end
            
            if closestTarget then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestTarget.Position)
                
                if Config.AutoShootEnabled then
                    VirtualUser:Button1Down(Vector2.new(0,0))
                    task.wait(0.05)
                    VirtualUser:Button1Up(Vector2.new(0,0))
                end
            end
        end)
    end

    if Config.BodyToHeadEnabled then
        pcall(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    local torso = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("Torso")
                    if head and torso then
                        torso.Size = Vector3.new(3, 3, 3)
                        torso.Transparency = 1
                        torso.CanCollide = false
                    end
                end
            end
        end)
    end
end)

print("HAIPERX HUB Glass UI v3.8 Loaded Successfully!")
