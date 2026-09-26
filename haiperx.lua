-- HAIPERX HUB - Ultimate Bypass & Fixed Edition (Working Noclip + Invisibility + FOV + Remote)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("HAIPERX_BYPASS_FIXED") then
    CoreGui.HAIPERX_BYPASS_FIXED:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HAIPERX_BYPASS_FIXED"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- สร้างวงกลม FOV แบบ GUI ธรรมดา (รองรับมือถือ 100%)
local FOVFrame = Instance.new("Frame")
FOVFrame.Name = "FOVCircleGUI"
FOVFrame.Parent = ScreenGui
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVFrame.Size = UDim2.new(0, 260, 0, 260)
FOVFrame.BackgroundTransparency = 1
FOVFrame.Visible = false

local FOVStroke = Instance.new("UIStroke")
FOVStroke.Parent = FOVFrame
FOVStroke.Color = Color3.fromRGB(180, 100, 255)
FOVStroke.Thickness = 2

local FOVCircleCorner = Instance.new("UICorner")
FOVCircleCorner.CornerRadius = UDim.new(1, 0)
FOVCircleCorner.Parent = FOVFrame

-- ปุ่มลอยหน้าจอ (UI Logo)
local FloatingButton = Instance.new("TextButton")
FloatingButton.Name = "FloatingLogo"
FloatingButton.Parent = ScreenGui
FloatingButton.BackgroundColor3 = Color3.fromRGB(15, 12, 22)
FloatingButton.Position = UDim2.new(0.05, 0, 0.15, 0)
FloatingButton.Size = UDim2.new(0, 52, 0, 52)
FloatingButton.Draggable = true
FloatingButton.Active = true
FloatingButton.Font = Enum.Font.GothamBold
FloatingButton.Text = "HX"
FloatingButton.TextColor3 = Color3.fromRGB(200, 120, 255)
FloatingButton.TextSize = 18

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(0, 12)
FloatCorner.Parent = FloatingButton

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Parent = FloatingButton
FloatStroke.Color = Color3.fromRGB(138, 43, 226)
FloatStroke.Thickness = 2

-- หน้าต่างหลัก
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 10, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 1.5

FloatingButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- หัวข้อด้านบน
local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.BackgroundColor3 = Color3.fromRGB(18, 14, 26)
Header.Size = UDim2.new(1, 0, 0, 35)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "HaiperX Hub | DEV: HAIPERX"
Title.TextColor3 = Color3.fromRGB(240, 240, 250)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = Header
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 14

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- เมนูด้านซ้าย (Sidebar)
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0, 8, 0, 45)
Sidebar.Size = UDim2.new(0, 150, 1, -55)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 350)
Sidebar.ScrollBarThickness = 2

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)

-- หน้าจอแสดงผลด้านขวา
local function createPage()
    local page = Instance.new("ScrollingFrame")
    page.Parent = MainFrame
    page.BackgroundTransparency = 1
    page.Position = UDim2.new(0, 165, 0, 45)
    page.Size = UDim2.new(1, -175, 1, -55)
    page.CanvasSize = UDim2.new(0, 0, 0, 350)
    page.ScrollBarThickness = 2
    page.Visible = false
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = page
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    
    return page
end

local pageGeneral = createPage()
local pageCombat = createPage()
local pageFarm = createPage()
local pageEsp = createPage()
local pageFov = createPage()
local pageDev = createPage()

pageGeneral.Visible = true

local function createTabButton(name, order, targetPage)
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.BackgroundColor3 = Color3.fromRGB(20, 16, 30)
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.fromRGB(200, 190, 215)
    btn.TextSize, btn.TextXAlignment = 12, Enum.TextXAlignment.Left
    btn.LayoutOrder = order
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        pageGeneral.Visible = false
        pageCombat.Visible = false
        pageFarm.Visible = false
        pageEsp.Visible = false
        pageFov.Visible = false
        pageDev.Visible = false
        targetPage.Visible = true
    end)
    
    return btn
end

