-- Защита от двойного запуска
if game.CoreGui:FindFirstChild("RussNpcGui") then game.CoreGui:FindFirstChild("RussNpcGui"):Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RussNpcGui"
ScreenGui.Parent = game.CoreGui -- Используем CoreGui, чтобы было стабильнее

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 200)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true

local Input = Instance.new("TextBox", MainFrame)
Input.Size = UDim2.new(0.9, 0, 0.3, 0)
Input.Position = UDim2.new(0.05, 0, 0.1, 0)
Input.PlaceholderText = "Вопрос..."
Input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Input.TextColor3 = Color3.new(1,1,1)

local SendBtn = Instance.new("TextButton", MainFrame)
SendBtn.Size = UDim2.new(0.9, 0, 0.3, 0)
SendBtn.Position = UDim2.new(0.05, 0, 0.5, 0)
SendBtn.Text = "ОТПРАВИТЬ"
SendBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)

-- Логика
SendBtn.MouseButton1Click:Connect(function()
    local text = string.lower(Input.Text)
    
    if string.find(text, "помоги") or string.find(text, "полет") then
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 50, 0)
            task.wait(2)
            bv:Destroy()
            SendBtn.Text = "ЛЕТИМ!"
        end
    else
        SendBtn.Text = "Я тут!"
    end
    
    task.wait(1)
    SendBtn.Text = "ОТПРАВИТЬ"
    Input.Text = ""
end)

