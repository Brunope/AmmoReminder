AmmoReminder = LibStub("AceAddon-3.0"):NewAddon(
	"AmmoReminder", "AceConsole-3.0")

local defaults = {
    profile = {
        showInChat = false,
		ammoThreshold = 1600,
    },
}

local options = {
    name = "AmmoReminder",
    handler = AmmoReminder,
    type = "group",
    args = {
        showInChat = {
            type = "toggle",
            name = "Show in Chat",
            desc = "Print reminder in chat instead of a message dialog.",
            get = "IsShowInChat",
            set = "ToggleShowInChat",
        },
		ammoThreshold = {
			type = "range",
			name = "Low ammo threshold",
			desc = "Don't remind when ammo amount > threshold.",
			get = "GetAmmoThreshold",
			set = "SetAmmoThreshold",
			min = 0,
			max = 3200,
			step = 1,
			bigStep = 100,
		}
	}
}

local AR = AmmoReminder;

function AR:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("AmmoReminderDb", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("AmmoReminder", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
		"AmmoReminder", "AmmoReminder")
    self:RegisterChatCommand("ar", "ChatCommand")
    self:RegisterChatCommand("ammoreminder", "ChatCommand")

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

function AR:ChatCommand(input)
	-- TODO: always open interface options panel
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("ar", "AmmoReminder", input)
    end
end

function AR:IsShowInChat(info)
    return self.db.profile.showInChat
end

function AR:ToggleShowInChat(info, value)
    self.db.profile.showInChat = value
end

function AR:GetAmmoThreshold(info)
	return self.db.profile.ammoThreshold
end

function AR:SetAmmoThreshold(info, value)
	self.db.profile.ammoThreshold = value
end
