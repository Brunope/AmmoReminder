local AR = AmmoReminder

local defaults = {
	profile = {
		limitAt60 = true,
		disableOnTaxi = true,
		showInChat = false,
		ammoThreshold = 1600,
		minWaitSeconds = 300,
	},
}

local options = {
	name = "AmmoReminder",
	handler = AmmoReminder,
	type = "group",
	args = {
		showInChat = {
			type = "toggle",
			name = "Remind only in chat",
			desc = "Print reminder in chat instead of a message dialog.",
			get = "IsShowInChat",
			set = "ToggleShowInChat",
		},
		limitAt60 = {
			type = "toggle",
			name = "Limit at 60",
			desc = "At level 60, only remind when in a major city.",
			get = "IsLimitAt60",
			set = "ToggleLimitAt60",
		},
		disableOnTaxi = {
			type = "toggle",
			name = "Disable on flight paths",
			desc = "Don't remind when passing through zones on a flight path.",
			get = "IsDisableOnTaxi",
			set = "ToggleDisableOnTaxi",
		},
		ammoThreshold = {
			type = "range",
			name = "Low ammo threshold",
			desc = "Only remind when ammo amount is below threshold.",
			get = "GetAmmoThreshold",
			set = "SetAmmoThreshold",
			min = 0,
			max = 3200,
			step = 1,
			bigStep = 100,
		},
		minWaitSeconds = {
			type = "range",
			name = "Minimum wait seconds",
			desc = "Don't remind until this many seconds have passed since the last reminder.",
			get = "GetMinWaitSeconds",
			set = "SetMinWaitSeconds",
			min = 0,
			max = 3200,
			step = 1,
			bigStep = 100,
		}
	}
}

function AR:LoadAceOptions()
	self.db = LibStub("AceDB-3.0"):New("AmmoReminderDb", defaults, true)

	LibStub("AceConfig-3.0"):RegisterOptionsTable("AmmoReminder", options)
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
		"AmmoReminder", "AmmoReminder")
	self:RegisterChatCommand("ar", "ChatCommand")
	self:RegisterChatCommand("ammoreminder", "ChatCommand")
end

function AR:ChatCommand(input)
	-- For some reason, after a reload, "/ar" opens up the Controls
	-- options page. Any further "/ar" opens up the AmmoReminder options
	-- page. Fuck it, do it twice.
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function AR:IsShowInChat(info)
	return self.db.profile.showInChat
end

function AR:ToggleShowInChat(info, value)
	self.db.profile.showInChat = value
end

function AR:IsLimitAt60(info)
	return self.db.profile.limitAt60
end

function AR:ToggleLimitAt60(info, value)
	self.db.profile.limitAt60 = value
end

function AR:IsDisableOnTaxi(info)
	return self.db.profile.disableOnTaxi
end

function AR:ToggleDisableOnTaxi(info, value)
	self.db.profile.disableOnTaxi = value
end

function AR:GetAmmoThreshold(info)
	return self.db.profile.ammoThreshold
end

function AR:SetAmmoThreshold(info, value)
	self.db.profile.ammoThreshold = value
end

function AR:GetMinWaitSeconds(info)
	return self.db.profile.minWaitSeconds
end

function AR:SetMinWaitSeconds(info, value)
	self.db.profile.minWaitSeconds = value
end
