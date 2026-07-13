local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local playerGui = lp:WaitForChild("PlayerGui")

-- Таблица ответов ИИ
local Responses = {
    ["привет"] = "Привет друг! Я твой ИИ помощник RussNpc.ai. Спрашивай что угодно!",
    ["как дела"] = "У меня всё отлично, готов помогать тебе в игре!",
    ["ты кто"] = "Я RussNpc.ai, твой персональный ИИ-ассистент.",
    ["пока"] = "До встречи! Буду ждать тебя снова."
}

-- Фильтр мата
local BadWords = {"мат1", "мат2", "оскорбление"} 

local function getAIResponse(text)
    local lowerText = string.lower(text)
    for _, word in pairs(BadWords) do
        if string.find(lowerText, word) then
            return "Пожалуйста, общайся вежливее. Я здесь для помощи!"
        end
    end
    return Responses[lowerText] or "Интересный вопрос, я пока не знаю ответа."
end

-- Создание GUI (базовый пример)
local ScreenGui = Instance.new("ScreenGui", playerGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Draggable = true
MainFrame.Active = true

local Input = Instance.new("TextBox", MainFrame)
Input.Size = UDim2.new(0.8, 0, 0.2, 0)
Input.Position = UDim2.new(0.1, 0, 0.2, 0)
Input.PlaceholderText = "Твой вопрос..."

local SendBtn = Instance.new("TextButton", MainFrame)
SendBtn.Size = UDim2.new(0.8, 0, 0.2, 0)
SendBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
SendBtn.Text = "ОТПРАВИТЬ"

SendBtn.MouseButton1Click:Connect(function()
    local answer = getAIResponse(Input.Text)
    -- Отправляем в чат или выводим на экран
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("RussNpc.ai: " .. answer, "All")
    Input.Text = ""
end)
