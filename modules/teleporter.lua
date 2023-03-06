-- MODULE : TELEPORTER
---------------------------------------------------------------------------------------------
local RitnEvent = require(ritnlib.defines.core.class.event)
local RitnSurface = require(ritnlib.defines.teleporter.class.surface)
local RitnTeleporter = require(ritnlib.defines.teleporter.class.teleporter)
local RitnGuiTeleporter = require(ritnlib.defines.teleporter.class.guiTeleporter)
---------------------------------------------------------------------------------------------



local function on_player_driving_changed_state(e)
    local rEvent = RitnEvent(e)
    local rPlayer = rEvent:getPlayer()

    local LuaEntity = rEvent.entity 

    if LuaEntity then 
        local rTeleporter = RitnTeleporter(LuaEntity)
        if rTeleporter then 
            
            local driving = false
            if rPlayer.driving and rTeleporter.drive ~= nil then
                if rTeleporter.drive.name == rPlayer.name then 
                    driving = true
                elseif rTeleporter.drive.name == "character" then 
                    if rTeleporter.drive.player.name == rPlayer.name then 
                        driving = true
                    end
                end
            end

            if driving then 
                if rTeleporter:open() then 
                    RitnGuiTeleporter(e):action_open(rTeleporter)
                end
            else
                if rTeleporter:close() then 
                    RitnGuiTeleporter(e):action_close()
                end
            end
        end
    end
end


local function on_gui_opened(e)
    local rTeleporter = RitnTeleporter(RitnEvent(e).entity)
    if rTeleporter:open() then 
        RitnGuiTeleporter(e):action_open(rTeleporter)
    end
end


local function on_gui_click(e)
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