AmmoReminder = LibStub("AceAddon-3.0"):NewAddon(
	"AmmoReminder", "AceConsole-3.0")

local defaults = {
    profile = {
        showInChat = false,
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
			name = "Ammo amount reminder threshold",
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

function AmmoReminder:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("AmmoReminderDb", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("AmmoReminder", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
		"AmmoReminder", "AmmoReminder")
    self:RegisterChatCommand("ar", "ChatCommand")
    self:RegisterChatCommand("ammoreminder", "ChatCommand")

	AmmoReminder.debugMode = true;
end

function AmmoReminder:OnEnable()
	AmmoReminder.RegisterEventHandlers()
	print("AmmoReminder enabled")
end

function AmmoReminder:OnDisable()

end

function AmmoReminder:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("wh", "WelcomeHome", input)
    end
end

function AmmoReminder:IsShowInChat(info)
    return self.db.profile.showInChat
end

function AmmoReminder:ToggleShowInChat(info, value)
    self.db.profile.showInChat = value
end

function AmmoReminder:GetAmmoThreshold(info)
	return self.db.profile.ammoThreshold
end

function AmmoReminder:SetAmmoThreshold(info, value)
	self.db.profile.ammoThreshold = value
end
