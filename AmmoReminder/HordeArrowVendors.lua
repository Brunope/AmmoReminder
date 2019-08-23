local hordeArrowSubzoneToNpc = {
	["Darkspear Training Grounds"]="Test",
	["Bloodhoof Village"]="Moorat Longstride",
	["Bloodvenom Post"]="Bale",
	["Booty Bay"]="Haren Kanmae",
	["Brackenwall Village"]="Zanara",
	["Brill"]="Mrs. Winters",
	["Camp Mojache"]="Cawind Trueaim",
	["Camp Narache"]="Kawnie Softbreeze",
	["Cenarion Hold"]="Calandrath",
	["Deathknell"]="Joshua Kien",
	["Freewind Post"]="Starn",
	["Grom'gol Base Camp"]="Uthok",
	["Hammerfall"]="Graud",
	["Light's Hope Chapel"]="Caretaker Alen",
	["Marshal's Refuge"]="Nergal",
	["Nighthaven"]="Daeolyn Summerleaf",
	["Ratchet"]="Jazzik",
	["Raventusk Village"]="Renn'az",
	["Razor Hill"]="Ghrawt",
	["Sen'jin Village"]="Trayexir",
	["Shadowprey Village"]="Tukk",
	["Splintertree Post"]="Burkrum",
	["Steamwheedle Port"]="Jabbey",
	["Sun Rock Retreat"]="Grawnal",
	["Tarren Mill"]="Kayren Soothallow",
	["The Crossroads"]="Uthrok",
	["The Sepulcher"]="Edwin Harly",
	["Thorium Point"]="Master Smith Burninate",
	["Valley of Trials"]="Duokna"
}

local hordeArrowCityToNpc = {
	["Orgrimmar"]="Trak'gen",
	["Undercity"]="Eleanor Rusk",
	["Thunder Bluff"]="Kuruk"
}

function IsHordeCity(zone)
	return hordeArrowCityToNpc[zone] ~= nil
end

function FindHordeArrowVendorNpc(zone, subzone)
	local npc = hordeArrowSubzoneToNpc[subzone]
	if npc ~= nil then
		return npc
	end

	return hordeArrowCityToNpc[zone]
end
