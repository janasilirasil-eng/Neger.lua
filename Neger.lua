local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 60, 0, 60)
Button.Position = UDim2.new(0.9, 0, 0.8, 0)
Button.Text = "Чат с ИИ"
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 200)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.7, 0, 0.5, 0)
Frame.Visible = false

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0, 180, 0, 40)
TextBox.PlaceholderText = "Напиши вопрос..."

local SendBtn = Instance.new("TextButton", Frame)
SendBtn.Position = UDim2.new(0, 0, 0.5, 0)
SendBtn.Text = "Отправить"

-- Логика нажатия
Button.MouseButton1Click:Connect(function() Frame.Visible = not Frame.Visible end)

SendBtn.MouseButton1Click:Connect(function()
    local text = TextBox.Text
    -- Здесь имитация ответа ИИ
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ИИ: Привет! Я услышал: " .. text, "All")
    TextBox.Text = ""
end)

