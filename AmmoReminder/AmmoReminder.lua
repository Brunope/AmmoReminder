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
	["Stonetalon Mountains"]="Grawnal",
	["Tarren Mill"]="Kayren Soothallow",
	["The Crossroads"]="Uthrok",
	["The Sepulcher"]="Edwin Harly",
	["Thorium Point"]="Master Smith Burninate",
	["Valley of Trials"]="Duokna"
}

local function HandleZoneChange(self, event, ...)
	local subzone = GetSubZoneText()
	local zone = GetZoneText()
	print("Checking for ammo vendors in "..subzone..", "..zone)
	local npc = hordeArrowSubzoneToNpc[subzone]
	if npc ~= nil then
		message("Remember to buy arrows! Look for "..npc)
	end
end

local ZoneChange_EventFrame = CreateFrame("Frame")
ZoneChange_EventFrame:RegisterEvent("ZONE_CHANGED")
ZoneChange_EventFrame:SetScript("OnEvent", HandleZoneChange)
		
local ZoneChangeIndoors_EventFrame = CreateFrame("Frame")
ZoneChangeIndoors_EventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
ZoneChangeIndoors_EventFrame:SetScript("OnEvent", HandleZoneChange)

local ZoneChangeNewArea_EventFrame = CreateFrame("Frame")
ZoneChangeNewArea_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
ZoneChangeNewArea_EventFrame:SetScript("OnEvent", HandleZoneChange)

print("Loaded AmmoReminder")
