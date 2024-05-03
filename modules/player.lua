-- MODULE : PLAYER
---------------------------------------------------------------------------------------------
local RitnEvent = require(ritnlib.defines.core.class.event)
local RitnSurface = require(ritnlib.defines.teleporter.class.surface)
local RitnTeleporter = require(ritnlib.defines.teleporter.class.teleporter)
local RitnGuiTeleporter = require(ritnlib.defines.teleporter.class.guiTeleporter)
---------------------------------------------------------------------------------------------


local function on_player_used_capsule(e)
    if global.teleporter.modules.player == false then return end
    local rEvent = RitnEvent(e)
    local rPlayer = rEvent:getPlayer()
    RitnSurface(rPlayer.surface):createTeleporter(rEvent)
end



local function on_player_cursor_stack_changed(e) 
    if global.teleporter.modules.player == false then return end
    local rEvent = RitnEvent(e)
    local rPlayer = rEvent:getPlayer()

    if rPlayer == nil then return end
    if rPlayer.player.cursor_stack.count == 0 then return end
    
    local LuaItemStack = rPlayer.player.cursor_stack
    if LuaItemStack == nil then return end
    if LuaItemStack.valid == false then return end
    
    if LuaItemStack.name == ritnlib.defines.teleporter.names.item.capsule then 
        local players = remote.call("RitnCoreGame", "get_players")
        if rPlayer.player.surface.name == players[rPlayer.player.index].origine or "nauvis" then return end 
        if rPlayer.player.cursor_stack.count == 0 then return end

        rPlayer.player.clear_cursor()
        rPlayer.player.print(ritnlib.defines.teleporter.names.caption.msg.cursor)
    end
end



local function on_player_mined_entity(e)
    if global.teleporter.modules.player == false then return end
    local rEvent = RitnEvent(e)
    local LuaEntity = rEvent.entity 
    RitnSurface(LuaEntity.surface):removeTeleporter(rEvent)

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