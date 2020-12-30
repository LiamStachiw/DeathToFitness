local Exercise_EventFrame = CreateFrame("Frame")

Exercise_EventFrame:RegisterEvent("PLAYER_DEAD")

Exercise_EventFrame:SetScript("OnEvent",
    function(self, event, ...)
        -- Initalize current and max boss health pools
        local currentHealth = 0
        local maxHealth = 0
        
        -- If there is at least one boss (This will prevent anything from printing when dying to trash)
        if UnitHealth("boss1") ~= 0 then
            -- If there are 4 bosses
            if UnitHealth("boss4") ~= 0 then
                -- Sum the current and max health of all bosses
                currentHealth = UnitHealth("boss1") + UnitHealth("boss2") + UnitHealth("boss3") + UnitHealth("boss4")
                maxHealth = UnitHealthMax("boss1") +  UnitHealthMax("boss2") + UnitHealthMax("boss3") + UnitHealthMax("boss4")
            -- If there are 3 bosses
            elseif UnitHealth("boss3") ~= 0 then
                -- Sum the current and max health of all bosses
                currentHealth = UnitHealth("boss1") + UnitHealth("boss2") + UnitHealth("boss3")
                maxHealth = UnitHealthMax("boss1") +  UnitHealthMax("boss2") + UnitHealthMax("boss3")
            -- If there are 2 bosses
            elseif UnitHealth("boss2") ~= 0 then
                -- Sum the current and max health of all bosses
                currentHealth = UnitHealth("boss1") + UnitHealth("boss2")
                maxHealth = UnitHealthMax("boss1") +  UnitHealthMax("boss2")
            -- If there is only 1 boss
            else
                -- Get the boss' current and max health
                currentHealth = UnitHealth("boss1")
                maxHealth = UnitHealthMax("boss1")
            end
            -- Calculate and print the amount of exercise to do.
            print("Amount of exercise: " .. math.floor(((currentHealth / maxHealth) * 100) / 2))
		end
    end)