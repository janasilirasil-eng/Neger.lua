local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local lp = Players.LocalPlayer
local playerGui = lp:WaitForChild("PlayerGui")

-- Функция для включения Fly (полет)
local function enableFly()
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.MaxForce = Vector3.new(100000, 100000, 100000)
        bv.Velocity = Vector3.new(0, 50, 0) -- Летит вверх
        task.wait(2)
        bv:Destroy()
    end
end

-- Основная функция ответов
local function getAIResponse(text)
    local lowerText = string.lower(text)
    
    -- Проверка на команды помощи
    if string.find(lowerText, "natural disaster") or string.find(lowerText, "помоги") then
        enableFly() -- Включаем полет
        return "Помогаю! Включаю режим полета в Natural Disaster!"
    end
    
    -- Обычные вопросы
    if string.find(lowerText, "как дела") then return "Все супер, готов помогать!"
    elseif string.find(lowerText, "как тебя зовут") then return "Меня зовут RussNpc.ai"
    elseif string.find(lowerText, "привет") then return "Привет друг!"
    end
    
    return "Я не совсем понял. Попробуй спросить про помощь в игре!"
end

-- [Тут оставляешь ту же часть с созданием GUI и кнопкой, что была раньше]
-- Внутри SendBtn.MouseButton1Click:Connect(function() замени логику на эту:
SendBtn.MouseButton1Click:Connect(function()
    local answer = getAIResponse(Input.Text)
    -- Отправляем ответ в чат
    local textChannel = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
    if textChannel then textChannel:SendAsync("RussNpc.ai: " .. answer) end
    Input.Text = ""
end)

