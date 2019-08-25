local AR = AmmoReminder;

-- general goods vendors, sell both arrows and bullets
local allianceCityToNpc = {
	["Stormwind City"]="Thurman Mullby",
	["Darnassus"]="Mydrannul",
	["Ironforge"]="Bryllia Ironbrand"
}

function AR:IsAllianceCity(zone)
	return allianceCityToNpc[zone] ~= nil
end

function AR:FindAllianceCityVendorNpc(zone)
	npc = allianceCityToNpc[zone]

	-- this is a pro hackerman move
	if npc ~= nil and UnitLevel("player") == 60 then
		npc = "the Auction House"
	end

	return npc
end
