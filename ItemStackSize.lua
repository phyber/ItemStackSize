local L_MAXSTACKSIZE
do
    L_MAXSTACKSIZE = "Max Stack: %s"
    -- If we end up with extra locales, they'll work something like below.
    -- local locale = GetLocale()
    -- if locale == "???" then
    --     L_MAXSTACKSIZE = "???"
    -- end
end

local GetItemInfo = GetItemInfo
local select = select

local function AddStackSize(tooltip)
    local name, link = tooltip:GetItem() -- luacheck: ignore 211/name
    if link then
        local maxStack = select(8, GetItemInfo(link))
        if maxStack then
            tooltip:AddLine(L_MAXSTACKSIZE:format(maxStack))
        end
    end
end

-- Mouseover tooltips
GameTooltip:HookScript("OnTooltipSetItem", AddStackSize)

-- Tooltips from clicking in chat, maybe others
ItemRefTooltip:HookScript("OnTooltipSetItem", AddStackSize)
