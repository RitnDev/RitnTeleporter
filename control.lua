-- Initialisation des variables globals
if not ritnlib then require("__RitnLib__/defines") end
require("__RitnCoreGame__.core.defines")
require("__RitnBaseGame__.core.defines")
require("__RitnTeleporter__.core.defines")
-- Activation de gvv s'il est présent
if script.active_mods["gvv"] then require(ritnlib.defines.gvv)() end
-- envoie des modules à l'event listener :
local listener = require(ritnlib.defines.event).add_libraries(require(ritnlib.defines.teleporter.modules.core))
