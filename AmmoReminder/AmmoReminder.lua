local AR = AmmoReminder;

function AR:DebugPrint(s)
	if self.debugMode then
		print(s)
	end
end

function AR:OnInitialize()
	self:LoadAceOptions()

	self.debugMode = true
	self.lastZone = ""
end

function AR:OnEnable()
	self:RegisterEventHandlers()
	print("AmmoReminder enabled")
end

function AR:OnDisable()
	-- TODO
end

function AR:RegisterEventHandlers()
	-- TODO: use ace events?
	local ZoneChange_EventFrame = CreateFrame("Frame")
	ZoneChange_EventFrame:RegisterEvent("ZONE_CHANGED")
	ZoneChange_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

	local ZoneChangeIndoors_EventFrame = CreateFrame("Frame")
	ZoneChangeIndoors_EventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
	ZoneChangeIndoors_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)

	local ZoneChangeNewArea_EventFrame = CreateFrame("Frame")
	ZoneChangeNewArea_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	ZoneChangeNewArea_EventFrame:SetScript("OnEvent", AR.HandleZoneChange)
end
