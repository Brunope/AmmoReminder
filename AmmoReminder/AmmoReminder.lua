local debug_mode = false;

local function DebugPrint(s)
	if debug_mode then
		print(s)
	end
end

local function GetRangedWeaponType()
	local link = GetInventoryItemLink("player",GetInventorySlotInfo("RangedSlot"));
	if link == nil then
		return "Missing";
	end;
	local _, _, _, _, _, _, itemType = GetItemInfo(link);
	return itemType;
end;

local function UsesArrows()
	local weaponType = GetRangedWeaponType()
	return weaponType == "Bows" or weaponType == "Crossbows"
end

local function UsesBullets()
	local weaponType = GetRangedWeaponType()
	return weaponType == "Guns"
end

local function Remind(npc)
	local numArrows = GetEquippedAmmoAmount();
	message("Remember to buy arrows! You have "..numArrows.." left. Look for "..npc);
end

local lastZone = ""
local function ShouldSkip(zone)
	return IsHordeCity(zone) and zone == lastZone
end

local function HandleZoneChange(self, event, ...)
	if UsesArrows() then
		DebugPrint("I use arrows!")
	elseif UsesBullets() then
		DebugPrint("I use bullets!")
	end

	local subzone = GetSubZoneText()
	local zone = GetZoneText()
	DebugPrint("Checking for ammo vendors in "..subzone..", "..zone)
	local npc = FindHordeArrowVendorNpc(zone, subzone)
	DebugPrint(ShouldSkip(zone))
	if npc ~= nil and not ShouldSkip(zone) then
		Remind(npc)
	end
	lastZone = zone
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

print("Loaded AmmoReminder")
