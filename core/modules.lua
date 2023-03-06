local modules = {}
------------------------------------------------------------------------------

-- Inclus les events onInit et onLoad + les ajouts de commandes
modules.events =                require(ritnlib.defines.teleporter.modules.events)
modules.interfaces =            require(ritnlib.defines.teleporter.modules.interfaces)
--modules.commands =              require(ritnlib.defines.teleporter.modules.commands)

---- Modules désactivable
if global.teleporter.modules.player then 
    modules.player =            require(ritnlib.defines.teleporter.modules.player) 
end
if global.teleporter.modules.teleporter then 
    modules.teleporter =        require(ritnlib.defines.teleporter.modules.teleporter) 
end
------------------------------------------------------------------------------
return modules