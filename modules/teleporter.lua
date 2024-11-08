-- MODULE : TELEPORTER
---------------------------------------------------------------------------------------------


local function on_player_driving_changed_state(e)
    if storage.teleporter.modules.teleporter == false then return end
    local rEvent = RitnCoreEvent(e)
    local rPlayer = rEvent:getPlayer()

    local LuaEntity = rEvent.entity 

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

            if rTeleporter:exist() then 
                if driving then 
                    RitnGuiTeleporter(e):action_open(rTeleporter)
                else
                    RitnGuiTeleporter(e):action_close()
                end
            end
        end
    end
end


local function on_gui_opened(e)
    if storage.teleporter.modules.teleporter == false then return end
    local rTeleporter = RitnTeleporter(RitnCoreEvent(e).entity)
    if rTeleporter:exist() then 
        RitnGuiTeleporter(e):action_open(rTeleporter)
    end
end


local function on_gui_click(e)
    if storage.teleporter.modules.teleporter == false then return end
    RitnGuiTeleporter(e):on_gui_click()
end


---------------------------------------------------------------------------------------------
local module = {events = {}}
---------------------------------------------------------------------------------------------
module.events[defines.events.on_player_driving_changed_state] = on_player_driving_changed_state
module.events[defines.events.on_gui_opened] = on_gui_opened
module.events[defines.events.on_gui_click] = on_gui_click
---------------------------------------------------------------------------------------------
return module