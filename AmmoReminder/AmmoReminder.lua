local hordeArrowSubzoneToNpc = {
	["Sen'jin Village"]="Trayexir",
	["Darkspear Training Grounds"]="Test"
}

function HandleZoneChange(self, event, ...)
	local subzone = GetSubZoneText()
	local zone = GetZoneText()
	print("Checking for ammo vendors in "..subzone..", "..zone)
	local npc = hordeArrowSubzoneToNpc[subzone]
	if npc ~= nil then
		message("Remember to buy arrows! Look for "..npc)
	end
end

local ZoneChange_EventFrame = CreateFrame("Frame")
ZoneChange_EventFrame:RegisterEvent("ZONE_CHANGED")
ZoneChange_EventFrame:SetScript("OnEvent", HandleZoneChange)
		
local ZoneChangeIndoors_EventFrame = CreateFrame("Frame")
ZoneChangeIndoors_EventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
ZoneChangeIndoors_EventFrame:SetScript("OnEvent", HandleZoneChange)

local ZoneChangeNewArea_EventFrame = CreateFrame("Frame")
ZoneChangeNewArea_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
ZoneChangeNewArea_EventFrame:SetScript("OnEvent", HandleZoneChange)
