-- Initialisation des variables storage
require("core.defines")
require(ritnlib.defines.teleporter.setup)
-- Activation de gvv s'il est présent
if script.active_mods["gvv"] then require(ritnlib.defines.gvv)() end
-- envoie des modules à l'event listener :
local listener = require(ritnlib.defines.event).add_libraries(require(ritnlib.defines.teleporter.modules.core))
