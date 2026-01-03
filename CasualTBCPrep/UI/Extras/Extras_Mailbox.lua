CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.Extras_Mailbox = CasualTBCPrep.Extras_Mailbox or {}

local content, texts = {},{}

---@param frame Frame
function CasualTBCPrep.Extras_Mailbox.Clean(frame)
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

---@param parent Frame
local function Display(parent)
	local yPos = -1

    local clrBad = CasualTBCPrep.Themes.SelectedTheme.colors.bad;
    local clr = CasualTBCPrep.Themes.SelectedTheme.colors.bad;

	-- local txtWarning = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	-- txtWarning:SetPoint("TOP", parent, "TOP", 0, yPos)
	-- txtWarning:SetText("Do not use this feature until you are done prepping")
    -- txtWarning:SetTextColor(clrBad.r, clrBad.g, clrBad.b)
	-- table.insert(texts, txtWarning)

	-- local btnCompanion = CreateFrame("Button", nil, parent)
	-- btnCompanion:SetPoint("TOPLEFT", parent, "TOPLEFT", -1, yPos)
	-- btnCompanion:SetSize(28, 28)
	-- table.insert(content, btnCompanion)
	-- local btnCompanionTexture = btnCompanion:CreateTexture(nil, "BORDER")
	-- btnCompanionTexture:SetAllPoints(btnCompanion)
	-- btnCompanionTexture:SetTexture(132161)
	-- btnCompanion.textureObj = btnCompanionTexture
	-- table.insert(content, btnCompanionTexture)

    -- local funcCallHoverEnter = function(btn) if not btn or not btn.textureObj then return end btn.textureObj:SetAlpha(0.6) end
    -- local funcCallHoverLeave = function(btn) if not btn or not btn.textureObj then return end btn.textureObj:SetAlpha(1) end
    -- CasualTBCPrep.UI.HookTooltip(btnCompanion, "Toggle Companion Window", {"Opens or closes the Mail Companion", " ", "Can also be toggled with /tbcprep mail"}, nil, funcCallHoverEnter, funcCallHoverLeave)
    -- btnCompanion:SetScript("OnClick", function(self)
    --     CasualTBCPrep.W_Companion.Toggle();
    -- end)
    -- local table = CasualTBCPrep.Routing.GetMailboxItemsForCurrentRoute()

    -- for id,items in pairs(table) do
    --     for _,item in pairs(items) do
    --     end
    -- end
end
---@param frame Frame
function CasualTBCPrep.Extras_Mailbox.Load(frame)
    if not frame then return end
    CasualTBCPrep.Extras_Mailbox.Clean(frame)

    Display(frame.scrollChild)
end