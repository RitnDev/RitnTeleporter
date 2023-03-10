------------------------------------------------------------------------------------------------------------------------
-- EVENTS
---------------------------------------------------------------------------------------------
local events = {}

  
function events.on_init(event)
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
end
 

-- event : custom-input -> frame_close
script.on_event(ritnlib.defines.teleporter.names.customInput.frame_close1, function(event)
    remote.call("RitnTeleporter", "gui_action_teleporter", "close", event)
end)
script.on_event(ritnlib.defines.teleporter.names.customInput.frame_close2, function(event)
    remote.call("RitnTeleporter", "gui_action_teleporter", "close", event)
end)

-------------------------------------------
-- INIT GLOBAL MOD
-------------------------------------------
if not global.teleporter then 
    global.teleporter = { 
        modules = {
            player = true,
            teleporter = true,
        },
        tileNoTeleporter = {
            ["out-of-map"] = true,
            ["deepwater"] = true,
            ["deepwater-green"] = true,
        }
    }
end
-------------------------------------------
return events