-- RitnTeleporter
----------------------------------------------------------------
local class = require(ritnlib.defines.class.core)
----------------------------------------------------------------
local RitnGuiTeleporter = require(ritnlib.defines.teleporter.class.guiTeleporter)
----------------------------------------------------------------
local pattern = "([^-]*)~?([^-]*)~?([^-]*)"
----------------------------------------------------------------





----------------------------------------------------------------
local RitnTeleporter = class.newclass(function(base, LuaEntity)
    if LuaEntity == nil then return end
    if LuaEntity.valid == false then return end
    if LuaEntity.object_name ~= "LuaEntity" then return end
    if LuaEntity.name ~= ritnlib.defines.teleporter.names.entity.teleporter then return end
    base.object_name = "RitnTeleporter"
    --------------------------------------------------
    base.entity = LuaEntity
    base.surface = LuaEntity.surface
    base.force = LuaEntity.force
    base.position = LuaEntity.position
    base.drive = LuaEntity.get_driver()
    ----
    base.name = LuaEntity.name
    base.id = LuaEntity.unit_number
    ----
    local surfaces = remote.call("RitnCoreGame", "get_surfaces")
    base.data = surfaces[base.surface.name].teleporters[base.id]
    --------------------------------------------------
end)
----------------------------------------------------------------


function RitnTeleporter:open(event)
    if self.entity == nil then return end 
    if self.name ~= ritnlib.defines.teleporter.names.entity.teleporter then return end
    if self.data == nil then return end
    RitnGuiTeleporter(event):action_open(self)
end


function RitnTeleporter:close(event)
    if self.entity == nil then return end 
    if self.name ~= ritnlib.defines.teleporter.names.entity.teleporter then return end
    if self.data == nil then return end
    RitnGuiTeleporter(event):action_close()
end


----------------------------------------------------------------
return RitnTeleporter