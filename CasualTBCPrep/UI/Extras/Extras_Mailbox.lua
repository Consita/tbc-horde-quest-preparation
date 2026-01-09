CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.Extras_Mailbox = CasualTBCPrep.Extras_Mailbox or {}
CasualTBCPrep.Extras_Mailbox.MAIL_PREFIX = "TBCPrepMail"

local turninSteps = {
    [CasualTBCPrep.Routing.RouteCodeMain] = {
        { id=1, text="Items in bags", header="Bags", targetMailID=1, targetBankID=1, section=nil, mapID=nil, zone=nil, subZone=nil, reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=2, text="Cenarion Hold", header="Mail", targetMailID=2, targetBankID=nil, section="SilithusHold", mapID=1451, zone="Silithus", subZone="Cenarion Hold", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=3, text="Gadgetzan", header="Mail & Bank", targetMailID=3, targetBankID=2, section="TanarisTown", mapID=1446, zone="Tanaris", subZone="Gadgetzan", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=4, text="Orgrimmar", header="Bank", targetMailID=4, targetBankID=3, section="OrgrimmarBank", mapID=1454, zone="Orgrimmar", subZone="Valley of Strength", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=5, text="Light's Hope Chapel", header="Mail", targetMailID=5, targetBankID=nil, section="EPLTown", mapID=1423, zone="Eastern Plaguelands", subZone="Light's Hope Chapel", shortZoneText="EPL, Light's Hope Chapel", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=6, text="Tarren Mill", header="Mail", targetMailID=6, targetBankID=nil, section="AV", mapID=1424, zone="Hillsbrad Foothills", subZone="Tarren Mill", shortZoneText="Hillsbrad, Tarren Mill", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=7, text="Stonard", header="Mail", targetMailID=7, targetBankID=nil, section="Stonard", mapID=1435, zone="Swamp of Sorrows", subZone="Stonard", shortZoneText="Swamp of Sorrows, Stonard", reached=false, interactedWithMail=false, interactedWithBank=false },
    },
    [CasualTBCPrep.Routing.RouteCodeStrat] = {
        { id=1, text="Items in bags", header="Bags", targetMailID=1, targetBankID=1, section=nil, mapID=nil, zone=nil, subZone=nil, reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=2, text="Cenarion Hold", header="Mail", targetMailID=2, targetBankID=nil, section="SilithusHold", mapID=1451, zone="Silithus", subZone="Cenarion Hold", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=3, text="Gadgetzan", header="Mail & Bank", targetMailID=3, targetBankID=2, section="TanarisTown", mapID=1446, zone="Tanaris", subZone="Gadgetzan", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=4, text="Orgrimmar", header="Mail & Bank", targetMailID=4, targetBankID=3, section="OrgrimmarBank", mapID=1454, zone="Orgrimmar", subZone="Valley of Strength", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=5, text="Light's Hope Chapel", header="Mail", targetMailID=5, targetBankID=nil, section="EPLTown", mapID=1423, zone="Eastern Plaguelands", subZone="Light's Hope Chapel", shortZoneText="EPL, Light's Hope Chapel", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=6, text="Tarren Mill", header="Mail", targetMailID=6, targetBankID=nil, section="AV", mapID=1424, zone="Hillsbrad Foothills", subZone="Tarren Mill", shortZoneText="Hillsbrad, Tarren Mill", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=7, text="Stonard", header="Mail", targetMailID=7, targetBankID=nil, section="Stonard", mapID=1435, zone="Swamp of Sorrows", subZone="Stonard", shortZoneText="Swamp of Sorrows, Stonard", reached=false, interactedWithMail=false, interactedWithBank=false },
    },
    [CasualTBCPrep.Routing.RouteCodeSolo] = {
        { id=1, text="Items in bags", header="Bags", targetMailID=1, targetBankID=1, section=nil, mapID=nil, zone=nil, subZone=nil, reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=2, text="Cenarion Hold", header="Mail", targetMailID=2, targetBankID=nil, section="SilithusHold", mapID=1451, zone="Silithus", subZone="Cenarion Hold", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=3, text="Gadgetzan", header="Mail & Bank", targetMailID=3, targetBankID=2, section="TanarisTown", mapID=1446, zone="Tanaris", subZone="Gadgetzan", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=4, text="Everlook", header="Mail & Bank", targetMailID=4, targetBankID=3, section="wsEverlook", mapID=1452, zone="Winterspring", subZone="Everlook", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=5, text="Orgrimmar", header="Mail & Bank", targetMailID=5, targetBankID=4, section="OrgrimmarBank", mapID=1454, zone="Orgrimmar", subZone="Valley of Strength", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=6, text="Undercity", header="Bank", targetMailID=6, targetBankID=5, section="Undercity2", mapID=1458, zone="Undercity", subZone="Trade Quarter", reached=false, interactedWithMail=false, interactedWithBank=false },
        { id=7, text="Light's Hope Chapel", header="Mail", targetMailID=7, targetBankID=nil, section="EPLTown", mapID=1423, zone="Eastern Plaguelands", subZone="Light's Hope Chapel", shortZoneText="EPL, Light's Hope Chapel", reached=false, interactedWithMail=false, interactedWithBank=false },
    }
}

