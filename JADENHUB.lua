--==================================================
-- 👑 JADEN ADMIN / OWNER TAG
-- ONE SCRIPT ONLY
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local selectedRole = "ADMIN"

--==================================================
-- SETUP GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "JadenRoleSetup"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 275)
frame.Position = UDim2.new(0.5, -160, 0.5, -137)
frame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(70, 150, 255)
stroke.Parent = frame

--==================================================
-- TITLE
--==================================================

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 38)
title.Position = UDim2.new(0, 10, 0, 8)
title.BackgroundTransparency = 1
title.Text = "ROLE SETUP"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Parent = frame

--==================================================
-- USERNAME
--==================================================

local usernameBox = Instance.new("TextBox")
usernameBox.Size = UDim2.new(1, -30, 0, 40)
usernameBox.Position = UDim2.new(0, 15, 0, 52)
usernameBox.BackgroundColor3 = Color3.fromRGB(35,38,48)
usernameBox.BorderSizePixel = 0
usernameBox.PlaceholderText = "Enter Username"
usernameBox.Text = ""
usernameBox.TextScaled = true
usernameBox.Font = Enum.Font.Gotham
usernameBox.TextColor3 = Color3.fromRGB(255,255,255)
usernameBox.PlaceholderColor3 = Color3.fromRGB(150,150,160)
usernameBox.Parent = frame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0,10)
boxCorner.Parent = usernameBox

--==================================================
-- ADMIN
--==================================================

local admin = Instance.new("TextButton")
admin.Size = UDim2.new(0.42,0,0,40)
admin.Position = UDim2.new(0.06,0,0,105)
admin.BackgroundColor3 = Color3.fromRGB(50,135,255)
admin.BorderSizePixel = 0
admin.Text = "ADMIN"
admin.TextScaled = true
admin.Font = Enum.Font.GothamBold
admin.TextColor3 = Color3.fromRGB(255,255,255)
admin.Parent = frame

local ac = Instance.new("UICorner")
ac.CornerRadius = UDim.new(0,10)
ac.Parent = admin

--==================================================
-- OWNER
--==================================================

local owner = Instance.new("TextButton")
owner.Size = UDim2.new(0.42,0,0,40)
owner.Position = UDim2.new(0.52,0,0,105)
owner.BackgroundColor3 = Color3.fromRGB(50,50,60)
owner.BorderSizePixel = 0
owner.Text = "OWNER"
owner.TextScaled = true
owner.Font = Enum.Font.GothamBold
owner.TextColor3 = Color3.fromRGB(255,255,255)
owner.Parent = frame

local oc = Instance.new("UICorner")
oc.CornerRadius = UDim.new(0,10)
oc.Parent = owner

--==================================================
-- ENTER
--==================================================

local enter = Instance.new("TextButton")
enter.Size = UDim2.new(1,-30,0,40)
enter.Position = UDim2.new(0,15,0,165)
enter.BackgroundColor3 = Color3.fromRGB(40,190,100)
enter.BorderSizePixel = 0
enter.Text = "ENTER"
enter.TextScaled = true
enter.Font = Enum.Font.GothamBold
enter.TextColor3 = Color3.fromRGB(255,255,255)
enter.Parent = frame

local ec = Instance.new("UICorner")
ec.CornerRadius = UDim.new(0,10)
ec.Parent = enter

--==================================================
-- SOCIAL LINKS
--==================================================

local tiktok = Instance.new("TextLabel")
tiktok.Size = UDim2.new(1,-30,0,20)
tiktok.Position = UDim2.new(0,15,0,215)
tiktok.BackgroundTransparency = 1
tiktok.Text = "TikTok: lalamojaden1"
tiktok.TextScaled = true
tiktok.Font = Enum.Font.GothamMedium
tiktok.TextColor3 = Color3.fromRGB(255,255,255)
tiktok.Parent = frame

local discord = Instance.new("TextLabel")
discord.Size = UDim2.new(1,-30,0,20)
discord.Position = UDim2.new(0,15,0,238)
discord.BackgroundTransparency = 1
discord.Text = "Discord: discord.gg/bhfJys73d"
discord.TextScaled = true
discord.Font = Enum.Font.GothamMedium
discord.TextColor3 = Color3.fromRGB(150,190,255)
discord.Parent = frame

--==================================================
-- ROLE SELECTION
--==================================================

admin.MouseButton1Click:Connect(function()
	selectedRole = "ADMIN"

	admin.BackgroundColor3 = Color3.fromRGB(50,135,255)
	owner.BackgroundColor3 = Color3.fromRGB(50,50,60)
end)

owner.MouseButton1Click:Connect(function()
	selectedRole = "OWNER"

	owner.BackgroundColor3 = Color3.fromRGB(220,160,40)
	admin.BackgroundColor3 = Color3.fromRGB(50,50,60)
end)

--==================================================
-- FIND PLAYER
--==================================================

local function findPlayer(name)
	name = string.lower(name)

	for _, plr in ipairs(Players:GetPlayers()) do
		if string.lower(plr.Name) == name
			or string.lower(plr.DisplayName) == name then
			return plr
		end
	end

	return nil
end

--==================================================
-- SMALL HEAD TAG
--==================================================

local function createTag(target, role)

	local character = target.Character
	if not character then return end

	local head = character:FindFirstChild("Head")
	if not head then return end

	local old = head:FindFirstChild("JadenRoleTag")
	if old then
		old:Destroy()
	end

	local tag = Instance.new("BillboardGui")
	tag.Name = "JadenRoleTag"
	tag.Adornee = head
	tag.Size = UDim2.new(0,105,0,28)
	tag.StudsOffset = Vector3.new(0,2.7,0)
	tag.AlwaysOnTop = true
	tag.MaxDistance = 100
	tag.LightInfluence = 0
	tag.Parent = head

	local text = Instance.new("TextLabel")
	text.Size = UDim2.fromScale(1,1)
	text.BackgroundTransparency = 1
	text.TextScaled = true
	text.Font = Enum.Font.GothamBold
	text.TextStrokeTransparency = 0.2
	text.TextStrokeColor3 = Color3.fromRGB(0,0,0)
	text.Parent = tag

	if role == "OWNER" then
		text.Text = "OWNER"
		text.TextColor3 = Color3.fromRGB(255,200,50)
	else
		text.Text = "ADMIN"
		text.TextColor3 = Color3.fromRGB(70,170,255)
	end

	-- Small floating effect
	task.spawn(function()
		while tag.Parent do

			TweenService:Create(
				tag,
				TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
				{StudsOffset = Vector3.new(0,2.85,0)}
			):Play()

			task.wait(1.2)

			TweenService:Create(
				tag,
				TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
				{StudsOffset = Vector3.new(0,2.7,0)}
			):Play()

			task.wait(1.2)
		end
	end)
end

--==================================================
-- ENTER
--==================================================

enter.MouseButton1Click:Connect(function()

	local username = usernameBox.Text:gsub("^%s*(.-)%s*$","%1")

	if username == "" then
		usernameBox.PlaceholderText = "Enter Username!"
		return
	end

	local target = findPlayer(username)

	if not target then
		usernameBox.Text = ""
		usernameBox.PlaceholderText = "Player Not Found!"
		return
	end

	createTag(target, selectedRole)

	frame.Visible = false
end)
