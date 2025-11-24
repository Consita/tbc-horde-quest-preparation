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

---@param frame Frame
function CasualTBCPrep.Extras_Mailbox.Load(frame)
    if not frame then return end
    CasualTBCPrep.Extras_Mailbox.Clean(frame)

	local parent = frame.scrollChild
	local yPos = 1

	local txtWIP = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	txtWIP:SetPoint("TOP", parent, "TOP", 0, -33)
	txtWIP:SetText("Work in Progress")
	table.insert(texts, txtWIP)
end