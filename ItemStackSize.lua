local L_MAXSTACKSIZE
do
	local locale = GetLocale()
	if locale == "enUS" then
		L_MAXSTACKSIZE = "Max Stack Size:"
	end
end
local GetItemInfo = GetItemInfo
local select = select
local function AddStackSize(tooltip, ...)
	local name, link = tooltip:GetItem()
	if link then
		local maxStack = select(8, GetItemInfo(link))
		if maxStack then
			tooltip:AddDoubleLine(L_MAXSTACKSIZE, maxStack)
		end
	end
end
GameTooltip:HookScript("OnTooltipSetItem", AddStackSize)
