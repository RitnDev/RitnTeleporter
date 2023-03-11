local modules = {}
------------------------------------------------------------------------------

-- Inclus les events onInit et onLoad + les ajouts de commandes
modules.globals =               require(ritnlib.defines.teleporter.modules.globals)
modules.events =                require(ritnlib.defines.teleporter.modules.events)

---- Modules désactivable
modules.player =            require(ritnlib.defines.teleporter.modules.player) 
modules.teleporter =        require(ritnlib.defines.teleporter.modules.teleporter) 
------------------------------------------------------------------------------
return modules