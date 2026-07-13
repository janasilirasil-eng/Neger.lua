-- З-- Таблица логики (здесь ты можешь легко добавлять новые вопросы и действия)
local Logic = {
    ["привет"] = {response = "Привет! Я твой RussNpc.ai!"},
    ["как дела"] = {response = "У меня всё отлично!"},
    ["как тебя зовут"] = {response = "Я RussNpc.ai"},
    ["помоги"] = {
        response = "Включаю полет!", 
        action = function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity", hrp)
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Velocity = Vector3.new(0, 50, 0)
                task.wait(2)
                bv:Destroy()
            end
        end
    }
}

SendBtn.MouseButton1Click:Connect(function()
    local text = string.lower(Input.Text)
    local found = false
    
    -- Ищем совпадение в таблице
    for key, data in pairs(Logic) do
        if string.find(text, key) then
            SendBtn.Text = data.response
            if data.action then data.action() end
            found = true
            break
        end
    end
    
    if not found then SendBtn.Text = "Я не понял..." end
    
    task.wait(2)
    SendBtn.Text = "ОТПРАВИТЬ"
    Input.Text = ""
end)
