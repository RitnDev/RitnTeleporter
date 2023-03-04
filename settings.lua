--INITIALIZE
require("core.defines")

data:extend {

	-- STARTUP SETTINGS
	{
		-- Activation des téléporteurs
		type = "bool-setting",
		name = ritnlib.defines.teleporter.settings.teleporter_enable.name,
		setting_type = "startup",
		default_value = ritnlib.defines.teleporter.settings.teleporter_enable.value,
		order = ritnlib.defines.teleporter.prefix.name .. "tp-01"
	},
	
}