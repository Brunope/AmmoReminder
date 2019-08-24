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