createTabButton("General", 1, pageGeneral)
createTabButton("Combat", 2, pageCombat)
createTabButton("Auto Farm", 3, pageFarm)
createTabButton("Esp", 4, pageEsp)
createTabButton("FOV", 5, pageFov)
createTabButton("Developer", 6, pageDev)

local function createToggle(parentPage, text, callback)
    local frame = Instance.new("Frame")
    frame.Parent = parentPage
    frame.BackgroundColor3 = Color3.fromRGB(22, 18, 32)
    frame.Size = UDim2.new(1, -10, 0, 38)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Font = Enum.Font.GothamMedium
    label.Text = text
    label.TextColor3 = Color3.fromRGB(210, 200, 225)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = frame
    toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 48)
    toggleBtn.Position = UDim2.new(0.8, 0, 0.2, 0)
    toggleBtn.Size = UDim2.new(0, 50, 0, 22)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
    toggleBtn.TextSize = 11
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 4)
    tCorner.Parent = toggleBtn
    
    local state = false
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        toggleBtn.Text = state and "ON" or "OFF"
        toggleBtn.TextColor3 = state and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 90, 90)
        toggleBtn.BackgroundColor3 = state and Color3.fromRGB(40, 70, 50) or Color3.fromRGB(35, 30, 48)
        if callback then callback(state) end
    end)
end

-- 1. Invisibility (ระบบล่องหนแบบ Real-time บังคับซ่อนตลอดเวลา)
local invisRunning = false
createToggle(pageGeneral, "Invisibility (ล่องหน)", function(state)
    invisRunning = state
    if not invisRunning and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = (part.Name == "HumanoidRootPart") and 1 or 0
            end
        end
    end
end)

-- 2. Real Noclip (ระบบเดินทะลุแบบบังคับซ้ำทุกสเต็ป ป้องกันเกมรีเซ็ตชน)
local noclipRunning = false
createToggle(pageGeneral, "Noclip (เดินทะลุจริง)", function(state)
    noclipRunning = state
end)

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char then
        if noclipRunning then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        
        if invisRunning then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    if part.Name ~= "HumanoidRootPart" then
                        part.Transparency = 1
                    end
                end
            end
        end
    end
end)

-- 3. ESP & FOV Linked Info
local espEnabled = false
local fovEnabledState = false
local currentRadius = 130

createToggle(pageEsp, "Player & Enemy ESP (มองทะลุ)", function(state)
    espEnabled = state
    if not espEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character then
                if p.Character:FindFirstChild("HaiperX_ESP") then p.Character.HaiperX_ESP:Destroy() end
                if p.Character:FindFirstChild("HaiperX_InfoTag") then p.Character.HaiperX_InfoTag:Destroy() end
            end
        end
    end
end)

createToggle(pageFov, "Show Custom FOV (เปิดวงกลม)", function(state)
    fovEnabledState = state
    FOVFrame.Visible = state
end)

local function createFovSizeBtn(name, sizeVal)
    local btn = Instance.new("TextButton")
    btn.Parent = pageFov
    btn.BackgroundColor3 = Color3.fromRGB(22, 18, 32)
    btn.Size = UDim2.new(1, -10, 0, 32)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "  Size: " .. name
    btn.TextColor3 = Color3.fromRGB(210, 200, 225)
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    btn.MouseButton1Click:Connect(function()
        currentRadius = sizeVal
        FOVFrame.Size = UDim2.new(0, sizeVal * 2, 0, sizeVal * 2)
    end)
end

createFovSizeBtn("Small (90)", 90)
createFovSizeBtn("Medium (130)", 130)
createFovSizeBtn("Large (180)", 180)
createFovSizeBtn("Extra Large (250)", 250)

