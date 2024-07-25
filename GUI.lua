repeat task.wait() until game:IsLoaded()
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
local GUIVisible = true

-- GUI Funcs
local function CreateSection(text, pos, color)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(0, 200, 0, 50)
    section.Position = pos
    section.BackgroundColor3 = color
    section.Parent = gui
    section.Visible = GUIVisible

    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Text = text
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Font = Enum.Font.SourceSansBold
    sectionLabel.TextSize = 35
    sectionLabel.Parent = section
    sectionLabel.Visible = GUIVisible

    -- Create a UIListLayout to handle button positioning
    local layout = Instance.new("UIListLayout")
    layout.Parent = section
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 2)  -- Vertical spacing between buttons

    return section, layout  -- Return the section object and layout if needed
end

local function CreateToggleButton(section, offText, onText, hotkey)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Text = offText
    toggleButton.Size = UDim2.new(1, -2, 0, 30)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.TextSize = 18
    toggleButton.Parent = section
    local toggleState = false

    -- Function to update toggle state and button appearance
    local function UpdateButton()
        if toggleState then
            toggleButton.Text = onText
            toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        else
            toggleButton.Text = offText
            toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end

    -- Mouse click event to toggle button state
    toggleButton.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        UpdateButton()
    end)

    -- Check hotkey press event (optional)
    if hotkey then
        game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
            if input.KeyCode == hotkey then
                toggleState = not toggleState
                UpdateButton()
            end
        end)
    end

    -- Return toggle state if needed externally
    return toggleState
end