local content, texts = {},{}

local function CleanElements()
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
function CasualTBCPrep.Extras_Mailbox.Clean(frame)
    if not frame then return end
    CleanElements()
end

---@param index integer
function CasualTBCPrep.Extras_Mailbox.GetTurninStep(index) return turninSteps[CasualTBCPrep.Routing.CurrentRouteCode][index] end
function CasualTBCPrep.Extras_Mailbox.GetTurninSteps() return turninSteps[CasualTBCPrep.Routing.CurrentRouteCode] end
function CasualTBCPrep.Extras_Mailbox.GetTurninStepCount() return #turninSteps[CasualTBCPrep.Routing.CurrentRouteCode] end
---@param index integer
---@param value boolean
function CasualTBCPrep.Extras_Mailbox.SetTurninInteractedWithMail(index,value) turninSteps[CasualTBCPrep.Routing.CurrentRouteCode][index].interactedWithMail = value end
---@param index integer
---@param value boolean
function CasualTBCPrep.Extras_Mailbox.SetTurninInteractedWithBank(index,value) turninSteps[CasualTBCPrep.Routing.CurrentRouteCode][index].interactedWithBank = value end
---@param index integer
---@param value boolean
function CasualTBCPrep.Extras_Mailbox.SetTurninReached(index,value) turninSteps[CasualTBCPrep.Routing.CurrentRouteCode][index].reached = value end

---@return table,table
function CasualTBCPrep.Extras_Mailbox.GetTurninData()
    local mailboxItems, bankItems, turnOrder = CasualTBCPrep.Routing.GetTurninItemsForCurrentRoute()
    local mailsNeeded = {}

    for _,data in ipairs(mailboxItems) do
        local mails = { }
        local mailItemSlots = {}

        local mailCount = 1
        local slotCount = 0

        for _, item in ipairs(data.items) do
            local itemObj = CasualTBCPrep.Items.GetItemDetails(item.itemID);
            if itemObj == nil then
                CasualTBCPrep.NotifyUserError("Companion couldn't find ItemDetails for Mail-ItemID="..tostring(item.itemID))
            else
                if item.count <= itemObj.stackSize then
                    slotCount = slotCount + 1
                    table.insert(mailItemSlots, { itemID=item.itemID, count=item.count})

                    if slotCount >= 12 then
                        table.insert(mails, { id=mailCount, items=mailItemSlots})
                        mailCount = mailCount + 1
                        mailItemSlots = {}
                        slotCount = 0
                    end
                else
                    local needed = item.count
                    while needed > 0 do
                        local stackCount = math.min(needed, itemObj.stackSize)
                        slotCount = slotCount + 1
                        table.insert(mailItemSlots, { itemID=item.itemID, count=stackCount})
                        needed = needed - stackCount

                        if slotCount >= 12 then
                            table.insert(mails, { id=mailCount, items=mailItemSlots})
                            mailCount = mailCount + 1
                            mailItemSlots = {}
                            slotCount = 0
                        end
                    end
                end
            end
        end
        if #mailItemSlots > 0 then
            table.insert(mails, { id=mailCount, items=mailItemSlots})
        end

        table.insert(mailsNeeded, { id=data.id, mails=mails })
    end

    return mailsNeeded, bankItems
