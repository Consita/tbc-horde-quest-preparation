CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_FeatureManual = CasualTBCPrep.W_FeatureManual or {}

CasualTBCPrep.W_FeatureManual.TYPE = {
	EXTRA_MAIL = 1
}

---@class Frame|nil
local wFeatureManual = nil;
local w_window_name = "CasualTBCPrep_W_FeatureManual"

local fontStringWidth = 0
local texts,content = {},{}
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

local function QuickText(parent, text, font, anchorPoint, relativeTo, relativePoint, xOffset, yOffset, clrRGB)
	local txt = parent:CreateFontString(nil, "OVERLAY", font)
	txt:SetPoint(anchorPoint, relativeTo, relativePoint, xOffset, yOffset)
	txt:SetWidth(fontStringWidth)
	txt:SetText(text)
    txt:SetTextColor(clrRGB.r, clrRGB.g, clrRGB.b)
	txt:SetJustifyH("LEFT")
	txt:SetJustifyV("TOP")
	table.insert(texts, txt)
	return txt
end



local function GenerateContent_Extra_Mailbox(parent)
	wFeatureManual.title:SetText("Description:  Extras - Mailbox")
	wFeatureManual:SetSize(500, 500)
	fontStringWidth = 460

	local clrWarn = CasualTBCPrep.Themes.SelectedTheme.colors.warn
	local clrHeader = CasualTBCPrep.Themes.SelectedTheme.colors.headerSpecialHover
	local clrText = CasualTBCPrep.Themes.SelectedTheme.colors.manualText
	local clrStep = CasualTBCPrep.Themes.SelectedTheme.colors.standoutText
	local txt = QuickText(parent, "What does this feature do?", "GameFontNormalLarge", "TOPLEFT", parent, "TOPLEFT", 0, -5, clrHeader)
	txt = QuickText(parent, "The Extras - Mailbox feature is to help you manage all your items on release day.\rIf you prepared a lot of quests, you can't have all the items in your bags from the beginning.\r\r"
		.."This feature will help you manage it by storing items in the bank/mailbox\rand withdrawing them as they are needed.\r\rThis feature is OPTIONAL, you can manage this yourself as well!\rIf this seems too complicated, or if you don't want to read, please don't use this feature - you might accidentally grief yourself and that's not fun.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "How does it work?", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "For banking, it will withdraw the items needed until the next time you\rget to a bank that makes sense for your route to withdraw from\r\r"
		.."For items that can be mailed, it will help you send mails to a second character with a special subject.\rYou then return those mails back, and the Companion Window can open them and take the items out at steps before you need them.\r\r"
		.."The Companion Window shows the steps for your route at the top, and\ryou can scroll through them using the arrows at the topleft and topright.\rWhen you enter the area for a step, it should automatically jump to that step\r\r"
		.."You can do this yourself without this feature if you label mails yourself, but this feature helps automate it.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Can I try it out?", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "Yep! We would even recommend it :)\r\rYou can find a test example at the bottom of this page.\rUse the guides if you get stuck.\r\r'/tbcprep companion' opens the Companion Window\r'/tbcprep companion help' opens this help window.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Mailbox Preparation Guide", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "Step 1", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrStep)
	txt = QuickText(parent, "Have as many non-bound items needed by the guide in your inventory as possible. Scarabs, idols, cloth and so on, everything that can be mailed.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 2", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Open the /tbcprep window and be on the Extras - Mailbox tab.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 3", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Make sure you have 'Return Character' set to one of your alts, and that\ryou typed the name correctly!\rYou can check if it's correct by logging on the character.\r> If correct, that character will have the 'Return Mails' button enabled.\r\rNote: The 'Return Character' is saved per account, not per character.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 4", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Interact with any mailbox on your prepped character.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 5", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Click the 'Send Mails' button, it will try to fill out a mail to send. Verify that the mail is correct, then click 'Send' youself.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 6", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Keep doing Step 5 until you have no more items you need to send.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 7", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Log over to your 'Return Character' and open the Extras - Mailbox tab.\rThe 'Return Mails' button should now be enabled.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 8", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Interact with any mailbox.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 9", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Click the 'Return Mails' button, it should start going through the mails and returning them.\r\rIf the button becomes clickable again, click it again, until it can't find anything to return.\r\rIf it bugs out and stays disabled, reopen the /tbcprep window to reset it.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Bank Preparation Guide", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "Step 1", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrStep)
	txt = QuickText(parent, "Put all bound quest items in the bank, the location doesn't matter.\rYou will take some out again in the 'Bags Preparation Guide' below.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Bags Preparation Guide", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "Step 1", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrStep)
	txt = QuickText(parent, "In the Companion Window, 'Step 1' is always what you need to have in your bags when you log in on release.\rThese items are used before reaching a convenient bank/mailbox.\r\rNow that you have prepared you bank and mailbox, take out items from both the bank and mailbox until you no longer see any items displayed under Step 1 in the Companion Window.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Before Release Day", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "Step 1", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrStep)
	txt = QuickText(parent, "Open the Companion.\rMake sure the first step is not showing any items. You should have all the items in your bags by now.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 2", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Head to the start of the route. You can check the RXP turnin guide, or the 'Route' tab in the /tbcprep window.\rLog out or wait here until release.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Release Day - Companion Guide", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -13, clrHeader)
	txt = QuickText(parent, "Step 1", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrStep)
	txt = QuickText(parent, "Open the Companion. You should already have prepared your bags, so Step 1 in the Companion should be done already.\rYou can manually go to Step 2 if you want to see when you next need to retrieve items.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 2", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "When you enter the correct area for a step, the Companion automatically jumps to that Step.\rIf for some reason it doesn't, you can manually navigate with the topleft/right arrows.\r\r"
	.."'Bank' & 'Mailbox' text is shown in red depending on what you need from this area. You can also see it at the step number, ex. '2 / 5 (Mail)'\rThey turn green when interacting with the bank/mailbox.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 3", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Interact with the bank/mailbox in the area. When you do, the text should turn green, and a 'Collect' button should be shown.\r\r"
		.."Click that button and the addon will start collecting the items you need.\rIt will print in the chat what it found, and what it couldn't find.\rIt may try to pick up items from quests you didn't do, but you can ignore that. If it says there's nothing left for it to collect, you can continue.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 4", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "You can now proceed following the RXP turnin guides.\rIf you want to know the area of the next step, use the topright arrow, but the Companion should do it itself when you enter the area.\r\r"
	.."", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Test Example", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -22, clrHeader)
	txt = QuickText(parent, "This does not explain everything in detail. Check the guides if you need help.", "GameFontNormalSmall", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrWarn)
	txt = QuickText(parent, "This specific example requires having the Main City 'Cloth' turnins available.", "GameFontNormalSmall", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrWarn)
	txt = QuickText(parent, "Step 1", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Have some stacks of Silk/Mageweave cloth in your bags, go to any mailbox.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 2", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Use 'Send Mails' button in /tbcprep to send the mails to your 'Return Character'.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 3", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Now log over to that character and use the 'Return Mails' button.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 4", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "Log back and go to Step3 (Gadgetzan) in the Companion.\r- It should tell you to go to Tanaris, Gadgetzan, so fly there.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Step 5", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "When you enter Gadgetzan, the Compaion should change.\rInteract with the mailbox, the 'Mailbox' text in the Companion should turn green.\r - Click the new 'Collect' button.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Further Testing", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -9, clrStep)
	txt = QuickText(parent, "If you leave town, the Companion should update and tell you to go back to town.\r\rIf you leave town, go to any other step than Tanaris and then enter town again, it should automatically select the correct step for you.\r\r"
	.."This Example should work for all steps as long as you have items from that step in your bags.\rYou can test with all the 'real' items, not just cloth.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)

	txt = QuickText(parent, "Feedback", "GameFontNormalLarge", "TOPLEFT", txt, "BOTTOMLEFT", 0, -28, clrHeader)
	txt = QuickText(parent, "If you find something here confusing, or find any errors, please let us know on Discord.", "GameFontNormal", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrText)
	txt = QuickText(parent, "Discord Invite: Click the discord link in the /tbcprep 'About' tab.", "GameFontNormalSmall", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrWarn)
	txt = QuickText(parent, " ", "GameFontNormalSmall", "TOPLEFT", txt, "BOTTOMLEFT", 0, -1, clrWarn)
end

local function GenerateContent(type)
	CleanElements()
	local parent = wFeatureManual.scrollChild
	if type == CasualTBCPrep.W_FeatureManual.TYPE.EXTRA_MAIL then
		GenerateContent_Extra_Mailbox(parent)
	end

	wFeatureManual.scrollChild:SetSize(wFeatureManual.scrollFrame:GetWidth(), 1)
end

--@param type string|nil
local function Create(type)
	wFeatureManual = CreateFrame("Frame", w_window_name, UIParent, "BasicFrameTemplateWithInset")
	wFeatureManual:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	wFeatureManual:EnableMouse(true)
	wFeatureManual:SetMovable(true)
	wFeatureManual:RegisterForDrag("LeftButton")
	wFeatureManual:SetScript("OnDragStart", function(self) self:StartMoving() end)
	wFeatureManual:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	-- Place in the front above other UI/addons
	wFeatureManual:SetFrameStrata("FULLSCREEN_DIALOG")
	wFeatureManual:SetFrameLevel(1000)

	--[Title]
	wFeatureManual.TitleBg:SetHeight(30);
	wFeatureManual.title = wFeatureManual:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wFeatureManual.title:SetPoint("LEFT", wFeatureManual.TitleBg, "LEFT", 8, 6)

	--Scroll
	wFeatureManual.scrollFrame, wFeatureManual.scrollChild = CasualTBCPrep.UI.CreateTBCPrepScrollFrame(wFeatureManual, nil, -30, nil, nil)

	--[QoL]
	wFeatureManual:SetScript("OnShow", function() CasualTBCPrep.Sounds.PlaySound_RaidWarning() end)
	wFeatureManual:SetScript("OnHide", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wFeatureManual:Hide();
	wFeatureManual:Show();
end

---@param type integer
function CasualTBCPrep.W_FeatureManual.Show(type)
	if wFeatureManual == nil then

		Create(type)
		if wFeatureManual == nil then
			return
		end
	end

	GenerateContent(type)

	if not wFeatureManual:IsShown() then
		wFeatureManual:Show()
	end
end