CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.Extras_ExtraPrep = CasualTBCPrep.Extras_ExtraPrep or {}

--[Forward Declarations]
local DrawList

local extraData = {
    { code="SCEPTER", name="Scepter of the Sands Questline", desc={"This contains quests from the long 'Scepter of the Sands' questline from the opening of AQ"}, options={
        { id=2, name="Simple", summonsNeeded=0, estExtraExp=16150, reqQuests={8286,8288,8301}, removedQuests={8301}, addedQuests={
                {8586,"turnin"},{8587,"turnin"}, --Blue Shard, 9550+9550
                {8736,"qlog"}, --Green Shard, 14300 (instead of a 11k)
                {8730,"qlog"} --Red Shard, 14300 (instead of a 11k)
            }, desc={"Uses the Scepter quests that line up with our existing routes.", "This opens up some better QuestLog quests, and extra turnins, but also loses the Silithid Carapace Fragment quest.", "This is mainly worth it if you're missing a lot of questlog quests.", " ", "You will need to enter BWL multiple times."}
        },
        { id=3, name="Full", summonsNeeded=7, estExtraExp=119280, selectionWarning="Are you sure you want to enable this?\rThis is A LOT of additional steps, and is not supported in our addon except showing the exp on the Quests tab.\r\rYou are on your own.", reqQuests={8286,8288}, removedQuests={}, addedQuests={
                {8301,"turnin"},{8303,"turnin"},{8305,"turnin"},{8519,"turnin"},{8555,"turnin"}, -- Initial, 9550+9550+9550+960
                {8575,"turnin"},{8576,"turnin"},{8597,"turnin"},{8598,"turnin"},{8606,"turnin"}, --Blue Shard1, 9550+960+9550+4750+9550+
                {8584,"turnin"},{8585,"turnin"},{8586,"turnin"},{8587,"turnin"},{8728,"turnin"}, --Blue Shard2, 960+9550+9550+9550+9550
                {8736,"qlog"},{8741,"turnin"}, --Green Shard, 14300-11000+9550
                {8730,"qlog"} --Red Shard, 14300-11000
            }, desc={"<UNSUPPORTED>", " ", "Adds as many quests from the Scepter questline as possible with summons.", " ", "Quests will be shown on the quests tab, but our routes/guides will not update", " ", "We only added this so you can see the exp on the expbar - You'll need to manage this on your own", "If you don't understand what that means, don't enable this." }
        }
    }},
    { code="BLACKSMITH", name="Blacksmithing Quests", desc={"This contains blacksmithing specific quests"}, options={
        { id=4, name="Simple", summonsNeeded=0, estExtraExp=0, reqQuests={}, removedQuests={}, addedQuests={}, addedQuestsAlly={}, addedQuestsHorde={},
            desc={ }
        },
        { id=5, name="Diremaul", summonsNeeded=1, estExtraExp=0, reqQuests={}, removedQuests={}, addedQuests={ },
            desc={}
        }
    }},
    { code="QUEST_SHARING", name="Quest Sharing", desc={"This contains quests that must be shared from another character"}, multipleSelect=true, options={
        { id=6, name="Battleground Marks", summonsNeeded=0, estExtraExp=32000, reqQuests={}, removedQuests={}, addedQuests={}, addedQuestsAlly={8403,8396,8375}, addedQuestsHorde={8430,8439,8369},
            desc={"The quests for turning in 3x AB,WSG,AV marks are removed with TBC.", "If you keep them on another character, you can share them to yourself while turning in the other AV quests for free exp"}
        }
    }},
}

local content, texts = {},{}

---@param frame Frame
---@param featureData table
---@param optionData table
---@param reloadRoute boolean
local function ToggleStoredSetting(frame, featureData, optionData, reloadRoute)
    local storedSelections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ExtraTBCPrepSelections) or { }

    local featureCode = featureData.code

    if featureCode.multiSelect == true then
        local optionList = storedSelections[featureCode] or { }

        if optionList[optionData.id] then
            optionList[optionData.id] = nil
        else
            optionList[optionData.id] = optionData
        end

        storedSelections[featureCode] = optionList
    else
        local currentStored = storedSelections[featureCode]

        if currentStored and currentStored.id == optionData.id then
            storedSelections[featureCode] = nil
        else
            storedSelections[featureCode] = optionData
        end
    end

	CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.ExtraTBCPrepSelections, storedSelections)

	if reloadRoute == true then
        CasualTBCPrep.Extras_ExtraPrep.Clean(frame)
        DrawList(frame)
	end
end

