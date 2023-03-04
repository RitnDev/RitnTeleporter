--INITIALIZE
--------------------------------------------------------------
if not ritnlib then require("__RitnLib__/defines") end
require("core.defines")
--------------------------------------------------------------
require(ritnlib.defines.teleporter.prototypes.category)
require(ritnlib.defines.teleporter.prototypes.entity)
require(ritnlib.defines.teleporter.prototypes.item)
require(ritnlib.defines.teleporter.prototypes.technology)
require(ritnlib.defines.teleporter.prototypes.styles)
require(ritnlib.defines.teleporter.prototypes.inputs)
require(ritnlib.defines.fonts) -- FONTS

-- get settings
local setting_value = settings.startup[ritnlib.defines.teleporter.settings.teleporter_enable.name].value

-- active teleporter
if setting_value then
    local tech = data.raw.technology[ritnlib.defines.teleporter.names.technology.teleport]
    tech.hidden = false
    tech.enabled = true
    ----
    tech = data.raw.technology[ritnlib.defines.teleporter.names.technology.capsule]
    tech.hidden = false
    tech.enabled = true
end
