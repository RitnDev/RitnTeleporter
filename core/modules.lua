local modules = {}
------------------------------------------------------------------------------

-- Inclus les events onInit et onLoad + les ajouts de commandes
modules.events =                require(ritnlib.defines.teleporter.modules.events)
modules.interfaces =            require(ritnlib.defines.teleporter.modules.interfaces)
--modules.commands =              require(ritnlib.defines.teleporter.modules.commands)

---- Modules désactivable
modules.player =              require(ritnlib.defines.teleporter.modules.player) 
modules.teleporter =              require(ritnlib.defines.teleporter.modules.teleporter) 
------------------------------------------------------------------------------
return modules