---@param frame Frame
DrawList = function(frame)
	local yPos = -2
    local parent = frame.scrollChild
    local parentW = parent:GetWidth()

	local headerColor = CasualTBCPrep.ColorRGB_SpecialHeader
	local headerColorBright = CasualTBCPrep.ColorRGB_SpecialHeaderHover

    local storedSelections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ExtraTBCPrepSelections)

    yPos = -5
    local lastElement = nil
    for _, extraFeature in ipairs(extraData) do
        local txtFeature = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
        txtFeature:SetPoint("TOP", lastElement or parent , "TOP", 0, yPos)
        txtFeature:SetText(extraFeature.name)
        txtFeature:SetTextColor(headerColor.r, headerColor.g, headerColor.b, 1)
        table.insert(texts, txtFeature)
        lastElement = txtFeature
        yPos = -27

        for _, optionData in ipairs(extraFeature.options) do
            local storedOption = nil

            if extraFeature.multiSelect == true then
                local storedOptionList = storedSelections[extraFeature.code]
                if storedOptionList then
                    storedOption = storedOptionList[optionData.id]
                end
            else
                local storedSelectedOption = storedSelections[extraFeature.code]
                if storedSelectedOption and optionData.id == storedSelectedOption.id then
                    storedOption = storedSelectedOption
                end
            end

            local btnFeatureOption = CasualTBCPrep.UI.CreateTextButton(parent, optionData.name, GameFontNormalLarge, "CENTER", nil)
            btnFeatureOption:SetPoint("TOP", lastElement, "TOP", 0, yPos)
            table.insert(content, btnFeatureOption)
            lastElement = btnFeatureOption

            local optionColor = nil
            local enabled = false
            if storedOption == nil then
                optionColor = CasualTBCPrep.ColorRGB_SpecialNotSelected
            else
                optionColor = CasualTBCPrep.ColorRGB_SpecialSelected
                enabled = true
            end
            btnFeatureOption:GetFontString():SetTextColor(optionColor.r,optionColor.g,optionColor.b,1)
            local funcOptionHoverEnter = function(btn) if not btn then return end btn:GetFontString():SetTextColor(optionColor.r,optionColor.g,optionColor.b, 0.6) end
            local funcOptionHoverLeave = function(btn) if not btn then return end btn:GetFontString():SetTextColor(optionColor.r,optionColor.g,optionColor.b,1) end

            local addedQuestCount = #optionData.addedQuests
            if CasualTBCPrep.Faction.GetPlayerFactionID() == CasualTBCPrep.Faction.ALLIANCE then
                addedQuestCount = addedQuestCount + (optionData.addedQuestsAlly and #optionData.addedQuestsAlly or 0)
            else
                addedQuestCount = addedQuestCount + (optionData.addedQuestsHorde and #optionData.addedQuestsHorde or 0)
            end

            local ttLines = {}
            if optionData.estExtraExp and optionData.estExtraExp > 0 then
                table.insert(ttLines, CasualTBCPrep.CreateZoneText("Estimated Exp: ", tostring(optionData.estExtraExp)))
            end
            if optionData.summonsNeeded and optionData.summonsNeeded > 0 then
                table.insert(ttLines, CasualTBCPrep.CreateZoneText("Extra Summons Needed: ", tostring(optionData.summonsNeeded)))
            end
            if addedQuestCount and addedQuestCount > 0 then
                table.insert(ttLines, CasualTBCPrep.CreateZoneText("New Quests: ", tostring(addedQuestCount)))
            end

            if optionData.desc and #optionData.desc > 0 then
                table.insert(ttLines, " ")
                table.insert(ttLines, CasualTBCPrep.CreateZoneText("Description: ", ""))
                for _,ttLine in ipairs(optionData.desc) do
                    table.insert(ttLines, CasualTBCPrep.CreateZoneText("", ttLine))
                end
            end

            local optionDataTooltipHeaderText = optionColor.hex..optionData.name
            if enabled == true then
                optionDataTooltipHeaderText = optionDataTooltipHeaderText.." (Enabled)|r"
            else
                optionDataTooltipHeaderText = optionDataTooltipHeaderText.." (Disabled)|r"
            end
            CasualTBCPrep.UI.HookTooltip(btnFeatureOption, optionDataTooltipHeaderText, ttLines, nil, funcOptionHoverEnter, funcOptionHoverLeave)
            btnFeatureOption:SetScript("OnClick", function(self)
                ToggleStoredSetting(frame, extraFeature, optionData, true)
            end)
            yPos = -26
        end

        if extraFeature.desc and #extraFeature.desc > 0 then
            local ttLines = {}
            if extraFeature.multipleSelect == true then
                table.insert(ttLines, CasualTBCPrep.CreateZoneText("MultiSelect: ", "Yes"))
                table.insert(ttLines, " ")
            end
            for _,ttLine in ipairs(extraFeature.desc) do
                table.insert(ttLines, CasualTBCPrep.CreateZoneText("", ttLine))
            end

            CasualTBCPrep.UI.HookTooltip(txtFeature, headerColor.hex..extraFeature.name.."|r", ttLines, nil)
        end
        yPos = -35
    end
end
















---@param frame Frame
function CasualTBCPrep.Extras_ExtraPrep.Clean(frame)
    if not frame then return end

    if #texts > 0 then
        for _, fontString in ipairs(texts) do
            fontString:Hide()
            fontString:SetText("")
            fontString:SetSize(0, 0)
            fontString:SetParent(nil)
        end
    end

    if #content > 0 then
        for _, c in ipairs(content) do
            c:Hide()
            c:SetSize(0, 0)
            c:SetParent(nil)
        end
    end

    content = {}
    texts = {}
end

---@param frame Frame
function CasualTBCPrep.Extras_ExtraPrep.Load(frame)
    if not frame then return end
    CasualTBCPrep.Extras_ExtraPrep.Clean(frame)

    --DrawList(frame)
end