---------------------------------------------------------------------------------------------
-- EVENTS
---------------------------------------------------------------------------------------------  
local function on_init_mod(event)
    log('RitnTeleporter -> on_init !')
    ---------------------------------------------
    local enemy = remote.call('RitnCoreGame', 'get_enemy')
    if enemy.force_disable ~= nil then 
        enemy.force_disable = false
    end
    remote.call('RitnCoreGame', "set_enemy", enemy)
    ---------------------------------------------
    remote.call("RitnCoreGame", "init_data", "teleporter", {
        id = 0,         -- unit_number
        name = "",
        surface_name = "",
        force_name = "",
        position = {x=0, y=0},
        render_id = -1,
        tag_number = -1,
        index = 0,
    })
    remote.call("RitnCoreGame", "add_param_data", "surface", "teleporters", {})
    -------------------------------------------------------------
    log('on_init : RitnTeleporter -> finish !')
end

local function on_configuration_changed()
    local enemy = remote.call('RitnCoreGame', 'get_enemy')
    if enemy.force_disable == nil then 
        enemy.force_disable = false
        remote.call('RitnCoreGame', "set_enemy", enemy)
    end
    log("on_configuration_changed()")
end


local function customInput_close_frame(event)
    remote.call("RitnTeleporter", "gui_action_teleporter", "close", event)
end

-------------------------------------------
-- event : custom-input
script.on_event(ritnlib.defines.teleporter.names.customInput.frame_close1, customInput_close_frame)
script.on_event(ritnlib.defines.teleporter.names.customInput.frame_close2, customInput_close_frame)
-------------------------------------------
script.on_init(on_init_mod)
script.on_configuration_changed(on_configuration_changed)
-------------------------------------------
return {}