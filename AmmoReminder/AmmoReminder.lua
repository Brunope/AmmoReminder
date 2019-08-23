local AR = AmmoReminder;

function AR.DebugPrint(s)
	if AR.debugMode then
		print(s)
	end
end

function AR.Remind(npc)
	local ammoCount = AR.GetEquippedAmmoAmount();
	local ammoType = AR.GetAmmoType();
	message("Remember to buy "..ammoType.."! You have "..ammoCount.." left. Look for "..npc);
end

AR.lastZone = ""
function AR.ShouldSkipZone(zone)
	return AR.IsHordeCity(zone) and zone == AR.lastZone;
end

function AR.ShouldSkip(zone)
	return AR.ShouldSkipZone(zone) or not AR.LowAmmo();
end

function AR.FindAmmoVendorNpc(zone, subzone)
	if AR.UsesArrows() then
		return AR.FindHordeArrowVendorNpc(zone, subzone)
	elseif AR.UsesBullets() then
		return AR.FindHordeBulletVendorNpc(zone, subzone)
	end
end

function AR.HandleZoneChange(self, event, ...)
	local ammoType = AR.GetAmmoType()
	AR.DebugPrint(ammoType)

	local subzone = GetSubZoneText()
	local zone = GetZoneText()

	AR.DebugPrint("Checking for ammo vendors in "..subzone..", "..zone)
	AR.DebugPrint(ShouldSkip(zone))

	local npc = AR.FindAmmoVendorNpc(zone, subzone)
	if npc ~= nil and not AR.ShouldSkip(zone) then
		AR.Remind(npc)
	end

	AR.lastZone = zone
end

local ZoneChange_EventFrame = CreateFrame("Frame")
ZoneChange_EventFrame:RegisterEvent("ZONE_CHANGED")
ZoneChange_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

local ZoneChangeIndoors_EventFrame = CreateFrame("Frame")
ZoneChangeIndoors_EventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
ZoneChangeIndoors_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

local ZoneChangeNewArea_EventFrame = CreateFrame("Frame")
ZoneChangeNewArea_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
ZoneChangeNewArea_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

print("Loaded AmmoReminder")
