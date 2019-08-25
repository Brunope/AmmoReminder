local AR = AmmoReminder

local allianceArrowSubzoneToNpc = {
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

	-- bowyer
	["Sentinel Hill"]="William MacGregor",
	["Talrendis Point"]="Brinna Valanaar",
	["Silverwind Refuge"]="Bhaldaran Ravenshade",
	["Booty Bay"]="Haren Kanmae",

	-- misc
	["Corporal Bluth"]="Rebel Camp",
	["Thorium Point"]="Master Smith Burninate",
	["Light's Hope Chapel"]="Caretaker Alen",
	["Cenarion Hold"]="Calandrath",	
}

-- TODO: Super-Seller 680 ?

function AR:FindAllianceArrowVendorNpc(zone, subzone)
	local npc = allianceArrowSubzoneToNpc[subzone]
	if npc ~= nil then
		return npc
	end

	return self:FindAllianceCityVendorNpc(zone)
end
