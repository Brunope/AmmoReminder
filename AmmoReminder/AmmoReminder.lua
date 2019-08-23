local debugMode = false;

local function DebugPrint(s)
	if debugMode then
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

-- I think this can be replaced with GetEquippedAmmoName but I
-- can't test it yet
local function GetAmmoType()
	if UsesArrows() then
		return "arrows"
	elseif UsesBullets() then
		return "bullets"
	end
end

local levelToAmmoThreshold = {
	[0]=400,
	[10]=1000,
	[20]=1400,
	[30]=1600,
	[40]=1800,
	[50]=2000,
	[60]=2000
}

local function RoundDownTen(int)
	return math.floor(int / 10) * 10
end

local function LowAmmo()
	local level = UnitLevel("player");
	local threshold = levelToAmmoThreshold[RoundDownTen(level)];
	return GetEquippedAmmoAmount() < threshold;
end
	
local function Remind(npc)
	local ammoCount = GetEquippedAmmoAmount();
	local ammoType = GetAmmoType();
	message("Remember to buy "..ammoType.."! You have "..ammoCount.." left. Look for "..npc);
end

local lastZone = ""
local function ShouldSkipZone(zone)
	return IsHordeCity(zone) and zone == lastZone;
end

local function ShouldSkip(zone)
	return ShouldSkipZone(zone) or not LowAmmo();
end

local function FindAmmoVendorNpc(zone, subzone)
	if UsesArrows() then
		return FindHordeArrowVendorNpc(zone, subzone)
	elseif UsesBullets() then
		return FindHordeBulletVendorNpc(zone, subzone)
	end
end

local function HandleZoneChange(self, event, ...)
	local ammoType = GetAmmoType()
	DebugPrint(ammoType)

	local subzone = GetSubZoneText()
	local zone = GetZoneText()

	DebugPrint("Checking for ammo vendors in "..subzone..", "..zone)
	DebugPrint(ShouldSkip(zone))

	local npc = FindAmmoVendorNpc(zone, subzone)
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
