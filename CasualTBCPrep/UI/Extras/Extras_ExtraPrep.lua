CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.Extras_ExtraPrep = CasualTBCPrep.Extras_ExtraPrep or {}

-- Variables
local disabledType = "disabled"

-- Data
local extraData = {
    {
        code="SCEPTER", name="Scepter of the Sands Questline", desc={"This contains quests from the long 'Scepter of the Sands' questline from the opening of AQ"},
        options=
        {
            {
                id=2, name="Full", summonsNeeded=0, estExtraExp=0, reqQuests={8286,8288,8301,8303,8305,8519,8555}, removedQuests={8288,8301},
                addedQuests=
                {
                    {8620,"optional"},{8586,"turnin"},{8587,"turnin"},{8578,"optional"},{8728,"turnin"}, --Blue Shard
                    {8736,"optional"},{8741,"optional"}, --Green Shard
                    {8730,"optional"} --Red Shard
                },
                desc={"Uses the Scepter quests that line up with our existing routes.", "This opens up some better QuestLog quests, and extra turnins, but also loses the Silithid Carapace Fragment quest.", " ", "This is mainly worth it if you're missing a lot of questlog quests, and the exp gained depends on that."},
            }
        }
    },
    {
        code="BLACKSMITH", name="Blacksmithing Quests", desc={"This contains blacksmithing specific quests"}, multiSelect=true,
        options=
        {
            {
                id=4, name="Winterspring", summonsNeeded=0, estExtraExp=0, reqQuests={}, removedQuests={},
                addedQuests={ {5305,"optional"},{5306,"optional"},{5307,"optional"}, },
                desc={"Uses the Blacksmithing quests that line up with our existing routes. This includes only optional quests.", " ", "This is mainly worth it if you're missing a lot of questlog quests, and the exp gained depends on that."},
            },
            {
                id=5, name="Diremaul", summonsNeeded=1, estExtraExp=42900, reqQuests={}, removedQuests={},
                addedQuests={ {7649,"turnin"},{7650,"turnin"},{7651,"turnin"}, },
                desc={"Uses the Blacksmithing quests that are turned in in Diremaul. This requires a summon but it contains only turnin quests.", "Can also be combined with the class book in Diremaul for additional exp."}
            }
        }
    },
    {
        code="QUEST_SHARING", name="Quest Sharing", desc={"This contains quests that must be shared from another character"},
        options=
        {
            {
                id=6, name="Battleground Marks", summonsNeeded=0, estExtraExp=32000, reqQuests={}, removedQuests={},
                addedQuests={{8430,"turnin"},{8439,"turnin"},{8369,"turnin"}},
                desc={"The quests for turning in 3x AB, WSG & AV marks are removed with TBC.", "If you keep them on another character, you can share them to yourself while turning in the other AV quests for free exp.", " ", "The actual exp value of these in TBC is unknown, but we assume it's 32k total."}
            }
        }
    },
    {
        code="EXPERIMENTAL", name="EXPERIMENTAL", desc={"This contains quests where the exp value is not 100% known and can be used on your own risk!"},
        options=
        {
            {
                id=7, name="Alterac Valley", summonsNeeded=0, estExtraExp=0, reqQuests={}, removedQuests={},
                addedQuests={{7142,"optional"},{8272,"turnin"},{7101,"optional"},{7124,"optional"},{7082,"optional"} },
                desc={"!!!HIGHLY EXPERIMENTAL OPTIONAL QUESTLOG QUESTS. USE AT YOUR OWN RISK!", "THE VALUE IS NOT KNOWN FOR SURE!!!"}
            }
        }
    },
    {
        code="HUNTER_RHOK", name="Hunter Rhok'delar Quests", reqClass=CasualTBCPrep.Classes.HunterID, desc={"This contains quests related to the Ancient Petrified Leaf MC quest for hunters"},
        options=
        {
            {
                id=8, name="Ancient Petrified Leaf", summonsNeeded=0, estExtraExp=14300, reqQuests={}, removedQuests={},
                addedQuests={{18703,"turnin"} },
                desc={"This adds the 'Ancient Petrified Leaf' quest from MC, it's a 'free' 14300 exp, but you have to run north from felwood town to turn in it"}
            },
            {
                id=9, name="Rhok'delar Questline", summonsNeeded=0, estExtraExp=30000, reqQuests={}, removedQuests={},
                addedQuests={{7634,"turnin"},{7635,"turnin"},{7636,"optional"} },
                desc={"This will add the 3 quests that unlocks Rhok'delar. You need a sinew drop from onyxia and to grind a lot of azure dragons in winterspring, this is a lot of work!",
                "The Sinews can drop WITHOUT being on the quests.", " ", "This adds 2 turnin quests (28k), and a 14.3k optional quest you can use to replace a lower exp questlog quest."}
            },
        }
    }
}

local content, texts = {},{}

--[Forward Declarations]
local DrawList

local function CalculatePreviewExpForQuest(quest)
    if not quest then return end

    local charLvl = UnitLevel("player")
    if not charLvl or charLvl <= 0 then
        charLvl = 60
    end

    if quest.isScaling == true and quest.scaleRank and quest.scaleRank > 0 then
        quest.exp = CasualTBCPrep.Experience.GetActualScalingQuestExperienceValue(charLvl, quest.scaleRank)
    elseif quest.baseexp and quest.baseexp > 0 then
        quest.exp = CasualTBCPrep.Experience.GetActualQuestExperienceValue(quest.qlvl or charLvl, quest.baseexp, charLvl)
    else
        quest.exp = 0
    end
