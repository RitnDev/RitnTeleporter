-- RitnTeleporter
----------------------------------------------------------------
--- CLASSE DEFINES
----------------------------------------------------------------
RitnTeleporter = ritnlib.classFactory.newclass(function(self, LuaEntity)
    if LuaEntity == nil then return end
    if LuaEntity.valid == false then return end
    if LuaEntity.object_name ~= "LuaEntity" then return end
    if LuaEntity.name ~= ritnlib.defines.teleporter.names.entity.teleporter then return end
    self.object_name = "RitnTeleporter"
    --------------------------------------------------
    log('> '..self.object_name..'() -> init ok !')
    self.entity = LuaEntity
    self.surface = LuaEntity.surface
    self.force = LuaEntity.force
    self.position = LuaEntity.position
    self.drive = LuaEntity.get_driver()
    ----
    self.name = LuaEntity.name
    self.id = LuaEntity.unit_number
    ----
    local surfaces = remote.call("RitnCoreGame", "get_surfaces")
    self.data = surfaces[self.surface.name].teleporters[self.id]
    --------------------------------------------------
end)
----------------------------------------------------------------


function RitnTeleporter:exist()
    if self.entity == nil then return false end 
    if self.name ~= ritnlib.defines.teleporter.names.entity.teleporter then return false end
    if self.data == nil then return false end

    return true
end