RunService.RenderStepped:Connect(function()
    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local char = player.Character
                local head = char:FindFirstChild("Head")
                local humanoid = char:FindFirstChild("Humanoid")
                local rootPart = char:FindFirstChild("HumanoidRootPart")
                
                if not char:FindFirstChild("HaiperX_ESP") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "HaiperX_ESP"
                    hl.Adornee = char
                    hl.FillColor = Color3.fromRGB(180, 50, 255)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.FillTransparency = 0.4
                    hl.Parent = char
                end
                
                if fovEnabledState and head and humanoid and rootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if not char:FindFirstChild("HaiperX_InfoTag") then
                        local bg = Instance.new("BillboardGui")
                        bg.Name = "HaiperX_InfoTag"
                        bg.Adornee = head
                        bg.Size = UDim2.new(0, 150, 0, 50)
                        bg.StudsOffset = Vector3.new(0, 2.8, 0)
                        bg.AlwaysOnTop = true
                        bg.Parent = char
                        
                        local txt = Instance.new("TextLabel")
                        txt.Name = "TagText"
                        txt.Parent = bg
                        txt.BackgroundTransparency = 1
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.Font = Enum.Font.GothamBold
                        txt.TextSize = 12
                        txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                        txt.TextStrokeTransparency = 0.2
                    end
                    
                    local tag = char.HaiperX_InfoTag:FindFirstChild("TagText")
                    if tag then
                        local distance = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude)
                        local hp = math.floor(humanoid.Health)
                        local maxHp = math.floor(humanoid.MaxHealth)
                        tag.Text = string.format("👤 %s\n❤️ HP: %d/%d | 📏 %dm", player.Name, hp, maxHp, distance)
                    end
                else
                    if char:FindFirstChild("HaiperX_InfoTag") then
                        char.HaiperX_InfoTag:Destroy()
                    end
                end
            end
        end
    end
end)

-- 4. Aimbot ล็อคหัวในวงกลม FOV
local aimbotEnabled = false
createToggle(pageCombat, "Aimbot (ล็อคหัว)", function(state)
    aimbotEnabled = state
end)

RunService.RenderStepped:Connect(function()
    if aimbotEnabled and fovEnabledState then
        pcall(function()
            local closestTarget = nil
            local shortestDistance = currentRadius
            local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local humanoid = player.Character:FindFirstChild("Humanoid")
                    if humanoid and humanoid.Health > 0 then
                        local headPos, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
                        if onScreen then
                            local magnitude = (Vector2.new(headPos.X, headPos.Y) - screenCenter).Magnitude
                            if magnitude < shortestDistance then
                                shortestDistance = magnitude
                                closestTarget = player.Character.Head
                            end
                        end
                    end
                end
            end
            if closestTarget then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestTarget.Position)
            end
        end)
    end
end)

-- 5. Auto Farm + ฉีดรีโมท (Remote Injection)
local autoFarmRunning = false
createToggle(pageFarm, "Remote Injection Auto Farm", function(state)
    autoFarmRunning = state
    if autoFarmRunning then
        task.spawn(function()
            while autoFarmRunning do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                            if remote:IsA("RemoteEvent") then
                                local rName = remote.Name:lower()
                                if rName:find("attack") or rName:find("hit") or rName:find("quest") or rName:find("farm") then
                                    remote:FireServer()
                                end
                            end
                        end
                        
                        for _, enemy in pairs(Workspace:GetDescendants()) do
                            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                                if enemy ~= char and enemy.Humanoid.Health > 0 then
                                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                    break
                                end
                            end
                        end
                    end
                end)
                task.wait(0.3)
            end
        end)
    end
end)

-- 6. DEVELOPER Info
local function createDevLabel(text)
    local label = Instance.new("TextLabel")
    label.Parent = pageDev
    label.BackgroundColor3 = Color3.fromRGB(22, 18, 32)
    label.Size = UDim2.new(1, -10, 0, 40)
    label.Font = Enum.Font.GothamBold
    label.Text = "  " .. text
    label.TextColor3 = Color3.fromRGB(220, 150, 255)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", label).CornerRadius = UDim.new(0, 4)
end

createDevLabel("DEV: HAIPERX")
createDevLabel("DISCORD: https://discord.gg/BPyaG2Whr7")

print("HAIPERX HUB (Bypass & Fixed Edition) Loaded Successfully!")
