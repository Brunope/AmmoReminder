function GetEquippedAmmoName()
	local _, textureName = GetInventorySlotInfo("AmmoSlot")
	return textureName
end

function GetEquippedAmmoAmount()
	local slotId, _ = GetInventorySlotInfo("AmmoSlot");
	local ammoCount = GetInventoryItemCount("player", slotId);
	if ammoCount == 1 and not GetInventoryItemTexture("player", slotId) then
		ammoCount = 0
	end
	return ammoCount
end
