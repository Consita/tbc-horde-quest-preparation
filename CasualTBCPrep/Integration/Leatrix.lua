CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.Integration.Leatrix = CasualTBCPrep.Integration.Leatrix or {}

function CasualTBCPrep.Integration.Leatrix.IsQuestAutomationOn()
    local ltp = _G.LeaPlusDB
    if ltp then
        if ltp["AutomateQuests"] == "On" then return true end -- Outer Setting
        if ltp["AutoQuestAvailable"] == "On" then return true end -- Accept
        if ltp["AutoQuestCompleted"] == "On" then return true end -- Turn in
    end
    return false
end