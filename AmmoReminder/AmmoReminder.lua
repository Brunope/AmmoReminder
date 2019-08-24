local AR = AmmoReminder;

function AR:DebugPrint(s)
	if self.debugMode then
		print(s)
	end
end

function AR:Remind(npc)
	local ammoCount = self:GetEquippedAmmoAmount();
	local ammoType = self:GetAmmoType();

	local str = "Remember to buy "..ammoType.."! You have "..ammoCount.." left. Look for "..npc;

	if self.db.profile.showInChat then
		print(str)
	else
		message(str)
	end
end

function AR:ShouldSkipZone(zone)
	return self:IsHordeCity(zone) and zone == self.lastZone;
end

function AR:ShouldSkip(zone)
	return self:ShouldSkipZone(zone) or not self:LowAmmo();
end

function AR:FindAmmoVendorNpc(zone, subzone)
	if self:UsesArrows() then
		return self:FindHordeArrowVendorNpc(zone, subzone)
	elseif self:UsesBullets() then
		return self:FindHordeBulletVendorNpc(zone, subzone)
	end
end

-- TODO: self:?
function AR.HandleZoneChange(self, event, ...)
	local ammoType = AR:GetAmmoType()
	AR:DebugPrint(ammoType)

	local subzone = GetSubZoneText()
	local zone = GetZoneText()

	AR:DebugPrint("Checking for ammo vendors in "..subzone..", "..zone)
	AR:DebugPrint(AR:ShouldSkip(zone))

	local npc = AR:FindAmmoVendorNpc(zone, subzone)
	if npc ~= nil and not AR:ShouldSkip(zone) then
		AR:Remind(npc)
	end

	AR.lastZone = zone
end

function AR:RegisterEventHandlers()
	-- TODO: use ace events?
	local ZoneChange_EventFrame = CreateFrame("Frame")
	ZoneChange_EventFrame:RegisterEvent("ZONE_CHANGED")
	ZoneChange_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

	local ZoneChangeIndoors_EventFrame = CreateFrame("Frame")
	ZoneChangeIndoors_EventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
	ZoneChangeIndoors_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

	local ZoneChangeNewArea_EventFrame = CreateFrame("Frame")
	ZoneChangeNewArea_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	ZoneChangeNewArea_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)
end
