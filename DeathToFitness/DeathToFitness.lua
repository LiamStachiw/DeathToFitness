local Exercise_EventFrame = CreateFrame("Frame")

Exercise_EventFrame:RegisterEvent("PLAYER_DEAD")

Exercise_EventFrame:SetScript("OnEvent",
    function(self, event, ...)
        local currentHealth = UintHealth("boss1")
        local maxHealth = UnitHealthMax("boss1")
        print("Amount of exercise: " .. math.floor(((currentHealth / maxHealth) * 100) / 2))
    end)