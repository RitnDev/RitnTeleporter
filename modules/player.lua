-- MODULE : PLAYER
---------------------------------------------------------------------------------------------



local function on_player_used_capsule(e)
    if storage.teleporter.modules.player == false then return end
    local rEvent = RitnCoreEvent(e)
    local rPlayer = rEvent:getPlayer()
    RitnTeleporterSurface(rPlayer.surface):createTeleporter(rEvent)
end



local function on_player_cursor_stack_changed(e) 
    if storage.teleporter.modules.player == false then return end
    local rPlayer = RitnCoreEvent(e):getPlayer()
    rPlayer:clearCursor(
        ritnlib.defines.teleporter.names.item.capsule, 
        ritnlib.defines.teleporter.names.caption.msg.cursor
    )
end



local function on_player_mined_entity(e)
    if storage.teleporter.modules.player == false then return end
    local rEvent = RitnCoreEvent(e)
    local LuaEntity = rEvent.entity 
    RitnTeleporterSurface(LuaEntity.surface):removeTeleporter(rEvent)

    -- On actualise le RitnGuiTeleporter s'il y en a un d'ouvert
    local rPlayer = rEvent:getPlayer()
    local LuaEntity = rPlayer.vehicle 

    if LuaEntity then 
        local rTeleporter = RitnTeleporter(LuaEntity)
        if rTeleporter then 
            
            local driving = false
            if rPlayer.driving and rTeleporter.drive ~= nil then
                if rTeleporter.drive.name == rPlayer.name then 
                    driving = true
                elseif rTeleporter.drive.type == "character" then 
                    if rTeleporter.drive.player.name == rPlayer.name then 
                        driving = true
                    end
                end
            end

            if driving then 
                if rTeleporter:exist() then 
                    RitnGuiTeleporter(e):action_open(rTeleporter)
                end
            end
        end
    else
        -- Si on vient de retirer un téléporteur et pas dans un autre téléporteur en même temps on ferme tous les GUI RitnGuiTeleporter
        RitnGuiTeleporter(e):action_close()  
    end

end


---------------------------------------------------------------------------------------------
local module = {events = {}}
---------------------------------------------------------------------------------------------
-- Events Player
module.events[defines.events.on_player_cursor_stack_changed] = on_player_cursor_stack_changed
module.events[defines.events.on_player_used_capsule] = on_player_used_capsule
module.events[defines.events.on_player_mined_entity] = on_player_mined_entity
---------------------------------------------------------------------------------------------
return module