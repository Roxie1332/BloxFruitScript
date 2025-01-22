-- Criando Interface Gráfica (GUI)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

-- Configuração da Interface
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SoulGuitarGUI"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Frame.BorderSizePixel = 2

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.BackgroundTransparency = 1
Title.Text = "Soul Guitar Script"
Title.TextSize = 20
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSans

Button.Parent = Frame
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Position = UDim2.new(0.1, 0, 0.5, 0)
Button.BackgroundColor3 = Color3.new(0.2, 0.5, 0.8)
Button.Text = "Pegar Soul Guitar"
Button.TextSize = 18
Button.Font = Enum.Font.SourceSans
Button.TextColor3 = Color3.new(1, 1, 1)

-- Função Principal: Pegar Soul Guitar
local function getSoulGuitar()
    print("Verificando fase da lua...")
    local moonPhase = workspace:GetAttribute("MoonPhase") -- Verifica a fase da lua

    if moonPhase ~= "FullMoon" then
        warn("A lua não está cheia! Aguarde a lua cheia para continuar.")
        return
    end

    print("Lua cheia detectada! Iniciando os desafios da Soul Guitar...")

    -- Eliminar Zumbis
    print("Eliminando todos os zumbis...")
    for _, npc in pairs(workspace.Enemies:GetChildren()) do
        if npc.Name == "Zombie" then
            while npc.Humanoid.Health > 0 do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(0.1)
            end
        end
    end
    print("Todos os zumbis eliminados!")

    -- Resolver Enigma das Lápides
    print("Resolvendo o enigma das lápides...")
    local hauntedCastle = workspace:FindFirstChild("HauntedCastle")
    local tombstoneCounts = {}

    for _, tombstone in pairs(hauntedCastle.Tombstones:GetChildren()) do
        local row = tombstone:GetAttribute("Row")
        if not tombstoneCounts[row] then
            tombstoneCounts[row] = 0
        end
        tombstoneCounts[row] = tombstoneCounts[row] + 1
    end

    local maxRow, maxCount = nil, 0
    for row, count in pairs(tombstoneCounts) do
        if count > maxCount then
            maxRow = row
            maxCount = count
        end
    end

    for _, tombstone in pairs(hauntedCastle.Tombstones:GetChildren()) do
        if tombstone:GetAttribute("Row") == maxRow then
            fireclickdetector(tombstone.ClickDetector)
            wait(0.5)
        end
    end
    print("Enigma das lápides resolvido!")

    -- Ativar Interruptores
    print("Iniciando o ritual de luzes...")
    for _, part in pairs(hauntedCastle:GetChildren()) do
        if part:IsA("Part") and part.Name == "LightSwitch" then
            fireclickdetector(part.ClickDetector)
            wait(1)
        end
    end
    print("Ritual de luzes concluído!")

    -- Interagir com o NPC
    print("Interagindo com o NPC da Soul Guitar...")
    for _, npc in pairs(workspace.NPCs:GetChildren()) do
        if npc.Name == "Soul Guitar Dealer" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
            fireclickdetector(npc.ClickDetector)
        end
    end
    print("Desafio concluído! Verifique se obteve a Soul Guitar.")
end

-- Conectando a Função ao Botão
Button.MouseButton1Click:Connect(getSoulGuitar)
