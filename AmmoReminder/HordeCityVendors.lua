local hordeArrowCityToNpc = {
	["Orgrimmar"]="Trak'gen",
	["Undercity"]="Eleanor Rusk",
	["Thunder Bluff"]="Kuruk"
}

function IsHordeCity(zone)
	return hordeArrowCityToNpc[zone] ~= nil
end

function FindHordeCityVendorNpc(zone)
	return hordeArrowCityToNpc[zone]
end
