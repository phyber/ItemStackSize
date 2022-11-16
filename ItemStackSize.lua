-- ItemStackSize adds the maximum stack size of an item to the tooltip.
local L_MAXSTACKSIZE

do
    local locale = GetLocale()

    if locale == "deDE" then
        -- German
        L_MAXSTACKSIZE = "Maximaler Stapel: %s"
    elseif locale == "enUS" then
        -- English
        L_MAXSTACKSIZE = "Max Stack: %s"
    elseif locale == "esES" or locale == "esMX" then
        -- Spanish / Mexico
        L_MAXSTACKSIZE = "Carga Máx: %s"
    elseif locale == "frFR" then
        -- French
        L_MAXSTACKSIZE = "Empilement maxi: %s"
    elseif locale == "itIT" then
        -- Italian
        L_MAXSTACKSIZE = "Massima Pila: %s"
    elseif locale == "koKR" then
        -- Korean
        L_MAXSTACKSIZE = "최대 묶음 개수: %s"
    elseif locale == "ptBR" then
        -- Portugese, Brazil
        L_MAXSTACKSIZE = "Empilhamento máx: %s"
    elseif locale == "ruRU" then
        -- Russian
        L_MAXSTACKSIZE = "Максимум в стопке: %s"
    elseif locale == "znCN" or locale == "zhTW" then
        -- Chinese
        L_MAXSTACKSIZE = "最大叠加: %s"
    else
        -- enUS is the fallback/default language
        L_MAXSTACKSIZE = "Max Stack: %s"
    end
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

-- Retail WoW changed how tooltip processing is handled.
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
    -- Item Tooltips
    TooltipDataProcessor.AddTooltipPostCall(
        Enum.TooltipDataType.Item,
        AddStackSize
    )
else
    -- Mouseover tooltips
    GameTooltip:HookScript("OnTooltipSetItem", AddStackSize)

    -- Tooltips from clicking in chat, maybe others
    ItemRefTooltip:HookScript("OnTooltipSetItem", AddStackSize)
end
