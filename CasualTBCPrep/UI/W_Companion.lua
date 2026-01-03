CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_Companion = CasualTBCPrep.W_Companion or {}

--[Variables]
local w_window_name = "CasualTBCPrep_W_Companion"
local msgZoneChangedID = 0
local mailPrefix = "TBCPrep_"

local sectionToWantedID = {
    ["Orgrimmar"] = 1454
}
---@class Frame|nil
local wCompanion = nil;

local function Display()
	if wCompanion.texts then
		for _, fontString in ipairs(wCompanion.texts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetSize(0, 0)
		end
	end
	if wCompanion.content then
		for _, borderFrame in ipairs(wCompanion.content) do
			borderFrame:Hide()
		end
	end
	wCompanion.texts = {}
	wCompanion.content = {}

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
                    table.insert(mailItemSlots, { id=item.itemID, count=item.count})

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
                        table.insert(mailItemSlots, { id=item.itemID, count=stackCount})
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

    for _,mailGroup in ipairs(mailsNeeded) do
        print("MailGroup "..tostring(mailGroup.id))

        for _, mail in ipairs(mailGroup.mails) do
            print("> Mail #"..tostring(mail.id)..": "..tostring(#mail.items).." items")
        end
    end
    print("<<<ORDER>>>")
    for index,order in ipairs(turnOrder) do
        print(tostring(index)..": "..order.type.." "..tostring(order.targetID).."   ("..order.section..")")
    end
end

--@param type string|nil
local function Create()
    local windowOffsetX, windowOffsetY = 0,0
    local wPoint, wRelativeTo, wRelativePoint = "CENTER", UIParent, "CENTER"

    local companionSettings = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.CompanionSettings)
    if companionSettings ~= nil then
        windowOffsetX = companionSettings.x or 0
        windowOffsetY = companionSettings.y or 0
        wPoint = companionSettings.point or "CENTER"
        wRelativeTo = companionSettings.relativeTo or UIParent
        wRelativePoint = companionSettings.relativePoint or "CENTER"
    end

	wCompanion = CreateFrame("Frame", w_window_name, UIParent, "BackdropTemplate")
	wCompanion:SetPoint(wPoint, wRelativeTo, wRelativePoint, windowOffsetX, windowOffsetY)
	wCompanion:EnableMouse(true)
	wCompanion:SetMovable(true)
	wCompanion:RegisterForDrag("LeftButton")
	wCompanion:SetScript("OnDragStart", function(self) self:StartMoving() end)
	wCompanion:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            local point,relativeTo,relativePoint, xOffset, yOffset = self:GetPoint()

            local companionSettings = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.CompanionSettings)
            if companionSettings == nil then companionSettings = {} end
            companionSettings.point = point
            companionSettings.relativeTo = relativeTo
            companionSettings.relativePoint = relativePoint
            companionSettings.x = xOffset
            companionSettings.y = yOffset
            CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.CompanionSettings, companionSettings)
        end)

	wCompanion:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true,
		tileSize = 32,
		edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
	wCompanion:SetBackdropColor(0, 0, 0, 0.7)  -- Black with 70% opacity
	wCompanion:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)  -- Gray border

	-- Place in the front above other UI/addons
	wCompanion:SetFrameStrata("FULLSCREEN_DIALOG")
	wCompanion:SetFrameLevel(1001)
	table.insert(UISpecialFrames, w_window_name)

	--[Title]
	wCompanion.title = wCompanion:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wCompanion.title:SetPoint("TOP", wCompanion, "TOP", 0, -10)

	--[QoL]
	wCompanion:SetScript("OnShow", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wCompanion:SetScript("OnHide", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wCompanion:Hide();
end

local function OnMessageZoneChanged(mapID, zoneName, subzoneName)
end

function CasualTBCPrep.W_Companion.Show()
	local debugger = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.DebugDetails) or -1
	if wCompanion == nil then

		Create()
		if wCompanion == nil then
			return
		end
	end

	wCompanion:SetSize(160, 300)
	wCompanion.title:SetText("TBC Prep Companion")

	-- Display()
	-- if not wCompanion:IsShown() then
    --     if msgZoneChangedID <= 0 then
    --         if debugger == 1 then CasualTBCPrep.NotifyUser("Companion registering ZONE_CHANGED event") end
	--         msgZoneChangedID = CasualTBCPrep.MessageBroker.Register(CasualTBCPrep.MessageBroker.TYPE.ZONE_CHANGED, OnMessageZoneChanged)
    --     end
	-- 	wCompanion:Show()
	-- end

    -- local companionSettings = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.CompanionSettings)
    -- if companionSettings == nil then companionSettings = {} end
    -- companionSettings.open = true
    -- CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.CompanionSettings, companionSettings)
end

function CasualTBCPrep.W_Companion.Hide()
	local debugger = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.DebugDetails) or -1
	if wCompanion ~= nil and wCompanion:IsShown() then
		wCompanion:Hide()

        if msgZoneChangedID > 0 then
            if debugger == 1 then CasualTBCPrep.NotifyUser("Companion Unregistering ZONE_CHANGED event") end
            CasualTBCPrep.MessageBroker.Unregister(CasualTBCPrep.MessageBroker.TYPE.ZONE_CHANGED, msgZoneChangedID)
            msgZoneChangedID = 0
        end
	end

    local companionSettings = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.CompanionSettings)
    if companionSettings == nil then companionSettings = {} end
    companionSettings.open = false
    CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.CompanionSettings, companionSettings)
end

function CasualTBCPrep.W_Companion.Toggle()
	if wCompanion == nil then
        CasualTBCPrep.W_Companion.Show()
        return
    end

    if wCompanion:IsShown() then
        CasualTBCPrep.W_Companion.Hide()
    else
        CasualTBCPrep.W_Companion.Show()
    end
end