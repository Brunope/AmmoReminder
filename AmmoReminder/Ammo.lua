local AR = AmmoReminder;

function AR:GetRangedWeaponType()
	local link = GetInventoryItemLink("player",GetInventorySlotInfo("RangedSlot"));
	if link == nil then
		return "Missing";
	end;
	local _, _, _, _, _, _, itemType = GetItemInfo(link);
	return itemType;
end;

function AR:UsesArrows()
	local weaponType = self:GetRangedWeaponType()
	return weaponType == "Bows" or weaponType == "Crossbows"
end

function AR:UsesBullets()
	local weaponType = self:GetRangedWeaponType()
	return weaponType == "Guns"
end

-- I think this can be replaced with GetEquippedAmmoName but I
-- can't test it yet
function AR:GetAmmoType()
	if self:UsesArrows() then
		return "arrows"
	elseif self:UsesBullets() then
		return "bullets"
	end
end

function AR:GetEquippedAmmoName()
	local _, textureName = GetInventorySlotInfo("AmmoSlot")
	return textureName
end

function AR:GetEquippedAmmoAmount()
	local slotId, _ = GetInventorySlotInfo("AmmoSlot");
	local ammoCount = GetInventoryItemCount("player", slotId);
	if ammoCount == 1 and not GetInventoryItemTexture("player", slotId) then
		ammoCount = 0
	end
	return ammoCount
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

function AR:LowAmmo()
	local level = UnitLevel("player");
	local threshold = levelToAmmoThreshold[RoundDownTen(level)];
	return self:GetEquippedAmmoAmount() < threshold;
end
