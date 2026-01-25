CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_FeatureManual = CasualTBCPrep.W_FeatureManual or {}

CasualTBCPrep.W_FeatureManual.TYPE = {
	NONE = 1
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



local function GenerateContent_Extra_None(parent)
	wFeatureManual.title:SetText("Description:  Nothing")
	wFeatureManual:SetSize(500, 500)
	fontStringWidth = 460
end

local function GenerateContent(type)
	CleanElements()
	local parent = wFeatureManual.scrollChild
	if type == CasualTBCPrep.W_FeatureManual.TYPE.NONE then
		GenerateContent_Extra_None(parent)
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