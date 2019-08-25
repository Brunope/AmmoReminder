local AR = AmmoReminder

local allianceBulletSubzoneToNpc = {
	-- general goods
	["Marshal's Refuge"]="Nergal",
	["Steamwheedle Port"]="Jabbey",
	["Nighthaven"]="Daeolyn Summerleaf",
	["Refuge Pointe"]="Vikki Lonsav",
	["Southshore"]="Sarah Raycroft",
	["Menethil Harbor"]="Neal Allen",
	["Starfall Village"]="Natheril Raincaller",
	["Talonbranch Glade"]="Malygen",
	["Darkshire"]="Mabel Solaj",
	["Astranaar"]="Haljan Oakheart",
	["Auberdine"]="Dalmond",
	["Nijel's Point"]="Christi Galvanis",
	["Theramore Isle"]="Charity Mipsy",

	-- general supplies
	["Thelsamar"]="Yanni Stoutheart",
	["The Farstrider Lodge"]="Xandar Goodbeard",
	["Shadowglen"]="Lyrai",
	["Lakeshire"]="Lindsay Ashlock",
	["Kharanos"]="Kreg Bilmn",
	["Feathermoon Stronghold"]="Faralorn",
	["Stonetalon Peak"]="Chylina",
	["Northshire"]="Brother Danil",
	["Goldshire"]="Brog Hamfist",
	["Dolanaar"]="Aldia",
	["Coldridge Valley"]="Adlin Pridedrift",
	["Ratchet"]="Jazzik",
	["Eastvale Logging Camp"]="Drake Lindgren",

	-- gun merchants / gunsmith / misc
	["Mirage Raceway"]="Synge",
	["Everlook"]="Wixxrak",
	["Booty Bay"]="Mazk Snipeshot",
	["Gadgetzan"]="Blizrik Buckshot",
	["Cenarion Hold"]="Calandrath",
	["Light's Hope Chapel"]="Caretaker Alen",
}

-- TODO: wtf is the subzone for Hegnar Rumbleshot? he's on the damn road
-- TODO: Super-Seller 680 ?

function AR:FindAllianceBulletVendorNpc(zone, subzone)
	local npc = allianceBulletSubzoneToNpc[subzone]
	if npc ~= nil then
		return npc
	end

	return self:FindAllianceCityVendorNpc(zone)
end
