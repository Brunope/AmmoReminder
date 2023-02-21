local AR = AmmoReminder

local function Is60()
	return UnitLevel("player") == 60
end

function AR:Remind(npc)
	local ammoCount = self:GetEquippedAmmoAmount();
	local ammoType = self:GetAmmoType();

	local str = (
		"Remember to buy "..ammoType.."! You have "..
		ammoCount.." left. Look for "..npc
	)

	if self.db.profile.showInChat then
		print(str)
	else
		message(str)
	end
end

function AR:ShouldSkipZoneAt60(zone)
	return self.db.profile.limitAt60 and Is60() and not self:IsHordeCity(zone)
end

function AR:ShouldSkipZone(zone)
	return (
		(self:IsHordeCity(zone) and zone == self.lastZone) or
		self:ShouldSkipZoneAt60(zone)
	)
end

function AR:ShouldSkipOnTaxi()
	return self.db.profile.disableOnTaxi and UnitOnTaxi("player")
end

local lastReminder = 0;
function AR:ShouldSkipTooSoon()
	local now = time()
	difference = now - lastReminder
	return (difference < self.db.profile.minWaitSeconds)
end

-- TODO: When exiting a flight path, check again for a reminder, since
-- we might have skipped the zone while flying.
-- PLEASE tell me there is an enter/exit taxi event
function AR:ShouldSkip(zone)
	return (
		self:ShouldSkipZone(zone) or
		not self:LowAmmo() or
		self:ShouldSkipOnTaxi()
		or self:ShouldSkipTooSoon()
	)
end

function AR:FindAmmoVendorNpc(zone, subzone)
	local faction = UnitFactionGroup("player")
	if faction == "Horde" then
		if self:UsesArrows() then
			return self:FindHordeArrowVendorNpc(zone, subzone)
		elseif self:UsesBullets() then
			return self:FindHordeBulletVendorNpc(zone, subzone)
		end
	else
		if self:UsesArrows() then
			return self:FindAllianceArrowVendorNpc(zone, subzone)
		elseif self:UsesBullets() then
			return self:FindAllianceBulletVendorNpc(zone, subzone)
		end
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

	if AR:ShouldSkip(zone) then
		return
	end

	AR.lastZone = zone

	local npc = AR:FindAmmoVendorNpc(zone, subzone)
	if npc ~= nil then
		AR:Remind(npc)
		lastReminder = time()
	end
end