end
---@param currentStep table
---@return table,table,integer,integer
function CasualTBCPrep.Extras_Mailbox.GetStepDetails_ItemsNeeded(dataMail, dataBank, currentStep)
    local mailsToOpen, itemsFromBank = {},{}
    local mailItemStackCount, bankItemStackCount = 0,0
    local targetMailID = currentStep.targetMailID or 0

    if targetMailID > 0 then
        local mails = dataMail[targetMailID]

        if mails == nil then
            CasualTBCPrep.NotifyUserCompanionError("ERR, Extras_Mailbox.GetStepDetails_ItemsNeeded has nil 'mails' from dataMail["..tostring(targetMailID.."]"))
        end
        
        for _,mail in pairs(mails.mails) do
            local filteredItems = {}
            local playerInvCountRemaining = {}  -- Track remaining per itemID

            for _,item in ipairs(mail.items) do
                -- Get remaining inventory (subtract what we've already allocated)
                local playerInvCount = playerInvCountRemaining[item.itemID]
                if playerInvCount == nil then
                    playerInvCount = CasualTBCPrep.Items.GetPlayerItemCount(item.itemID, false)
                    playerInvCountRemaining[item.itemID] = playerInvCount
                end
                
                if playerInvCount < item.count then
                    local needed = item.count - playerInvCount
                    table.insert(filteredItems, {
                        itemID = item.itemID,
                        count = needed
                    })
                    mailItemStackCount = mailItemStackCount + 1
                    playerInvCountRemaining[item.itemID] = 0  -- We've allocated all available
                else
                    -- We have enough for this stack, subtract it
                    playerInvCountRemaining[item.itemID] = playerInvCount - item.count
                end
            end

            if #filteredItems > 0 then
                table.insert(mailsToOpen, {id = mail.id, items = filteredItems})
            end
        end
    end

    if currentStep.targetBankID ~= nil and currentStep.targetBankID > 0 then
        local bank = dataBank[currentStep.targetBankID]
        if bank == nil then
            CasualTBCPrep.NotifyUserCompanionError("ERR, Extras_Mailbox.GetStepDetails_ItemsNeeded has nil 'bank' from dataBank["..tostring(targetBankID.."]"))
        end
        for _,item in ipairs(bank.items) do
            local playerInvCount = CasualTBCPrep.Items.GetPlayerItemCount(item.itemID, false)
            if playerInvCount < item.count then
                table.insert(itemsFromBank, {
                    itemID = item.itemID,
                    count = item.count - playerInvCount
                })
                bankItemStackCount = bankItemStackCount + 1
            end
        end
    end

    return mailsToOpen, itemsFromBank, mailItemStackCount, bankItemStackCount
end

---@param parent Frame
local function Display(parent)
	local yPos = -1



	local debugger = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.DebugDetails) or -1

    local clrBad = CasualTBCPrep.Themes.SelectedTheme.colors.bad
    local clrWarn = CasualTBCPrep.Themes.SelectedTheme.colors.warn
    local clrBanked = CasualTBCPrep.Themes.SelectedTheme.colors.questReadyBanked
    local clrMissing = CasualTBCPrep.Themes.SelectedTheme.colors.questCompleted
    local clrAcceptanceText = CasualTBCPrep.Themes.SelectedTheme.colors.standoutText

    local companionSettingsGlobal = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.CompanionSettings)
    if companionSettingsGlobal == nil then
        companionSettingsGlobal = { mailCharacterName = "", playerWarningAcceptance = false }
        CasualTBCPrep.Settings.SetGlobalSetting(CasualTBCPrep.Settings.CompanionSettings, companionSettingsGlobal)
    end

    -- Button Shared
    local funcCallHoverEnter = function(btn) if not btn or not btn.textureObj then return end btn.textureObj:SetAlpha(0.6) end
    local funcCallHoverLeave = function(btn) if not btn or not btn.textureObj then return end btn.textureObj:SetAlpha(1) end

    -- Companion Button
	local btnCompanion = CreateFrame("Button", nil, parent)
	btnCompanion:SetPoint("TOPLEFT", parent, "TOPLEFT", -1, yPos)
	btnCompanion:SetSize(28, 28)
	table.insert(content, btnCompanion)
	local btnCompanionTexture = btnCompanion:CreateTexture(nil, "BORDER")
	btnCompanionTexture:SetAllPoints(btnCompanion)
	btnCompanionTexture:SetTexture(132161)
	btnCompanion.textureObj = btnCompanionTexture
	table.insert(content, btnCompanionTexture)

    CasualTBCPrep.UI.HookTooltip(btnCompanion, "Toggle Companion Window", {"Opens or closes the Mail Companion", " ", "Can also be toggled with /tbcprep companion"}, nil, funcCallHoverEnter, funcCallHoverLeave)
    btnCompanion:SetScript("OnClick", function(self)
        CasualTBCPrep.W_Companion.Toggle();
    end)

    -- Explanation Button
	local btnExplanation = CreateFrame("Button", nil, parent)
	btnExplanation:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -1, yPos)
	btnExplanation:SetSize(28, 28)
	table.insert(content, btnExplanation)
	local btnExplanationTexture = btnExplanation:CreateTexture(nil, "BORDER")
	btnExplanationTexture:SetAllPoints(btnExplanation)
	btnExplanationTexture:SetTexture(134939)
	btnExplanation.textureObj = btnExplanationTexture
	table.insert(content, btnExplanationTexture)

    CasualTBCPrep.UI.HookTooltip(btnExplanation, "Detailed explanation", {"Opens a window with a detailed explanation of how to use this feature.", " ", "Can also be opened with /tbcprep companion help" }, nil, funcCallHoverEnter, funcCallHoverLeave)
    btnExplanation:SetScript("OnClick", function(self)
        CasualTBCPrep.W_FeatureManual.Show(CasualTBCPrep.W_FeatureManual.TYPE.EXTRA_MAIL)
    end)

	local txtNoticeA = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    txtNoticeA:SetPoint("TOP", parent, "TOP", 0, -1)
	txtNoticeA:SetText("Click the whistle on the left to open the companion")
    txtNoticeA:SetTextColor(clrWarn.r, clrWarn.g, clrWarn.b)
	table.insert(texts, txtNoticeA)

	local txtNoticeB = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    txtNoticeB:SetPoint("TOP", txtNoticeA, "BOTTOM", 0, -1)
	txtNoticeB:SetText("Click the scroll on the right for a detailed explanation")
    txtNoticeB:SetTextColor(clrWarn.r, clrWarn.g, clrWarn.b)
	table.insert(texts, txtNoticeB)

    if companionSettingsGlobal.playerWarningAcceptance ~= true then
        txtNoticeA:SetText(" ")
        local wallOfText = clrWarn.hex.."THIS FEATURE IS A WORK IN PROGRESS|r\r\r\r"
            ..clrWarn.hex.."When returned mails expire, they are\r"
            ..clrBad.hex.."PERMANENTLY DESTROYED|r\r"
            ..clrWarn.hex.."They expire after 30 days|r\r\r\r"
            ..clrAcceptanceText.hex.."If you want to try it out, or help us test it\rwe would really appreciate it!\rBut please don't grief yourself|r"
        local txtWarningAccept = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        txtWarningAccept:SetPoint("TOP", parent, "TOP", 0, -35)
        txtWarningAccept:SetText(wallOfText)
        txtWarningAccept:SetTextColor(1,1,1)
        table.insert(texts, txtWarningAccept)

        local btnAcceptWarning = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
        btnAcceptWarning:SetSize(275,30)
        btnAcceptWarning:SetPoint("TOP", txtWarningAccept, "BOTTOM", 0, -80)
        btnAcceptWarning:SetText("I understand and I will not be stupid")
        btnAcceptWarning:SetScript("OnClick", function()
            CleanElements()
            local globalCompSetting = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.CompanionSettings)
            globalCompSetting.playerWarningAcceptance = true
            CasualTBCPrep.Settings.SetGlobalSetting(CasualTBCPrep.Settings.CompanionSettings, companionSettingsGlobal)
            Display(parent)
        end)
        table.insert(content, btnAcceptWarning)
        CasualTBCPrep.UI.HookTooltip(btnAcceptWarning, "Warning Acceptance", { "If you decide to be stupid anyways, please don't blame us", "We did warn you O_O", " ", "If you click this button, your account will not see it again"}, nil,nil,nil)

        local txtWarningLast = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        txtWarningLast:SetPoint("BOTTOM", btnAcceptWarning, "TOP", 0, 2)
        txtWarningLast:SetText("This warning will be removed when we know the TBC Launch date\rand when there is less than 30 days left")
        txtWarningLast:SetTextColor(0.7,0.7,0.7)
        table.insert(texts, txtWarningLast)
        return
    end

    local yPosStart = -60
    yPos = yPosStart

    local loadCharName = companionSettingsGlobal.mailCharacterName or ""

    -- Items
    yPos = yPosStart
    local mailsNeeded, bankItems = CasualTBCPrep.Extras_Mailbox.GetTurninData()

    local allCombinedItems = {}
    for _,mailGroup in ipairs(mailsNeeded) do
        for _,mail in ipairs(mailGroup.mails) do
            for _,item in ipairs(mail.items) do
                if allCombinedItems[item.itemID] then
                    allCombinedItems[item.itemID] = allCombinedItems[item.itemID] + item.count
                else
                    allCombinedItems[item.itemID] = item.count
                end
            end
        end
    end

    -- local clrHeader1 = CasualTBCPrep.Themes.SelectedTheme.colors.headerSpecialHover
    -- local txtHeader = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    -- txtHeader:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, yPos)
    -- txtHeader:SetText("Missing Items for Mails")
    -- txtHeader:SetTextColor(clrHeader1.r, clrHeader1.g, clrHeader1.b)
    -- table.insert(texts, txtHeader)
    -- yPos = yPos - 20

    -- local itemIconSize = 28

    -- for itemID, totalNeeded in pairs(allCombinedItems) do
    --     local inventoryCount = CasualTBCPrep.Items.GetPlayerItemCount(itemID, false)
    --     local missing = math.max(0, totalNeeded - inventoryCount)

    --     if missing > 0 then
    --         local icon, border, textRarityColor, imgItem = CasualTBCPrep.UI.CreateItemImage(parent, itemIconSize, itemID, "TOPLEFT", "TOPLEFT", 4, yPos)
    --         table.insert(content, icon)
    --         table.insert(content, border)

    --         local itemName = imgItem and imgItem.name or ("Item " .. itemID)
    --         local r,g,b,cHex = CasualTBCPrep.GetRarityColor(imgItem and imgItem.rarity or 0)

    --         local txtItemName = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    --         txtItemName:SetPoint("TOPLEFT", icon, "TOPRIGHT", 2, -1)
    --         txtItemName:SetText(cHex .. itemName .. "|r")
    --         table.insert(texts, txtItemName)

    --         local txtMissing = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    --         txtMissing:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 2, 1)
    --         txtMissing:SetText(clrMissing.hex .. "Missing: " .. missing .. "|r")
    --         table.insert(texts, txtMissing)

    --         if icon then
    --             icon:SetScript("OnEnter", function(self)
    --                 local link = CasualTBCPrep.Items.TryGetItemLink(itemID)
    --                 if link then
    --                     GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    --                     GameTooltip:SetHyperlink(link)
    --                     GameTooltip:Show()
    --                 end
    --             end)
    --             icon:SetScript("OnLeave", function()
    --                 GameTooltip:Hide()
    --             end)
    --         end
    --         yPos = yPos - (itemIconSize + 5)
    --     end
    -- end

    -----LEFT
    -- List of all needed items, different header for each mailGroup
    --> MailGroup #1
    --> > Items
    --> MailGroup #2
    --> > Items


    -----RIGHT

    -- Send Mail Button, go through groups from 1 to 4. When there's 0 items in player bags from 1, go to 2 etc. Means looping through everything at the end, but is fine.




end
---@param frame Frame
function CasualTBCPrep.Extras_Mailbox.Load(frame)
    if not frame then return end
    CasualTBCPrep.Extras_Mailbox.Clean(frame)

    Display(frame.scrollChild)

	-- local txtNotYetBuddy = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	-- txtNotYetBuddy:SetPoint("TOP", frame, "TOP", 0, -75)
	-- txtNotYetBuddy:SetText("Coming soon... (next update)")
    -- txtNotYetBuddy:SetTextColor(1,1,1)
	-- table.insert(texts, txtNotYetBuddy)
end