end

local countTemp = 1
---@param optionData table
---@param enable boolean
---@param printQuestChanges boolean
local function ApplyQuestTypeChange(optionData, enable, printQuestChanges)
    local addedPrintString, removedPrintString = "", ""
    if optionData.addedQuests then
        for _, questInfo in ipairs(optionData.addedQuests) do
            local questID, newType = questInfo[1], questInfo[2]

            if enable then
                CasualTBCPrep.QuestData.SetQuestType(questID, newType)

                if printQuestChanges == true then
                    if addedPrintString == "" then
                        addedPrintString = CasualTBCPrep.QuestData.GetQuestName(questID)
                    else
                        addedPrintString = addedPrintString..", "..CasualTBCPrep.QuestData.GetQuestName(questID)
                    end
                end

                local quest = CasualTBCPrep.QuestData.GetQuest(questID)
                if quest then
                    CalculatePreviewExpForQuest(quest)
                end
            else
                CasualTBCPrep.QuestData.RestoreQuestType(questID)
            end
        end
    end

    if optionData.removedQuests then
        for _, questID in ipairs(optionData.removedQuests) do
            local quest = CasualTBCPrep.QuestData.GetQuest(questID)
            if quest then
                if enable then
                    CasualTBCPrep.QuestData.SetQuestType(questID, disabledType)
                    quest.ignoreReqItemsForPrep = 1

                    if printQuestChanges == true then
                        if removedPrintString == "" then
                            removedPrintString = CasualTBCPrep.QuestData.GetQuestName(questID)
                        else
                            removedPrintString = removedPrintString..", "..CasualTBCPrep.QuestData.GetQuestName(questID)
                        end
                    end
                else
                    CasualTBCPrep.QuestData.RestoreQuestType(questID)
                    quest.ignoreReqItemsForPrep = nil
                end
            end
        end
    end

    CasualTBCPrep.QuestData.CreateAndSortLookupLists()
    CasualTBCPrep.W_Main.ReloadActiveTab()

    if printQuestChanges == true then
        if addedPrintString and addedPrintString ~= "" then
            CasualTBCPrep.NotifyUser("Added the following quests:\r"..addedPrintString)
        end

        if removedPrintString and removedPrintString ~= "" then
            CasualTBCPrep.NotifyUserWarning("Removed the following quests:\r"..removedPrintString)
        end
    end
end

---@param printAddedQuests boolean
function CasualTBCPrep.Extras_ExtraPrep.ApplyAllStoredExtras(printAddedQuests)
    local storedSelections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ExtraTBCPrepSelections)
    if not storedSelections then return end

    for _, extraFeature in ipairs(extraData) do
        local stored = storedSelections[extraFeature.code]

        for _, optionData in ipairs(extraFeature.options) do
            local enabled = false

            if extraFeature.multiSelect == true then
                enabled = stored and stored[optionData.id] ~= nil
            else
                enabled = stored and stored.id == optionData.id
            end

            ApplyQuestTypeChange(optionData, enabled, printAddedQuests)
        end
    end
end

---@param frame Frame
---@param featureData table
---@param optionData table
---@param reloadRoute boolean
local function ToggleStoredSetting(frame, featureData, optionData, reloadRoute)
    local storedSelections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ExtraTBCPrepSelections) or { }

    local featureCode = featureData.code

    if featureData.multiSelect == true then
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

    local enabledNow = false

    if featureData.multiSelect == true then
        local optionList = storedSelections[featureData.code]
        enabledNow = optionList and optionList[optionData.id] ~= nil
    else
        local storedOption = storedSelections[featureData.code]
        enabledNow = storedOption and storedOption.id == optionData.id
    end

    ApplyQuestTypeChange(optionData, enabledNow, true)

    if CasualTBCPrep.QuestData.UpdateRoutesFromQuestData then
        CasualTBCPrep.QuestData.UpdateRoutesFromQuestData()
    end
end

---@param frame Frame
DrawList = function(frame)
	local yPos = -2
    local parent = frame.scrollChild
    local parentW = parent:GetWidth()

	local headerColor = CasualTBCPrep.Themes.SelectedTheme.colors.headerSpecial
	local headerColorBright = CasualTBCPrep.Themes.SelectedTheme.colors.headerSpecialHover

    local storedSelections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ExtraTBCPrepSelections)

    local playerClassID = CasualTBCPrep.Classes.GetPlayerClassID()
    yPos = -5
    local lastElement = nil
    for _, extraFeature in ipairs(extraData) do
        if extraFeature.reqClass == nil or extraFeature.reqClass == playerClassID then
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
                    optionColor = CasualTBCPrep.Themes.SelectedTheme.colors.specialNotSelected
                else
                    optionColor = CasualTBCPrep.Themes.SelectedTheme.colors.specialSelected
                    enabled = true
                end
                btnFeatureOption:GetFontString():SetTextColor(optionColor.r,optionColor.g,optionColor.b,1)
                local funcOptionHoverEnter = function(btn) if not btn then return end btn:GetFontString():SetTextColor(optionColor.r,optionColor.g,optionColor.b, 0.6) end
                local funcOptionHoverLeave = function(btn) if not btn then return end btn:GetFontString():SetTextColor(optionColor.r,optionColor.g,optionColor.b, 1) end

                local addedQuestCount = #optionData.addedQuests

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

    DrawList(frame)
end