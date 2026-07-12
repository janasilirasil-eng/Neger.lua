lolocal Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- База знаний ИИ (слова и ответы)
local Responses = {
    ["привет"] = "Привет! Как у тебя дела?",
    ["как дела"] = "У меня всё отлично, я же программа!",
    ["ты кто"] = "Я твой личный ИИ-помощник в Roblox.",
    ["пока"] = "До встречи! Удачи в игре.",
    ["код"] = "Мой код написан на языке Lua."
}

-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 70, 0, 70)
ToggleButton.Position = UDim2.new(0.95, -70, 0.85, -70)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Text = "AI"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 24
ToggleButton.CornerRadius = UDim.new(1, 0)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Visible = false
Frame.Active = true
Frame.Draggable = true

local Input = Instance.new("TextBox", Frame)
Input.Size = UDim2.new(0, 280, 0, 50)
Input.Position = UDim2.new(0, 10, 0, 10)
Input.PlaceholderText = "Спроси меня о чем-нибудь..."
Input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Input.TextColor3 = Color3.fromRGB(255, 255, 255)

local SendBtn = Instance.new("TextButton", Frame)
SendBtn.Size = UDim2.new(0, 280, 0, 50)
SendBtn.Position = UDim2.new(0, 10, 0, 70)
SendBtn.Text = "Отправить вопрос"
SendBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Логика
ToggleButton.MouseButton1Click:Connect(function() Frame.Visible = not Frame.Visible end)

SendBtn.MouseButton1Click:Connect(function()
    local text = string.lower(Input.Text)
    local answer = Responses[text] or "Я пока не знаю ответа на это, но я учусь!"
    
    -- Отправка ответа в чат
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ИИ: " .. answer, "All")
    Input.Text = ""
end)
)

