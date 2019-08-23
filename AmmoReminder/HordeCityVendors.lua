local AR = AmmoReminder;

local hordeArrowCityToNpc = {
	["Orgrimmar"]="Trak'gen",
	["Undercity"]="Eleanor Rusk",
	["Thunder Bluff"]="Kuruk"
}

function AR.IsHordeCity(zone)
	return hordeArrowCityToNpc[zone] ~= nil
end

function AR.FindHordeCityVendorNpc(zone)
	return hordeArrowCityToNpc[zone]
end
