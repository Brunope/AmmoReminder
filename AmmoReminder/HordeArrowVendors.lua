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
	["Sen'jin Village"]="K'waii",
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

-- TODO: Super-Seller 680 ?

function FindHordeArrowVendorNpc(zone, subzone)
	local npc = hordeArrowSubzoneToNpc[subzone]
	if npc ~= nil then
		return npc
	end

	return FindHordeCityVendorNpc(zone)
end
