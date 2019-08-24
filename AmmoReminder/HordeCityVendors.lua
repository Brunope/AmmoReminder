local AR = AmmoReminder;

local hordeArrowCityToNpc = {
	["Orgrimmar"]="Trak'gen",
	["Undercity"]="Eleanor Rusk",
	["Thunder Bluff"]="Kuruk"
}

function AR:IsHordeCity(zone)
	return hordeArrowCityToNpc[zone] ~= nil
end

function AR:FindHordeCityVendorNpc(zone)
	npc = hordeArrowCityToNpc[zone]

	-- this is a pro hackerman move
	if npc ~= nil and UnitLevel("player") == 60 then
		npc = "the Auction House"
	end

	return npc
end
