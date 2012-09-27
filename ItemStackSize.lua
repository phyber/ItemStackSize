local L_MAXSTACKSIZE
do
	local locale = GetLocale()
	if locale == "enUS" then
		L_MAXSTACKSIZE = "Max Stack Size: "
	end
end
local orig = GameTooltip:GetScript("OnTooltipSetItem")
local GetItemInfo = GetItemInfo
GameTooltip:SetScript("OnTooltipSetItem", function(tooltip, ...)
	local name, link = tooltip:GetItem()
	local maxStack = select(8, GetItemInfo(link))
	if maxStack then
		tooltip:AddDoubleLine(L_MAXSTACKSIZE, maxStack)
	end
	if orig then return orig(tooltip, ...) end
end)
