local hordeBulletSubzoneToNpc = {
	["Shadowprey Village"]="Tukk",
	["Bloodhoof Village"]="Moorat Longstride",
	["Tarren Mill"]="Kayren Soothallow",
	["Camp Narache"]="Kawnie Softbreeze",
	["Sen'jin Village"]="K'waii",
	["Freewind Post"]="Starn",
	["Gadgetzan"]="Blizrik Buckshot",
	["Camp Mojache"]="Cawind Trueaim",
	["The Crossroads"]="Uthrok",
	["Everlook"]="Wixxrak",
	["Freewind Post"]="Starn",
	["Razor Hill"]="Jark",
	["Sun Rock Retreat"]="Grawnal",
	["Hammerfall"]="Graud",
	["Valley of Trials"]="Duokna",
	["Bloodvenom Post"]="Bale",
	["Steamwheedle Port"]="Jabbey",
	["Nighthaven"]="Daeolyn Summerleaf",
	["Grom'gol Base Camp"]="Uthok",
	["Brill"]="Mrs. Winters",
	["Deathknell"]="Joshua Kien",
	["The Sepulcher"]="Edwin Harly",
	["Ratchet"]="Jazzik",
	["Splintertree Post"]="Burkrum",
	["Booty Bay"]="Mazk Snipeshot",
	["Thorium Point"]="Master Smith Burninate",
	["Steamwheedle Port"]="Jabbey",
	["Light's Hope Chapel"]="Caretaker Alen",
	["Cenarion Hold"]="Calandrath",
	["TODO (somewhere in Shimmering Flats)"]="Synge",
	["Marshal's Refuge"]="Nergal"
}

-- TODO: Super-Seller 680 ?

function FindHordeBulletVendorNpc(zone, subzone)
	local npc = hordeBulletSubzoneToNpc[subzone]
	if npc ~= nil then
		return npc
	end

	return FindHordeCityVendorNpc(zone)
end
