local AR = AmmoReminder;

local CITIES_KEY = "CITIES"
local SUBZONES_KEY = "SUBZONES"

local COMPONENT_MAP = {
	["Alliance"] = {
		[CITIES_KEY] = {
			["Stormwind City"]="Thurman Mullby",
			["Darnassus"]="Mydrannul",
			["City of Ironforge"]="Bryllia Ironbrand"
		}
		[SUBZONES_KEY] = {
			["arrows"] = {
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
				["Cenarion Hold"]="Calandrath"
			}, 
			["bullets"] = {
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
				["Light's Hope Chapel"]="Caretaker Alen"
			}
		}
	},
	["Horde"] = {
		[CITIES_KEY] = { //TODO: This has to become a component list.
			["Orgrimmar"]="Trak'gen",
			["Undercity"]="Eleanor Rusk",
			["Thunder Bluff"]="Kuruk"
		},
		[SUBZONES_KEY] = {
			["arrows"] = {
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
			},
			["bullets"] = {
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
				["Mirage Raceway"]="Synge",
				["Marshal's Refuge"]="Nergal"
			},
			["candles"] = {
			
			},
			["ankhs"] = {
			
			},
		}
	}
}

function AR:IsUsersFactionCity(zone)
	return COMPONENT_MAP[self.faction][CITIES_KEY][zone] ~= nil
end

function AR:FindCityVendorNpc(faction, zone)
	npc = COMPONENT_MAP[faction][CITIES_KEY][zone]

	-- this is a pro hackerman move
	if npc ~= nil and UnitLevel("player") == 60 then
		npc = "the Auction House"
	end

	return npc
end

function AR:FindComponentForZone(faction, zone, subzone, componentType) 
	local npc = COMPONENT_MAP[faction][CITIES_KEY][componentType][subzone]
	if npc ~= nil then
		return npc
	end

	return self:FindCityVendorNpc(faction, zone)
end

function AR:FindArrowVendorNpc(zone, subzone)
	return self:FindComponentForZone(self.faction, zone, subzone, "arrows")
end

function AR:FindBulletVendorNpc(zone, subzone)
	return AR:FindComponentForZone(self.faction, zone, subzone, "bullets")
end
