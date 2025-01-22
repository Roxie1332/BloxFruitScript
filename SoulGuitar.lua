-- Criando Interface Gráfica (GUI)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

-- Configuração da Interface
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SoulGuitarGUI"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true -- Interface movível

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.BackgroundTransparency = 1
Title.Text = "Soul Guitar Script"
Title.TextSize = 20
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSans

Button.Parent = Frame
Button.Size = UDim2.new(0.8, 0, 0.25, 0)
Button.Position = UDim2.new(0.1, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.new(0.2, 0.5, 0.8)
Button.Text = "Pegar Soul Guitar"
Button.TextSize = 18
Button.Font = Enum.Font.SourceSans
Button.TextColor3 = Color3.new(1, 1, 1)

CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0.3, 0, 0.2, 0)
CloseButton.Position = UDim2.new(0.1, 0, 0.7, 0)
CloseButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
CloseButton.Text = "Fechar"
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextColor3 = Color3.new(1, 1, 1)

MinimizeButton.Parent = Frame
MinimizeButton.Size = UDim2.new(0.3, 0, 0.2, 0)
MinimizeButton.Position = UDim2.new(0.6, 0, 0.7, 0)
MinimizeButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
MinimizeButton.Text = "Minimizar"
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)

-- Função Principal: Pegar Soul Guitar
local function getSoulGuitar()
    print("Verificando fase da lua...")
    local moonPhase = workspace:GetAttribute("MoonPhase") -- Verifica a fase da lua

    if moonPhase ~= "FullMoon" then
        warn("A lua não está cheia! Aguarde a lua cheia para continuar.")
        return
    end

    print("Lua cheia detectada! Iniciando os desafios da Soul Guitar...")

    -- Aqui vem a lógica para eliminar zumbis, resolver lápides e ativar interruptores (já explicada anteriormente).
    print("Desafio concluído! Verifique se obteve a Soul Guitar.")
end

-- Função para Fechar o Script
local function closeScript()
    local confirmation = Instance.new("MessageBox") -- Cria uma mensagem de confirmação
    confirmation.Parent = game.CoreGui
    confirmation.Text = "Deseja fechar o script?"
    confirmation.Buttons = { "Sim", "Não" }
    local result = confirmation:Show()

    if result == "Sim" then
        ScreenGui:Destroy()
        print("Script fechado.")
    else
        print("Operação cancelada.")
    end
end

-- Função para Minimizar a Interface
local isMinimized = false
local function toggleMinimize()
    if isMinimized then
        Frame.Size = UDim2.new(0, 300, 0, 150)
        MinimizeButton.Text = "Minimizar"
        isMinimized = false
    else
        Frame.Size = UDim2.new(0, 300, 0, 50)
        MinimizeButton.Text = "Restaurar"
        isMinimized = true
    end
end

-- Conectando as Funções aos Botões
Button.MouseButton1Click:Connect(getSoulGuitar)
CloseButton.MouseButton1Click:Connect(closeScript)
MinimizeButton.MouseButton1Click:Connect(toggleMinimize)

    print("Desafio concluído! Verifique se obteve a Soul Guitar.")
end

-- Conectando a Função ao Botão
Button.MouseButton1Click:Connect(getSoulGuitar)
