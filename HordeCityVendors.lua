local AR = AmmoReminder;
local CITIES_KEY = "CITIES"
local SUBZONES_KEY = "SUBZONES"

local COMPONENT_MAP = {
	["Alliance"] = {
		["CITIES"] = {
		
		}
		["SUBZONES"]
	},
	["Horde"] = {
		["CITIES"] = {
			["Orgrimmar"]="Trak'gen",
			["Undercity"]="Eleanor Rusk",
			["Thunder Bluff"]="Kuruk"
		},
		["SUBZONES"] = {
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
			}
		}
	}
}

function AR:IsHordeCity(zone)
	return COMPONENT_MAP["Horde"]["CITIES"][zone] ~= nil
end

function AR:FindHordeCityVendorNpc(zone)
	npc = COMPONENT_MAP["Horde"]["CITIES"][zone]

	-- this is a pro hackerman move
	if npc ~= nil and UnitLevel("player") == 60 then
		npc = "the Auction House"
	end

	return npc
end
