-- RitnTeleporterSurface
----------------------------------------------------------------
local table = require(ritnlib.defines.table)
----------------------------------------------------------------
--- CLASSE DEFINES
----------------------------------------------------------------
RitnTeleporterSurface = ritnlib.classFactory.newclass(RitnCoreSurface, function(self, LuaSurface)
    RitnCoreSurface.init(self, LuaSurface)
    --------------------------------------------------
    self.data_teleporter = remote.call("RitnCoreGame", "get_data", "teleporter")
    --------------------------------------------------
    log('> [RitnTeleporter] > RitnTeleporterSurface')
end)

----------------------------------------------------------------


function RitnTeleporterSurface:createTeleporter(rEvent)
    -- check capsule
    local LuaItem = rEvent.event.item
    local rPlayer = rEvent:getPlayer()
    local position = rEvent.position

    if LuaItem.name ~= ritnlib.defines.teleporter.names.item.capsule then return end
        
    -- check tile
    local LuaTile = self.surface.get_tile(position.x, position.y)
    if string.sub(LuaTile.name,1,string.len("water")) == "water" then return end 
    if global.teleporter.tileNoTeleporter[LuaTile.name] then return end 
    log("> "..self.object_name..":createTeleporter()")

    local tabEntities = self.surface.find_entities_filtered({
        name=ritnlib.defines.teleporter.names.entity.teleporter, 
        position=position,
        radius=3,
    })
    if table.length(tabEntities) > 0 then 
        rPlayer.player.insert({name=ritnlib.defines.teleporter.names.item.capsule, amount=1})
        return 
    end

    -- create entity
    local LuaEntity = self.surface.create_entity({ 
        name = ritnlib.defines.teleporter.names.entity.teleporter,
        position = position,
        force = rPlayer.force.name,
        raise_built = true,
        create_build_effect_smoke = true
    })
    local id_teleporter = LuaEntity.unit_number
    

    --create render text
    local renderId = rendering.draw_text{
        text="tp: " .. id_teleporter .. " ~ " .. self.name,
        surface=self.surface,
        target=LuaEntity,
        alignment = "center",
        target_offset={0, -2.0},
        color = {r = 0.115, g = 0.955, b = 0.150, a = 1},
        scale_with_zoom = true,
        scale = 1.5
    }

    local tag = rPlayer.force.add_chart_tag(self.surface, {
        position=position,
        icon= {type = "virtual", name = ritnlib.defines.teleporter.names.entity.teleporter},	
        text= "tp: " .. id_teleporter .. " ~ " .. self.name,
        last_user = rPlayer.player
    })

    local nbTeleporter = table.length(self.data[self.name].teleporters)

    -- init data teleporter
    local data_teleporter = self.data_teleporter
    self.data[self.name].teleporters[id_teleporter] = data_teleporter
    self.data[self.name].teleporters[id_teleporter].id = id_teleporter
    self.data[self.name].teleporters[id_teleporter].name = "tp: " .. id_teleporter .. " ~ " .. self.name
    self.data[self.name].teleporters[id_teleporter].position = position
    self.data[self.name].teleporters[id_teleporter].render_id = renderId
    self.data[self.name].teleporters[id_teleporter].tag_number = tag.tag_number
    self.data[self.name].teleporters[id_teleporter].surface_name = self.surface.name
    self.data[self.name].teleporters[id_teleporter].force_name = rPlayer.force.name
    self.data[self.name].teleporters[id_teleporter].index = nbTeleporter + 1

    self:update()

end



function RitnTeleporterSurface:removeTeleporter(rEvent)
    local LuaEntity = rEvent.entity 
    local position = LuaEntity.position

    if LuaEntity == nil then return end 
    if LuaEntity.valid == false then return end
    if LuaEntity.name ~= ritnlib.defines.teleporter.names.entity.teleporter then return end
    log("> "..self.object_name..":removeTeleporter()")

    local id_teleporter = LuaEntity.unit_number
    local tag_number = self.data[self.name].teleporters[id_teleporter].tag_number
    local index = self.data[self.name].teleporters[id_teleporter].index

    self.data[self.name].teleporters[id_teleporter] = nil
    
    local area = {
        {position.x - 0.5, position.y - 0.5},
        {position.x + 0.5, position.y + 0.5},
    }
    local tabTag = LuaEntity.force.find_chart_tags(LuaEntity.surface, area)

    if table.length(tabTag) > 0 then 
        tabTag[1].destroy()
    end

    -- mise à jour des index des teleporters
    local teleporters = self.data[self.name].teleporters
    for _,teleporter in pairs(teleporters) do 
        if (teleporter.index > index) then 
            teleporter.index = teleporter.index - 1
        end
    end
    self.data[self.name].teleporters = teleporters

    self:update()
end




