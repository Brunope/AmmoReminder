local AR = AmmoReminder;
local ARROWS_KEY = "ARROWS"
local BULLETS_KEY = "BULLETS"

--need to change the table structure for this.  don't think it's right.
local COMPONENT_TYPES = {
	["PRIEST"] = {
		["candles"] = true
	},
	["SHAMAN"] = {
		"ankh"
	},
	["HUNTER"] = {
		["BULLETS"] = {
			["GUNS"] = true
		},
		["ARROWS"] = {
			["CROSSBOWS"] = true,
			["BOWS"] = true
		}		
	},
	["ROGUE"] = {
		
	},
	["WARRIOR"] = {
		
	},
	["MAGE"] = {
	
	},
	["WARLOCK"] = {
	
	},
	["PALADIN"] = {
	
	},
	["DRUID"] = {
	
	}
}

function AR:GetRangedWeaponType()
	local link = GetInventoryItemLink(
		"player", GetInventorySlotInfo("RangedSlot"));

	if link == nil then
		return "Missing";
	end;
	local _, _, _, _, _, _, itemType = GetItemInfo(link);
	return itemType;
end;

function AR:UsesAmmoType(bulletType) 
	local weaponType = self:GetRangedWeaponType()
	return COMPONENT_TYPES[self.class][bulletType][weaponType] ~= nil
end

function AR:UsesComponentType(componentType) 
	return COMPONENT_TYPES[self.class][componentType] ~= nil
end

function AR:UsesArrows()
	return self:UsesType(ARROWS_KEY)
end

function AR:UsesBullets()
	return self:UsesType(BULLETS_KEY)
end

-- I think this can be replaced with GetEquippedAmmoName but I
-- can't test it yet
function AR:GetAmmoType()
	if self:UsesArrows() then
		return ARROWS_KEY
	elseif self:UsesBullets() then
		return BULLETS_KEY
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

function AR:LowAmmo()
	return self:GetEquippedAmmoAmount() < self.db.profile.ammoThreshold;
end
