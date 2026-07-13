local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local lp = Players.LocalPlayer
local playerGui = lp:WaitForChild("PlayerGui")

-- Таблица ответов
local Responses = {
    ["привет"] = "Привет! Я твой личный ИИ-ассистент.",
    ["как дела"] = "Все отлично, помогаю тебе в Roblox!",
    ["ты кто"] = "Я RussNpc.ai, твой ИИ-помощник.",
    ["пока"] = "Удачи в игре! Заходи еще."
}

-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui", playerGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- Аватарка (Твой WOSH)
local Avatar = Instance.new("ImageLabel", MainFrame)
Avatar.Size = UDim2.new(0, 100, 0, 100)
Avatar.Position = UDim2.new(0.5, -50, 0.05, 0)
Avatar.Image = "rbxassetid://13511110023" -- ID твоего изображения
Avatar.BackgroundTransparency = 1

-- Поле ввода
local Input = Instance.new("TextBox", MainFrame)
Input.Size = UDim2.new(0.8, 0, 0, 50)
Input.Position = UDim2.new(0.1, 0, 0.4, 0)
Input.PlaceholderText = "Введите вопрос..."
Input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Input.TextColor3 = Color3.new(1,1,1)

-- Кнопка отправки
local SendBtn = Instance.new("TextButton", MainFrame)
SendBtn.Size = UDim2.new(0.8, 0, 0, 50)
SendBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
SendBtn.Text = "ОТПРАВИТЬ"
SendBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
SendBtn.TextColor3 = Color3.new(1,1,1)

-- Функция отправки (современный метод TextChatService)
SendBtn.MouseButton1Click:Connect(function()
    local text = string.lower(Input.Text)
    local answer = Responses[text] or "Я пока не знаю ответа на это."
    
    -- Отправка сообщения
    local textChannel = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
    if textChannel then
        textChannel:SendAsync("ИИ: " .. answer)
    else
        print("ИИ ответил: " .. answer) -- Если чат не найден, выведет в консоль F9
    end
    Input.Text = ""
end)
