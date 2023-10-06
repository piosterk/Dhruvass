local Library = {}

local Theme = shared.__colortheme or {
	TextColor = Color3.fromRGB(255, 60, 60),
	ImageColor = Color3.fromRGB(255, 60, 60)
}

local TweenService = game:GetService("TweenService")

Library.LastTab = nil
Library.Mouse = game.Players.LocalPlayer:GetMouse()

function Library:Tween(Object, Time, EasingS, EasingD, Value)
	local newTween = TweenService:Create(Object, TweenInfo.new(Time, EasingS, EasingD), Value)
	newTween:Play()

	return newTween
end

function Library:Tweens(Array)
	local Tweens = {}

	for _, Tween in pairs(Array) do
		local newTween = Library:Tween(unpack(Tween))

		table.insert(Tweens, newTween)
	end

	return Tweens
end

function Library:OnClick(GuiBase, Callback)
	if GuiBase:IsA("GuiBase2d") then
		GuiBase.Active = true
		GuiBase.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Callback()
			end
		end)
	end
end

function Library:Load(Options)
	local Options = Options or {}
	Options.RemoveLastSession = Options.RemoveLastSession or true
	Options.KeySystem = Options.KeySystem or {
		Changelog = "wee",
		IsRequired = true,
		Keys = {
			"PokeSterk",
			"pokesterk",
			"dhruv"
		}
	}

	if Options.RemoveLastSession and shared.__namelesswindow then
		shared.__namelesswindow:Destroy()
		shared.__namelesswindow = nil
	end

	shared.__namelesswindow = NamelessWindow
	
	local NamelessWindow = Instance.new("ScreenGui")
	NamelessWindow.Name = game:GetService("HttpService"):GenerateGUID(false)
	NamelessWindow.ResetOnSpawn = false
	NamelessWindow.Parent = (checkcaller and typeof(checkcaller) == "function") and game.CoreGui or game.Players.LocalPlayer.PlayerGui
	
	shared.__namelesswindow = NamelessWindow
	
	local IsCorrectKey = false
	
	if Options.KeySystem and Options.KeySystem.IsRequired then
		local thumbnailType = Enum.ThumbnailType.HeadShot
		local thumbnailSize = Enum.ThumbnailSize.Size420x420

		local content, isReady = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, thumbnailType, thumbnailSize)
		
		local WaveSpeed = 5
		
		local KeySystem = Instance.new("Frame")
		KeySystem.Name = "KeySystem"
		KeySystem.AnchorPoint = Vector2.new(0.5, 0)
		KeySystem.Size = UDim2.new(0, 450, 0, 350)
		KeySystem.Position = UDim2.new(0.5, 0, 1, 40)
		KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
		KeySystem.BorderSizePixel = 0
		KeySystem.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		KeySystem.Parent = NamelessWindow

		local Right = Instance.new("Frame")
		Right.Name = "Right"
		Right.AnchorPoint = Vector2.new(1, 0)
		Right.Size = UDim2.new(0, 200, 1, 0)
		Right.ClipsDescendants = true
		Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Right.Position = UDim2.new(1, 0, 0, 0)
		Right.BorderSizePixel = 0
		Right.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Right.Parent = KeySystem

		local Frame = Instance.new("Frame")
		Frame.Name = "1"
		Frame.ZIndex = 2
		Frame.AnchorPoint = Vector2.new(0, 1)
		Frame.Size = UDim2.new(2, 0, 0, 100)
		Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Frame.Position = UDim2.new(0, 0, 1, 0)
		Frame.BorderSizePixel = 0
		Frame.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		Frame.Parent = Right

		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Name = "1"
		ImageLabel.AnchorPoint = Vector2.new(0, 1)
		ImageLabel.Size = UDim2.new(0.5, 0, 0, 22)
		ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.Position = UDim2.new(0, 0, 0, 1)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel.ScaleType = Enum.ScaleType.Fit
		ImageLabel.ImageColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel.Image = "rbxassetid://13296472401"
		ImageLabel.Parent = Frame

		local ImageLabel1 = Instance.new("ImageLabel")
		ImageLabel1.Name = "2"
		ImageLabel1.AnchorPoint = Vector2.new(1, 1)
		ImageLabel1.Size = UDim2.new(0.5, 0, 0, 22)
		ImageLabel1.BorderColor3 = Color3.fromRGB(27, 42, 53)
		ImageLabel1.BackgroundTransparency = 1
		ImageLabel1.Position = UDim2.new(1, 0, 0, 1)
		ImageLabel1.BorderSizePixel = 0
		ImageLabel1.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel1.ScaleType = Enum.ScaleType.Fit
		ImageLabel1.ImageColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel1.Image = "rbxassetid://13296472401"
		ImageLabel1.Parent = Frame

		local LocalScript = Instance.new("LocalScript")
		LocalScript.Parent = Frame

		local Frame1 = Instance.new("Frame")
		Frame1.Name = "2"
		Frame1.AnchorPoint = Vector2.new(0.5, 1)
		Frame1.Size = UDim2.new(2, 0, 0, 100)
		Frame1.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Frame1.BackgroundTransparency = 0.5
		Frame1.Position = UDim2.new(0, 0, 1, -10)
		Frame1.BorderSizePixel = 0
		Frame1.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		Frame1.Parent = Right
		
		spawn(function()
			while task.wait() do
				Library:Tween(Frame, WaveSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, {AnchorPoint = Vector2.new(0.5, 1)}).Completed:Wait()

				Frame.AnchorPoint = Vector2.new(0, 1)
			end
		end)
		
		spawn(function()
			while task.wait() do
				Library:Tween(Frame1, WaveSpeed * 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, {AnchorPoint = Vector2.new(0, 1)}).Completed:Wait()

				Frame.AnchorPoint = Vector2.new(0.5, 1)
			end
		end)

		local ImageLabel2 = Instance.new("ImageLabel")
		ImageLabel2.Name = "1"
		ImageLabel2.AnchorPoint = Vector2.new(0, 1)
		ImageLabel2.Size = UDim2.new(0.5, 0, 0, 22)
		ImageLabel2.BorderColor3 = Color3.fromRGB(27, 42, 53)
		ImageLabel2.BackgroundTransparency = 1
		ImageLabel2.Position = UDim2.new(0, 0, 0, 1)
		ImageLabel2.BorderSizePixel = 0
		ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel2.ScaleType = Enum.ScaleType.Fit
		ImageLabel2.ImageTransparency = 0.5
		ImageLabel2.ImageColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel2.Image = "rbxassetid://13296472401"
		ImageLabel2.Parent = Frame1

		local ImageLabel3 = Instance.new("ImageLabel")
		ImageLabel3.Name = "2"
		ImageLabel3.AnchorPoint = Vector2.new(1, 1)
		ImageLabel3.Size = UDim2.new(0.5, 0, 0, 22)
		ImageLabel3.BorderColor3 = Color3.fromRGB(27, 42, 53)
		ImageLabel3.BackgroundTransparency = 1
		ImageLabel3.Position = UDim2.new(1, 0, 0, 1)
		ImageLabel3.BorderSizePixel = 0
		ImageLabel3.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel3.ScaleType = Enum.ScaleType.Fit
		ImageLabel3.ImageTransparency = 0.5
		ImageLabel3.ImageColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel3.Image = "rbxassetid://13296472401"
		ImageLabel3.Parent = Frame1

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.ZIndex = 2
		Title.AutomaticSize = Enum.AutomaticSize.Y
		Title.Size = UDim2.new(1, 0, 0, 0)
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 0, 0, 10)
		Title.BorderSizePixel = 0
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.FontSize = Enum.FontSize.Size18
		Title.TextSize = 15
		Title.TextColor3 = Color3.fromRGB(255, 60, 60)
		Title.Text = "⛔🔑 Key System ✋🔐"
		Title.Font = Enum.Font.GothamBold
		Title.Parent = Right

		local Log = Instance.new("TextLabel")
		Log.Name = "Log"
		Log.Size = UDim2.new(1, 0, 1, -30)
		Log.ClipsDescendants = true
		Log.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Log.BackgroundTransparency = 1
		Log.Position = UDim2.new(0, 0, 0, 30)
		Log.BorderSizePixel = 0
		Log.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Log.FontSize = Enum.FontSize.Size14
		Log.TextTruncate = Enum.TextTruncate.AtEnd
		Log.TextSize = 13
		Log.TextColor3 = Color3.fromRGB(255, 255, 255)
		Log.TextYAlignment = Enum.TextYAlignment.Top
		Log.Text = Options.KeySystem.Changelog
		Log.TextWrapped = true
		Log.TextWrap = true
		Log.Font = Enum.Font.Gotham
		Log.TextTransparency = 0.5
		Log.TextXAlignment = Enum.TextXAlignment.Left
		Log.LineHeight = 1.5
		Log.Parent = Right

		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingLeft = UDim.new(0, 20)
		UIPadding.Parent = Log

		local Shadow = Instance.new("ImageLabel")
		Shadow.Name = "Shadow"
		Shadow.ZIndex = 0
		Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
		Shadow.Size = UDim2.new(1, 47, 1, 47)
		Shadow.BackgroundTransparency = 1
		Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		Shadow.BorderSizePixel = 0
		Shadow.ScaleType = Enum.ScaleType.Slice
		Shadow.ImageTransparency = 0.5
		Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		Shadow.Image = "rbxassetid://6015897843"
		Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
		Shadow.Parent = KeySystem

		local Left = Instance.new("Frame")
		Left.Name = "Left"
		Left.Size = UDim2.new(1, -200, 1, 0)
		Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Left.BackgroundTransparency = 1
		Left.BorderSizePixel = 0
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.Parent = KeySystem

		local User = Instance.new("Frame")
		User.Name = "User"
		User.AnchorPoint = Vector2.new(0.5, 0)
		User.Size = UDim2.new(0, 100, 0, 100)
		User.BorderColor3 = Color3.fromRGB(0, 0, 0)
		User.BackgroundTransparency = 1
		User.Position = UDim2.new(0.5, 0, 0, 50)
		User.BorderSizePixel = 0
		User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		User.Parent = Left

		local Image = Instance.new("ImageLabel")
		Image.Name = "Image"
		Image.AnchorPoint = Vector2.new(0.5, 0.5)
		Image.Size = UDim2.new(1, -20, 1, -20)
		Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Image.BackgroundTransparency = 1
		Image.Position = UDim2.new(0.5, 0, 0.5, 0)
		Image.BorderSizePixel = 0
		Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Image.ScaleType = Enum.ScaleType.Fit
		Image.Image = content
		Image.Parent = User
		
		local UICornerImage = Instance.new("UICorner")
		UICornerImage.CornerRadius = UDim.new(1, 0)
		UICornerImage.Parent = Image

		local UIStroke = Instance.new("UIStroke")
		UIStroke.Thickness = 2
		UIStroke.Color = Color3.fromRGB(255, 60, 60)
		UIStroke.Parent = User

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = User

		local Keyinput = Instance.new("TextBox")
		Keyinput.Name = "Keyinput"
		Keyinput.AnchorPoint = Vector2.new(0.5, 0.5)
		Keyinput.Size = UDim2.new(0, 200, 0, 25)
		Keyinput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keyinput.BackgroundTransparency = 1
		Keyinput.Position = UDim2.new(0.5, 0, 0.5, 10)
		Keyinput.BorderSizePixel = 0
		Keyinput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Keyinput.FontSize = Enum.FontSize.Size14
		Keyinput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
		Keyinput.TextSize = 13
		Keyinput.TextTransparency = 0.5
		Keyinput.TextColor3 = Color3.fromRGB(255, 255, 255)
		Keyinput.Text = "Key here..."
		Keyinput.CursorPosition = -1
		Keyinput.Font = Enum.Font.Gotham
		Keyinput.Parent = Left

		local UIStroke1 = Instance.new("UIStroke")
		UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke1.Color = Color3.fromRGB(40, 40, 40)
		UIStroke1.Parent = Keyinput

		local EnterKey = Instance.new("Frame")
		EnterKey.Name = "EnterKey"
		EnterKey.AnchorPoint = Vector2.new(0.5, 0.5)
		EnterKey.Size = UDim2.new(0, 80, 0, 25)
		EnterKey.Selectable = true
		EnterKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
		EnterKey.Position = UDim2.new(0.5, -45, 0.5, 45)
		EnterKey.Active = true
		EnterKey.BorderSizePixel = 0
		EnterKey.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		EnterKey.Parent = Left

		local Title1 = Instance.new("TextLabel")
		Title1.Name = "Title"
		Title1.AnchorPoint = Vector2.new(0.5, 0.5)
		Title1.Size = UDim2.new(1, 0, 0, 25)
		Title1.Selectable = true
		Title1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title1.BackgroundTransparency = 1
		Title1.Position = UDim2.new(0.5, 0, 0.5, 0)
		Title1.Active = true
		Title1.BorderSizePixel = 0
		Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title1.FontSize = Enum.FontSize.Size14
		Title1.TextSize = 13
		Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title1.Text = "Enter Key"
		Title1.Font = Enum.Font.Gotham
		Title1.Parent = EnterKey

		local UICorner1 = Instance.new("UICorner")
		UICorner1.CornerRadius = UDim.new(0, 4)
		UICorner1.Parent = EnterKey

		local GetKey = Instance.new("Frame")
		GetKey.Name = "GetKey"
		GetKey.AnchorPoint = Vector2.new(0.5, 0.5)
		GetKey.Size = UDim2.new(0, 80, 0, 25)
		GetKey.Selectable = true
		GetKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
		GetKey.Position = UDim2.new(0.5, 45, 0.5, 45)
		GetKey.Active = true
		GetKey.BorderSizePixel = 0
		GetKey.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		GetKey.Parent = Left

		local Title2 = Instance.new("TextLabel")
		Title2.Name = "Title"
		Title2.AnchorPoint = Vector2.new(0.5, 0.5)
		Title2.Size = UDim2.new(1, 0, 0, 25)
		Title2.Selectable = true
		Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title2.BackgroundTransparency = 1
		Title2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Title2.Active = true
		Title2.BorderSizePixel = 0
		Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title2.FontSize = Enum.FontSize.Size14
		Title2.TextSize = 13
		Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title2.Text = "Get Key"
		Title2.Font = Enum.Font.Gotham
		Title2.Parent = GetKey

		local UICorner2 = Instance.new("UICorner")
		UICorner2.CornerRadius = UDim.new(0, 4)
		UICorner2.Parent = GetKey
		
		Library:Tween(KeySystem, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0)})
		
		Library:OnClick(EnterKey, function()
			if table.find(Options.KeySystem.Keys, Keyinput.Text) then
				Library:Tween(KeySystem, 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 1, 40)})
				wait(0.5)
				KeySystem:Destroy()
				IsCorrectKey = true
			else
				spawn(function()
					local ShakeIntensity = 10
					for Repeat = 1, 5 do
						local RandomX, RandomY = math.random(-ShakeIntensity, ShakeIntensity), math.random(-ShakeIntensity, ShakeIntensity)
						
						Library:Tween(KeySystem, 0.02, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {Position = UDim2.new(0.5, RandomX, 0.5, RandomY)}).Completed:Wait()
					end
					
					Library:Tween(KeySystem, 0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, {Position = UDim2.new(0.5, 0, 0.5, 0)})
				end)
				
				Library:Tween(Keyinput, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {TextColor3 = Color3.fromRGB(255, 10, 10)})
				wait(0.25)
				Library:Tween(Keyinput, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {TextColor3 = Color3.fromRGB(255, 255, 255)})
			end
		end)
	end
	
	repeat task.wait() until IsCorrectKey

	local LoadFunctions = {}
	
	function LoadFunctions:Window(Options)
		local Options = Options or {}
		Options.Title = Options.Title or "Untitled"
		Options.Description = Options.Description or "No description."

		Options.User = Options.User or {
			Username = game.Players.LocalPlayer.Name,
			Membership = "Skidder"
		}

		local Main = Instance.new("Frame")
		Main.Name = "Main"
		Main.Active = true
		Main.AnchorPoint = Vector2.new(0, 0.5)
		Main.Size = UDim2.new(0, 650, 0, 500)
		Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main.Position = UDim2.new(1, 40, 0.5, 0)
		Main.BorderSizePixel = 0
		Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Main.Parent = NamelessWindow
		
		Library:Tween(Main, 0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5)})

		local IsDragging = false
		
		Library.Mouse.Move:Connect(function()
			if IsDragging then
				Library:Tween(Main, 0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Position = UDim2.new(0, Library.Mouse.X - Main.Parent.AbsolutePosition.X, 0, Library.Mouse.Y - Main.Parent.AbsolutePosition.Y)})
			end
		end)

		local Left = Instance.new("Frame")
		Left.Name = "Left"
		Left.Size = UDim2.new(0, 200, 1, 0)
		Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Left.BorderSizePixel = 0
		Left.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		Left.Parent = Main
		
		Left.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Main.AnchorPoint = Vector2.new((Library.Mouse.X - Main.AbsolutePosition.X) / Main.AbsoluteSize.X, (Library.Mouse.Y - Main.AbsolutePosition.Y) / Main.AbsoluteSize.Y)
				Main.Position = UDim2.new(0, Library.Mouse.X - Main.Parent.AbsolutePosition.X, 0, Library.Mouse.Y - Main.Parent.AbsolutePosition.Y)
				IsDragging = true
			end
		end)

		Left.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				IsDragging = false
			end
		end)

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.ZIndex = 2
		Title.AutomaticSize = Enum.AutomaticSize.Y
		Title.Size = UDim2.new(1, -15, 0, 0)
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 15, 0, 15)
		Title.BorderSizePixel = 0
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.FontSize = Enum.FontSize.Size18
		Title.TextSize = 15
		Title.TextColor3 = Theme.TextColor
		Title.Text = Options.Title
		Title.Font = Enum.Font.GothamBold
		Title.TextXAlignment = Enum.TextXAlignment.Left
		Title.Parent = Left

		local Subtitle = Instance.new("TextLabel")
		Subtitle.Name = "Subtitle"
		Subtitle.ZIndex = 2
		Subtitle.AutomaticSize = Enum.AutomaticSize.Y
		Subtitle.Size = UDim2.new(1, -15, 0, 0)
		Subtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Subtitle.BackgroundTransparency = 1
		Subtitle.Position = UDim2.new(0, 15, 0, 32)
		Subtitle.BorderSizePixel = 0
		Subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Subtitle.FontSize = Enum.FontSize.Size12
		Subtitle.TextSize = 12
		Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		Subtitle.Text = Options.Description
		Subtitle.Font = Enum.Font.Gotham
		Subtitle.TextTransparency = 0.5
		Subtitle.TextXAlignment = Enum.TextXAlignment.Left
		Subtitle.Parent = Left

		local TabButtonContainer = Instance.new("Frame")
		TabButtonContainer.Name = "TabButtonContainer"
		TabButtonContainer.ZIndex = 2
		TabButtonContainer.Size = UDim2.new(1, 0, 1, -50)
		TabButtonContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButtonContainer.BackgroundTransparency = 1
		TabButtonContainer.Position = UDim2.new(0, 0, 0, 50)
		TabButtonContainer.BorderSizePixel = 0
		TabButtonContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButtonContainer.Parent = Left

		local Local = Instance.new("Frame")
		Local.Name = "Local"
		Local.ZIndex = 2
		Local.AnchorPoint = Vector2.new(0.5, 1)
		Local.Size = UDim2.new(1, 0, 0, 50)
		Local.ClipsDescendants = true
		Local.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Local.Position = UDim2.new(0.5, 0, 1, 0)
		Local.BorderSizePixel = 0
		Local.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Local.Parent = TabButtonContainer

		local User = Instance.new("TextLabel")
		User.Name = "User"
		User.ZIndex = 2
		User.Size = UDim2.new(0, 200, 0, 15)
		User.BorderColor3 = Color3.fromRGB(0, 0, 0)
		User.BackgroundTransparency = 1
		User.Position = UDim2.new(0, 0, 0, 10)
		User.BorderSizePixel = 0
		User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		User.FontSize = Enum.FontSize.Size18
		User.TextSize = 15
		User.TextColor3 = Color3.fromRGB(255, 255, 255)
		User.Text = Options.User.Username
		User.Font = Enum.Font.GothamMedium
		User.TextXAlignment = Enum.TextXAlignment.Left
		User.Parent = Local

		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingLeft = UDim.new(0, 10)
		UIPadding.Parent = User

		local Membership = Instance.new("TextLabel")
		Membership.Name = "Membership"
		Membership.ZIndex = 2
		Membership.Size = UDim2.new(0, 200, 0, 15)
		Membership.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Membership.BackgroundTransparency = 1
		Membership.Position = UDim2.new(0, 0, 0, 22)
		Membership.BorderSizePixel = 0
		Membership.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Membership.FontSize = Enum.FontSize.Size12
		Membership.TextSize = 12
		Membership.TextColor3 = Color3.fromRGB(255, 255, 255)
		Membership.Text = Options.User.Membership
		Membership.Font = Enum.Font.Gotham
		Membership.TextTransparency = 0.5
		Membership.TextXAlignment = Enum.TextXAlignment.Left
		Membership.Parent = Local

		local UIPadding1 = Instance.new("UIPadding")
		UIPadding1.PaddingLeft = UDim.new(0, 10)
		UIPadding1.Parent = Membership

		local Scroller = Instance.new("ScrollingFrame")
		Scroller.Name = "Scroller"
		Scroller.ZIndex = 2
		Scroller.AnchorPoint = Vector2.new(0.5, 1)
		Scroller.Size = UDim2.new(1, -10, 1, -60)
		Scroller.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Scroller.BackgroundTransparency = 1
		Scroller.Position = UDim2.new(0.5, 0, 1, -50)
		Scroller.Active = true
		Scroller.BorderSizePixel = 0
		Scroller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Scroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
		Scroller.CanvasSize = UDim2.new(0, 0, 0, 0)
		Scroller.MidImage = "rbxassetid://14622773757"
		Scroller.ScrollBarThickness = 2
		Scroller.Parent = TabButtonContainer

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Parent = Scroller

		local Right = Instance.new("Frame")
		Right.Name = "Right"
		Right.AnchorPoint = Vector2.new(1, 0.5)
		Right.Size = UDim2.new(1, -200, 1, 0)
		Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Right.BackgroundTransparency = 1
		Right.Position = UDim2.new(1, 0, 0.5, 0)
		Right.BorderSizePixel = 0
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.Parent = Main

		local TabContainer = Instance.new("Frame")
		TabContainer.Name = "TabContainer"
		TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
		TabContainer.Size = UDim2.new(1, 0, 1, 0)
		TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabContainer.BackgroundTransparency = 1
		TabContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabContainer.BorderSizePixel = 0
		TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContainer.ClipsDescendants = true
		TabContainer.Parent = Right

		local Shadow = Instance.new("ImageLabel")
		Shadow.Name = "Shadow"
		Shadow.ZIndex = 0
		Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
		Shadow.Size = UDim2.new(1, 47, 1, 47)
		Shadow.BackgroundTransparency = 1
		Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		Shadow.BorderSizePixel = 0
		Shadow.ScaleType = Enum.ScaleType.Slice
		Shadow.ImageTransparency = 0.5
		Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		Shadow.Image = "rbxassetid://6015897843"
		Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
		Shadow.Parent = Main

		local WindowFunctions = {}
		
		function WindowFunctions:CloseTabs(Except)
			for _, Child in pairs(Scroller:GetChildren()) do
				if Child:IsA("Frame") and Child.Name:sub(1, 10) == "TabButton_" and Child ~= Except and TabContainer:FindFirstChild("Tab_" .. Child.Name:sub(11, #Child.Name)) then
					local Tab = TabContainer:FindFirstChild("Tab_" .. Child.Name:sub(11, #Child.Name))

					Library:Tweens({
						{Child.Title, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {TextTransparency = 0.5}},
						{Child.Image, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {ImageTransparency = 0.5}},
						{Tab, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Position = UDim2.new(0, 0, 1, 0)}}
					})
				end
			end
		end

		function WindowFunctions:Tab(Options)
			local Options = Options or {}
			Options.Title = Options.Title or "???"
			Options.Description = Options.Description or "???"
			Options.Image = Options.Image or "rbxassetid://10723365987"

			local TabButton = Instance.new("Frame")
			TabButton.Name = "TabButton_" .. Options.Title
			TabButton.ZIndex = 2
			TabButton.Size = UDim2.new(1, 0, 0, 30)
			TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabButton.BackgroundTransparency = 1
			TabButton.BorderSizePixel = 0
			TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabButton.Parent = Scroller

			local Image = Instance.new("ImageLabel")
			Image.Name = "Image"
			Image.ZIndex = 2
			Image.AnchorPoint = Vector2.new(0, 0.5)
			Image.Size = UDim2.new(0, 15, 0, 15)
			Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Image.BackgroundTransparency = 1
			Image.Position = UDim2.new(0, 15, 0.5, 0)
			Image.BorderSizePixel = 0
			Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Image.ImageTransparency = 0.5
			Image.Image = Options.Image
			Image.Parent = TabButton

			local Title = Instance.new("TextLabel")
			Title.Name = "Title"
			Title.ZIndex = 2
			Title.AnchorPoint = Vector2.new(1, 0.5)
			Title.Size = UDim2.new(1, -35, 0, 20)
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BackgroundTransparency = 1
			Title.Position = UDim2.new(1, 0, 0.5, 0)
			Title.BorderSizePixel = 0
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.FontSize = Enum.FontSize.Size14
			Title.TextSize = 13
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.Text = Options.Title
			Title.Font = Enum.Font.Gotham
			Title.TextTransparency = 0.5
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Parent = TabButton

			-- Tab > RightContainer
			local Tab = Instance.new("Frame")
			Tab.Name = "Tab_" .. Options.Title
			Tab.Position = UDim2.new(0, 0, -1, 0)
			Tab.Size = UDim2.new(1, 0, 1, 0)
			Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Tab.BackgroundTransparency = 1
			Tab.BorderSizePixel = 0
			Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Tab.Parent = TabContainer

			local Header = Instance.new("Frame")
			Header.Name = "Header"
			Header.Size = UDim2.new(1, 0, 0, 50)
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Header.BackgroundTransparency = 1
			Header.BorderSizePixel = 0
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Header.Parent = Tab

			local Searchbox = Instance.new("TextBox")
			Searchbox.Name = "Searchbox"
			Searchbox.AnchorPoint = Vector2.new(1, 0.5)
			Searchbox.AutomaticSize = Enum.AutomaticSize.X
			Searchbox.Size = UDim2.new(0, 0, 0, 25)
			Searchbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Searchbox.Position = UDim2.new(1, -10, 0.5, 0)
			Searchbox.BorderSizePixel = 0
			Searchbox.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			Searchbox.FontSize = Enum.FontSize.Size12
			Searchbox.PlaceholderColor3 = Color3.fromRGB(127, 127, 127)
			Searchbox.TextSize = 12
			Searchbox.TextTransparency = 0.5
			Searchbox.TextColor3 = Color3.fromRGB(255, 255, 255)
			Searchbox.PlaceholderText = "Search"
			Searchbox.Text = ""
			Searchbox.Font = Enum.Font.Gotham
			Searchbox.Parent = Header

			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingRight = UDim.new(0, 20)
			UIPadding.Parent = Searchbox

			local Icon = Instance.new("ImageLabel")
			Icon.Name = "Icon"
			Icon.AnchorPoint = Vector2.new(1, 0.5)
			Icon.Size = UDim2.new(0, 12, 0, 12)
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BackgroundTransparency = 1
			Icon.Position = UDim2.new(1, 15, 0.5, 0)
			Icon.BorderSizePixel = 0
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon.Image = "rbxassetid://7072721559"
			Icon.Parent = Searchbox

			local UIStroke = Instance.new("UIStroke")
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Thickness = 1
			UIStroke.Color = Color3.fromRGB(45, 45, 45)
			UIStroke.Parent = Searchbox

			local TabSubtitle = Instance.new("TextLabel")
			TabSubtitle.Name = "Subtitle"
			TabSubtitle.AutomaticSize = Enum.AutomaticSize.Y
			TabSubtitle.Size = UDim2.new(1, -15, 0, 0)
			TabSubtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabSubtitle.BackgroundTransparency = 1
			TabSubtitle.Position = UDim2.new(0, 15, 0, 32)
			TabSubtitle.BorderSizePixel = 0
			TabSubtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabSubtitle.FontSize = Enum.FontSize.Size12
			TabSubtitle.TextSize = 12
			TabSubtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			TabSubtitle.Text = Options.Description
			TabSubtitle.Font = Enum.Font.Gotham
			TabSubtitle.TextTransparency = 0.5
			TabSubtitle.TextXAlignment = Enum.TextXAlignment.Left
			TabSubtitle.Parent = Header

			local TabTitle = Instance.new("TextLabel")
			TabTitle.Name = "Title"
			TabTitle.AutomaticSize = Enum.AutomaticSize.Y
			TabTitle.Size = UDim2.new(1, -15, 0, 0)
			TabTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabTitle.BackgroundTransparency = 1
			TabTitle.Position = UDim2.new(0, 15, 0, 15)
			TabTitle.BorderSizePixel = 0
			TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabTitle.FontSize = Enum.FontSize.Size18
			TabTitle.TextSize = 15
			TabTitle.TextColor3 = Theme.TextColor
			TabTitle.Text = Options.Title
			TabTitle.Font = Enum.Font.GothamBold
			TabTitle.TextXAlignment = Enum.TextXAlignment.Left
			TabTitle.Parent = Header

			local In = Instance.new("ScrollingFrame")
			In.Name = "In"
			In.Size = UDim2.new(1, 0, 1, -50)
			In.Selectable = false
			In.BorderColor3 = Color3.fromRGB(0, 0, 0)
			In.BackgroundTransparency = 1
			In.Position = UDim2.new(0, 0, 0, 50)
			In.BorderSizePixel = 0
			In.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			In.AutomaticCanvasSize = Enum.AutomaticSize.Y
			In.CanvasSize = UDim2.new(0, 0, 0, 0)
			In.ScrollBarImageTransparency = 1
			In.ScrollBarThickness = 0
			In.Parent = Tab

			local UIPadding1 = Instance.new("UIPadding")
			UIPadding1.PaddingTop = UDim.new(0, 5)
			UIPadding1.PaddingBottom = UDim.new(0, 5)
			UIPadding1.PaddingLeft = UDim.new(0, 5)
			UIPadding1.PaddingRight = UDim.new(0, 5)
			UIPadding1.Parent = In

			local Left = Instance.new("Frame")
			Left.Name = "Left"
			Left.AutomaticSize = Enum.AutomaticSize.Y
			Left.Size = UDim2.new(0.5, -5, 0, 0)
			Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Left.BackgroundTransparency = 1
			Left.BorderSizePixel = 0
			Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Left.Parent = In

			local UIPadding2 = Instance.new("UIPadding")
			UIPadding2.PaddingBottom = UDim.new(0, 5)
			UIPadding2.PaddingLeft = UDim.new(0, 5)
			UIPadding2.PaddingRight = UDim.new(0, 5)
			UIPadding2.Parent = Left

			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 8)
			UIListLayout.Parent = Left

			local Right = Instance.new("Frame")
			Right.Name = "Right"
			Right.AnchorPoint = Vector2.new(1, 0)
			Right.AutomaticSize = Enum.AutomaticSize.Y
			Right.Size = UDim2.new(0.5, -5, 0, 0)
			Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Right.BackgroundTransparency = 1
			Right.Position = UDim2.new(1, 0, 0, 0)
			Right.BorderSizePixel = 0
			Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Right.Parent = In

			local UIPadding3 = Instance.new("UIPadding")
			UIPadding3.PaddingBottom = UDim.new(0, 5)
			UIPadding3.PaddingLeft = UDim.new(0, 5)
			UIPadding3.PaddingRight = UDim.new(0, 5)
			UIPadding3.Parent = Right

			local UIListLayout1 = Instance.new("UIListLayout")
			UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout1.Padding = UDim.new(0, 8)
			UIListLayout1.Parent = Right

			-- Functions
			
			local Sections = {}
			
			local function GetSectionsVisible(Side)
				local Count = 0
				
				for _, CurrentSection in pairs(Side:GetChildren()) do
					if CurrentSection:IsA("Frame") and CurrentSection.Visible then
						Count = Count + 1
					end
				end
				
				return Count
			end
			
			local function GetSectionsIncluding(Text)
				local Results = 0
				
				for _, CurrentSection in pairs(Sections) do
					if _:sub(1, #Text) == Text:sub(1, #Text) then
						CurrentSection[1].Visible = true
					else
						CurrentSection[1].Visible = false
					end
				end
			end
			
			Searchbox.Focused:Connect(function()
				Library:Tween(UIStroke, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Color = Theme.ImageColor})
			end)
			
			Searchbox.FocusLost:Connect(function()
				Library:Tween(UIStroke, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Color = Color3.fromRGB(45, 45, 45)})
			end)
			
			Searchbox:GetPropertyChangedSignal("Text"):Connect(function()
				GetSectionsIncluding(Searchbox.Text)
			end)

			Library:OnClick(TabButton, function()
				if Library.LastTab ~= Tab then
					WindowFunctions:CloseTabs(TabButton)
					
					Tab.Position = UDim2.new(-1, 0, 0, 0)
					
					Library:Tweens({
						{Title, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {TextTransparency = 0}},
						{Image, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {ImageTransparency = 0}},
						{Tab, 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Position = UDim2.new(0, 0, 0, 0)}}
					})
					
					Library.LastTab = Tab
				end
			end)
			
			local TabFunctions = {}
			
			function TabFunctions:Section(Options)
				local Options = Options or {}
				Options.Title = Options.Title or "Section"
				Options.Side = Options.Side == 2 and Right or Left
				
				local Section = Instance.new("Frame")
				Section.Name = "Section_" .. Options.Title
				Section.AutomaticSize = Enum.AutomaticSize.None
				Section.Size = UDim2.new(1, 0, 0, 30)
				Section.ClipsDescendants = true
				Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Section.BorderSizePixel = 0
				Section.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				Section.Parent = Options.Side
				
				local UIStroke = Instance.new("UIStroke")
				UIStroke.Thickness = 1
				UIStroke.Color = Color3.fromRGB(45, 45, 45)
				UIStroke.Parent = Section

				local Title = Instance.new("TextLabel")
				Title.Name = "Title"
				Title.AutomaticSize = Enum.AutomaticSize.Y
				Title.Size = UDim2.new(1, -15, 0, 0)
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BackgroundTransparency = 1
				Title.Position = UDim2.new(0, 0, 0, 10)
				Title.BorderSizePixel = 0
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.FontSize = Enum.FontSize.Size12
				Title.TextSize = 12
				Title.TextColor3 = Theme.TextColor
				Title.Text = Options.Title
				Title.Font = Enum.Font.GothamBold
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.Parent = Section

				local Container = Instance.new("Frame")
				Container.Name = "Container"
				Container.AutomaticSize = Enum.AutomaticSize.Y
				Container.Size = UDim2.new(1, 0, 0, 0)
				Container.ClipsDescendants = false
				Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Container.BackgroundTransparency = 1
				Container.Position = UDim2.new(0, 0, 0, 30)
				Container.BorderSizePixel = 0
				Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Container.Parent = Section

				local UIListLayout = Instance.new("UIListLayout")
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)
				UIListLayout.Parent = Container

				local UIPadding = Instance.new("UIPadding")
				UIPadding.PaddingBottom = UDim.new(0, 10)
				UIPadding.PaddingLeft = UDim.new(0, 10)
				UIPadding.PaddingRight = UDim.new(0, 10)
				UIPadding.Parent = Section

				local Dock = Instance.new("Frame")
				Dock.Name = "Dock"
				Dock.AnchorPoint = Vector2.new(1, 0)
				Dock.Size = UDim2.new(0, 30, 0, 30)
				Dock.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dock.BackgroundTransparency = 1
				Dock.Position = UDim2.new(1, 10, 0, 0)
				Dock.BorderSizePixel = 0
				Dock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dock.Parent = Section

				local Icon = Instance.new("ImageLabel")
				Icon.Name = "Icon"
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.Size = UDim2.new(1, -15, 1, -15)
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BackgroundTransparency = 1
				Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon.BorderSizePixel = 0
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.Image = "rbxassetid://7072720870"
				Icon.Parent = Dock
				
				Library:OnClick(Dock, function()
					if Icon.Rotation == 0 then
						Section.ClipsDescendants = false
						Section.AutomaticSize = Enum.AutomaticSize.Y
						Library:Tween(Icon, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 135, ImageColor3 = Theme.ImageColor})
					elseif Icon.Rotation == 135 then
						Section.ClipsDescendants = true
						Section.AutomaticSize = Enum.AutomaticSize.None
						Library:Tween(Icon, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 0, ImageColor3 = Color3.fromRGB(255, 255, 255)})
					end
				end)
				
				Sections[Options.Title] = {Section, Section.Parent}
				
				local SectionFunctions = {}
				
				function SectionFunctions:Label(Options)
					local Options = Options or {}
					Options.Text = Options.Text or "Label"
					
					local Label = Instance.new("TextLabel")
					Label.Name = "Label_" .. Options.Text
					Label.Size = UDim2.new(1, 0, 0, 15)
					Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Label.BackgroundTransparency = 1
					Label.BorderSizePixel = 0
					Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Label.FontSize = Enum.FontSize.Size12
					Label.TextSize = 12
					Label.TextColor3 = Color3.fromRGB(255, 255, 255)
					Label.Text = Options.Text
					Label.Font = Enum.Font.Gotham
					Label.TextTransparency = 0.5
					Label.TextXAlignment = Enum.TextXAlignment.Left
					Label.Parent = Container
				end
				
				function SectionFunctions:Button(Options)
					local Options = Options or {}
					Options.Text = Options.Text or "Button"
					Options.Callback = Options.Callback or function() end
					
					local Button = Instance.new("Frame")
					Button.Name = "Button_" .. Options.Text
					Button.ZIndex = 3
					Button.Size = UDim2.new(1, 0, 0, 20)
					Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button.BackgroundTransparency = 1
					Button.BorderSizePixel = 0
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.ClipsDescendants = true
					Button.Parent = Container

					local Title = Instance.new("TextLabel")
					Title.Name = "Title"
					Title.AnchorPoint = Vector2.new(0, 0.5)
					Title.Size = UDim2.new(0, 200, 0, 12)
					Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 0, 0.5, 0)
					Title.BorderSizePixel = 0
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.FontSize = Enum.FontSize.Size12
					Title.TextSize = 12
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.Text = "Button"
					Title.Font = Enum.Font.Gotham
					Title.TextTransparency = 0.5
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.Parent = Button

					local Icon = Instance.new("ImageLabel")
					Icon.Name = "Icon"
					Icon.AnchorPoint = Vector2.new(1, 0.5)
					Icon.Size = UDim2.new(0, 15, 0, 15)
					Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Icon.BackgroundTransparency = 1
					Icon.Position = UDim2.new(1, 0, 0.5, 0)
					Icon.BorderSizePixel = 0
					Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Icon.Image = "rbxassetid://10723375250"
					Icon.ImageColor3 = Theme.ImageColor
					Icon.Parent = Button
					
					local Circle = Instance.new("Frame")
					Circle.Name = "CircleEffectWave"
					Circle.BackgroundColor3 = Theme.ImageColor
					Circle.BorderSizePixel = 0
					Circle.Size = UDim2.fromOffset(0, 0)
					Circle.Visible = false
					Circle.Parent = Button
					
					local CircleCorner = Instance.new("UICorner")
					CircleCorner.CornerRadius = UDim.new(1, 0)
					CircleCorner.Parent = Circle
					
					Library:OnClick(Button, function()
						Options.Callback()
						
						if Circle.Visible == false then
							Circle.Visible = true
							Circle.Size = UDim2.new(0, 0, 0, 0)
							Circle.Position = UDim2.new(0, 0, 0.5, 0)
							Circle.BackgroundTransparency = .5
							
							Library:Tween(Circle, 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 500)})
							wait(0.5)
							Circle.Visible = false
						end
					end)
				end
				
				function SectionFunctions:Checkbox(Options)
					local Options = Options or {}
					Options.Text = Options.Text or "Checkbox"
					Options.Default = Options.Default or false
					Options.Callback = Options.Callback or function() end
					
					local Checkbox = Instance.new("Frame")
					Checkbox.Name = "Checkbox"
					Checkbox.Size = UDim2.new(1, 0, 0, 20)
					Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Checkbox.BackgroundTransparency = 1
					Checkbox.BorderSizePixel = 0
					Checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Checkbox.Parent = Container

					local Title = Instance.new("TextLabel")
					Title.Name = "Title"
					Title.AnchorPoint = Vector2.new(0, 0.5)
					Title.Size = UDim2.new(0, 200, 0, 12)
					Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 0, 0.5, 0)
					Title.BorderSizePixel = 0
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.FontSize = Enum.FontSize.Size12
					Title.TextSize = 12
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.Text = Options.Text
					Title.Font = Enum.Font.Gotham
					Title.TextTransparency = 0.5
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.Parent = Checkbox

					local Box = Instance.new("Frame")
					Box.Name = "Box"
					Box.AnchorPoint = Vector2.new(1, 0.5)
					Box.Size = UDim2.new(0, 15, 0, 20)
					Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Box.BackgroundTransparency = 1
					Box.Position = UDim2.new(1, 0, 0.5, 0)
					Box.BorderSizePixel = 0
					Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Box.Parent = Checkbox

					local Check = Instance.new("ImageLabel")
					Check.Name = "Check"
					Check.AnchorPoint = Vector2.new(0.5, 0.5)
					Check.Size = UDim2.new(0, 15, 0, 15)
					Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Check.BackgroundTransparency = 1
					Check.Position = UDim2.new(0.5, 0, 0.5, 0)
					Check.BorderSizePixel = 0
					Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Check.ImageTransparency = Options.Default == false and 1 or 0
					Check.Image = "rbxassetid://7072706576"
					Check.ImageColor3 = Theme.ImageColor
					Check.Parent = Box

					local Uncheck = Instance.new("ImageLabel")
					Uncheck.Name = "Uncheck"
					Uncheck.AnchorPoint = Vector2.new(0.5, 0.5)
					Uncheck.Size = UDim2.new(0, 15, 0, 15)
					Uncheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Uncheck.BackgroundTransparency = 1
					Uncheck.Position = UDim2.new(0.5, 0, 0.5, 0)
					Uncheck.BorderSizePixel = 0
					Uncheck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Uncheck.Image = "rbxassetid://7072722963"
					Uncheck.ImageTransparency = Options.Default == true and 1 or 0
					Uncheck.Parent = Box
					
					Library:OnClick(Checkbox, function()
						Options.Callback(Check.ImageTransparency == 1 and true or false)
						
						if Check.ImageTransparency == 1 then
							Library:Tweens({
								{Check, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {ImageTransparency = 0}},
								{Uncheck, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {ImageTransparency = 1}}
							})
						elseif Check.ImageTransparency == 0 then
							Library:Tweens({
								{Check, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {ImageTransparency = 1}},
								{Uncheck, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {ImageTransparency = 0}}
							})
						end
					end)
					
					local CheckboxFunctions = {}
					
					function CheckboxFunctions:SetValue(Value)
						local BooleanValue = Value
						local Value = Value == true and 0 or 1
						
						Check.ImageTransparency = Value
						Uncheck.ImageTransparency = not Check.ImageTransparency
						
						Options.Callback(BooleanValue)
					end
					
					return CheckboxFunctions
				end
				
				function SectionFunctions:Slider(Options)
					local Options = Options or {}
					Options.Text = Options.Text or "Slider"
					Options.Default = Options.Default or 0
					Options.Minimum = Options.Minimum or -100
					Options.Maximum = Options.Maximum or 100
					Options.Callback = Options.Callback or function() end
					
					local Slider = Instance.new("Frame")
					Slider.Name = "Slider"
					Slider.Size = UDim2.new(1, 0, 0, 20)
					Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Slider.BackgroundTransparency = 1
					Slider.BorderSizePixel = 0
					Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Slider.Parent = Container

					local Title = Instance.new("TextLabel")
					Title.Name = "Title"
					Title.AnchorPoint = Vector2.new(0, 0.5)
					Title.Size = UDim2.new(1, 0, 0, 12)
					Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 0, 0.5, 0)
					Title.BorderSizePixel = 0
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.FontSize = Enum.FontSize.Size12
					Title.TextSize = 12
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.Text = Options.Text
					Title.Font = Enum.Font.Gotham
					Title.TextTransparency = 0.5
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.Parent = Slider

					local InnerBar = Instance.new("Frame")
					InnerBar.Name = "InnerBar"
					InnerBar.AnchorPoint = Vector2.new(1, 0.5)
					InnerBar.Size = UDim2.new(0.4, 0, 0, 5)
					InnerBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
					InnerBar.Position = UDim2.new(1, -45, 0.5, 0)
					InnerBar.BorderSizePixel = 0
					InnerBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					InnerBar.Parent = Slider

					local Outer = Instance.new("Frame")
					Outer.Name = "Outer"
					Outer.Size = UDim2.new(((Options.Default or Options.Minimum) - Options.Minimum) / (Options.Maximum - Options.Minimum), 0, 1, 0)
					Outer.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Outer.BorderSizePixel = 0
					Outer.BackgroundColor3 = Theme.ImageColor
					Outer.Parent = InnerBar

					local Circle = Instance.new("Frame")
					Circle.Name = "Circle"
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.Size = UDim2.new(0, 10, 0, 10)
					Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Circle.Position = UDim2.new(1, 0, 0.5, 0)
					Circle.BorderSizePixel = 0
					Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Circle.Parent = Outer

					local UICorner = Instance.new("UICorner")
					UICorner.CornerRadius = UDim.new(1, 0)
					UICorner.Parent = Circle

					local UICorner1 = Instance.new("UICorner")
					UICorner1.CornerRadius = UDim.new(1, 0)
					UICorner1.Parent = Outer

					local UICorner2 = Instance.new("UICorner")
					UICorner2.CornerRadius = UDim.new(1, 0)
					UICorner2.Parent = InnerBar

					local Inputfield = Instance.new("TextBox")
					Inputfield.Name = "Inputfield"
					Inputfield.AnchorPoint = Vector2.new(1, 0.5)
					Inputfield.Size = UDim2.new(0, 30, 1, -5)
					Inputfield.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Inputfield.Position = UDim2.new(1, -1, 0.5, 0)
					Inputfield.BorderSizePixel = 0
					Inputfield.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Inputfield.FontSize = Enum.FontSize.Size11
					Inputfield.TextWrapped = true
					Inputfield.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
					Inputfield.TextWrap = true
					Inputfield.TextSize = 11
					Inputfield.TextTruncate = Enum.TextTruncate.AtEnd
					Inputfield.TextTransparency = 0.5
					Inputfield.TextColor3 = Color3.fromRGB(255, 255, 255)
					Inputfield.PlaceholderText = "..."
					Inputfield.Text = Options.Default
					Inputfield.Font = Enum.Font.Gotham
					Inputfield.Parent = Slider

					local UIStroke = Instance.new("UIStroke")
					UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke.Color = Color3.fromRGB(45, 45, 45)
					UIStroke.Parent = Inputfield
					
					local IsSliding = false
					
					local function Slide()
						local XValue = (Library.Mouse.X - Outer.AbsolutePosition.X) / InnerBar.AbsoluteSize.X
						XValue = math.clamp(XValue, 0, 1)

						Library:Tween(Outer, 0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Size = UDim2.new(XValue, 0, 1, 0)})

						local InputText = ((XValue * Options.Maximum) / Options.Maximum) * (Options.Maximum - Options.Minimum) + Options.Minimum

						Inputfield.Text = math.floor(InputText)
						
						Options.Callback(tonumber(Inputfield.Text))
					end
					
					Options.Callback(Options.Default)
					
					Inputfield.FocusLost:Connect(function()
						if tonumber(Inputfield.Text) then
							local XValue = (
								(tonumber(Inputfield.Text) or Options.Minimum) - Options.Minimum
							) / (Options.Maximum - Options.Minimum)
							
							Outer.Size = UDim2.new(
								math.clamp(XValue, 0, 1), 
								0, 
								1, 
								0
							)
							
							Inputfield.Text = math.clamp(tonumber(Inputfield.Text), Options.Minimum, Options.Maximum)
						else
							local XValue = (
								(tonumber(Options.Default) or Options.Minimum) - Options.Minimum
							) / (Options.Maximum - Options.Minimum)

							Outer.Size = UDim2.new(
								math.clamp(XValue, 0, 1), 
								0, 
								1, 
								0
							)
							
							Inputfield.Text = Options.Default
						end
						
						Options.Callback(tonumber(Inputfield.Text))
					end)
					
					InnerBar.InputBegan:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then
							IsSliding = true
							Slide()
						end
					end)
					
					InnerBar.InputEnded:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then
							IsSliding = false
						end
					end)
					
					Library.Mouse.Move:Connect(function()
						if IsSliding then
							Slide()
						end
					end)
					
					local SliderFunctions = {}
					
					function SliderFunctions:SetValue(Value)
						Inputfield:CaptureFocus()
						Inputfield.Text = Value
						Inputfield:ReleaseFocus()
					end
					
					return SliderFunctions
				end
				
				function SectionFunctions:Dropdown(Options)
					local Options = Options or {}
					Options.Text = Options.Text or "Dropdown"
					Options.List = Options.List or {}
					Options.Default = Options.Default or 1
					Options.Callback = Options.Callback or function() end
					
					local Dropdown = Instance.new("Frame")
					Dropdown.Name = "Dropdown"
					Dropdown.Size = UDim2.new(1, 0, 0, 20)
					Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Dropdown.BackgroundTransparency = 1
					Dropdown.BorderSizePixel = 0
					Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Dropdown.Parent = Container

					local Title = Instance.new("TextLabel")
					Title.Name = "Title"
					Title.AnchorPoint = Vector2.new(0, 0.5)
					Title.Size = UDim2.new(0, 200, 0, 12)
					Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 0, 0.5, 0)
					Title.BorderSizePixel = 0
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.FontSize = Enum.FontSize.Size12
					Title.TextSize = 12
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.Text = Options.Text
					Title.Font = Enum.Font.Gotham
					Title.TextTransparency = 0.5
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.Parent = Dropdown

					local Box = Instance.new("Frame")
					Box.Name = "Box"
					Box.AnchorPoint = Vector2.new(1, 0.5)
					Box.Size = UDim2.new(0, 15, 0, 20)
					Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Box.BackgroundTransparency = 1
					Box.Position = UDim2.new(1, 0, 0.5, 0)
					Box.BorderSizePixel = 0
					Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Box.Parent = Dropdown

					local Icon = Instance.new("ImageLabel")
					Icon.Name = "Icon"
					Icon.ZIndex = 2
					Icon.AnchorPoint = Vector2.new(0.5, 0.5)
					Icon.Size = UDim2.new(0, 20, 0, 20)
					Icon.BackgroundTransparency = 1
					Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
					Icon.ImageRectOffset = Vector2.new(324, 524)
					Icon.ImageRectSize = Vector2.new(36, 36)
					Icon.Image = "rbxassetid://3926307971"
					Icon.Parent = Box

					local Contents = Instance.new("Frame")
					Contents.Name = "Contents"
					Contents.AnchorPoint = Vector2.new(1, 0)
					Contents.Size = UDim2.new(0.5, 0, 0, 0)
					Contents.ClipsDescendants = true
					Contents.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Contents.Position = UDim2.new(1, 0, 1, 0)
					Contents.BorderSizePixel = 0
					Contents.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					Contents.ZIndex = 1000
					Contents.Parent = Dropdown

					local UIStroke = Instance.new("UIStroke")
					UIStroke.Transparency = 1
					UIStroke.Thickness = 1
					UIStroke.Color = Color3.fromRGB(45, 45, 45)
					UIStroke.Parent = Contents
					
					local UIPadding = Instance.new("UIPadding")
					UIPadding.PaddingLeft = UDim.new(0, 5)
					UIPadding.Parent = Contents

					local UIListLayout = Instance.new("UIListLayout")
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					UIListLayout.Parent = Contents
					
					if Options.List[Options.Default] then
						Options.Callback(Options.List[Options.Default])

						UIStroke.Transparency = 1
						Contents.AutomaticSize = Enum.AutomaticSize.None

						Library:Tween(Icon, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 0})
						
						Title.Text = Options.Text .. " - " .. Options.List[Options.Default]
					end
					
					local ListItem = {}
					
					for _, Index in pairs(Options.List) do
						local Untitled = Instance.new("TextLabel")
						Untitled.Name = Index
						Untitled.Size = UDim2.new(1, 0, 0, 25)
						Untitled.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Untitled.BackgroundTransparency = 1
						Untitled.BorderSizePixel = 0
						Untitled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Untitled.FontSize = Enum.FontSize.Size12
						Untitled.TextSize = 12
						Untitled.TextColor3 = Color3.fromRGB(255, 255, 255)
						Untitled.Font = Enum.Font.Gotham
						Untitled.Text = Index
						Untitled.TextTransparency = 0.5
						Untitled.TextXAlignment = Enum.TextXAlignment.Left
						Untitled.ZIndex = 1000
						Untitled.Parent = Contents
						
						table.insert(ListItem, Untitled)
						
						Library:OnClick(Untitled, function()
							Options.Callback(Index)
							
							UIStroke.Transparency = 1
							Contents.AutomaticSize = Enum.AutomaticSize.None

							Library:Tween(Icon, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 0})
							
							Title.Text = Options.Text .. " - " .. Index
						end)
					end
					
					Library:OnClick(Box, function()
						if Icon.Rotation == 0 then
							UIStroke.Transparency = 0
							Contents.AutomaticSize = Enum.AutomaticSize.Y
							
							Library:Tween(Icon, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 180})
						elseif Icon.Rotation == 180 then
							UIStroke.Transparency = 1
							Contents.AutomaticSize = Enum.AutomaticSize.None
							
							Library:Tween(Icon, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 0})
						end
					end)
					
					local DropdownFunctions = {}
						
					function DropdownFunctions:Refresh(List)
						for _, Item in pairs(ListItem) do
							Item:Destroy()
						end
						
						for _, Index in pairs(List) do
							local Untitled = Instance.new("TextLabel")
							Untitled.Name = Index
							Untitled.Size = UDim2.new(1, 0, 0, 25)
							Untitled.BorderColor3 = Color3.fromRGB(0, 0, 0)
							Untitled.BackgroundTransparency = 1
							Untitled.BorderSizePixel = 0
							Untitled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Untitled.FontSize = Enum.FontSize.Size12
							Untitled.TextSize = 12
							Untitled.TextColor3 = Color3.fromRGB(255, 255, 255)
							Untitled.Font = Enum.Font.Gotham
							Untitled.Text = Index
							Untitled.TextTransparency = 0.5
							Untitled.TextXAlignment = Enum.TextXAlignment.Left
							Untitled.ZIndex = 1000
							Untitled.Parent = Contents

							table.insert(ListItem, Untitled)

							Library:OnClick(Untitled, function()
								Options.Callback(Index)

								UIStroke.Transparency = 1
								Contents.AutomaticSize = Enum.AutomaticSize.None

								Library:Tween(Icon, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Rotation = 0})

								Title.Text = Options.Text .. " - " .. Index
							end)
						end
						
						Title.Text = Options.Text
					end
					
					return DropdownFunctions
				end
				
				function SectionFunctions:InputField(Options)
					local Options = Options or {}
					Options.Text = Options.Text or "InputField"
					Options.Default = Options.Default or ""
					Options.Callback = Options.Callback or function() end
					
					local InputField = Instance.new("Frame")
					InputField.Name = "InputField"
					InputField.Size = UDim2.new(1, 0, 0, 20)
					InputField.BorderColor3 = Color3.fromRGB(0, 0, 0)
					InputField.BackgroundTransparency = 1
					InputField.BorderSizePixel = 0
					InputField.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					InputField.Parent = Container

					local Title = Instance.new("TextLabel")
					Title.Name = "Title"
					Title.AnchorPoint = Vector2.new(0, 0.5)
					Title.Size = UDim2.new(1, 0, 0, 12)
					Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title.BackgroundTransparency = 1
					Title.Position = UDim2.new(0, 0, 0.5, 0)
					Title.BorderSizePixel = 0
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.FontSize = Enum.FontSize.Size12
					Title.TextSize = 12
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.Text = Options.Text
					Title.Font = Enum.Font.Gotham
					Title.TextTransparency = 0.5
					Title.TextXAlignment = Enum.TextXAlignment.Left
					Title.Parent = InputField

					local Box = Instance.new("TextBox")
					Box.Name = "Box"
					Box.AnchorPoint = Vector2.new(1, 0.5)
					Box.AutomaticSize = Enum.AutomaticSize.X
					Box.Size = UDim2.new(0, 30, 1, -5)
					Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Box.Position = UDim2.new(1, -1, 0.5, 0)
					Box.BorderSizePixel = 0
					Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Box.FontSize = Enum.FontSize.Size11
					Box.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
					Box.TextSize = 11
					Box.TextTransparency = 0.5
					Box.TextColor3 = Color3.fromRGB(255, 255, 255)
					Box.PlaceholderText = "..."
					Box.Text = Options.Default
					Box.Font = Enum.Font.Gotham
					Box.Parent = InputField

					local UIStroke = Instance.new("UIStroke")
					UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke.Color = Color3.fromRGB(45, 45, 45)
					UIStroke.Parent = Box

					local UIPadding = Instance.new("UIPadding")
					UIPadding.PaddingLeft = UDim.new(0, 3)
					UIPadding.PaddingRight = UDim.new(0, 3)
					UIPadding.Parent = Box
					
					Box.Focused:Connect(function()
						Library:Tween(UIStroke, 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Color = Theme.ImageColor})
					end)
					
					Box.FocusLost:Connect(function()
						Library:Tween(UIStroke, 0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, {Color = Color3.fromRGB(45, 45, 45)})
						Options.Callback(Box.Text)
					end)
				end
				
				return SectionFunctions
			end
			
			return TabFunctions
		end

		return WindowFunctions
	end
	
	return LoadFunctions
end

return Library
