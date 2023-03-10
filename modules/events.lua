---------------------------------------------------------------------------------------------
-- EVENTS
---------------------------------------------------------------------------------------------
local RitnGuiTeleporter = require(ritnlib.defines.teleporter.class.guiTeleporter)
---------------------------------------------------------------------------------------------
local events = {}

  
local function on_init(event)
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
    -- create remote interfaces
    local teleporter_interface = {
        ["gui_action_teleporter"] = function(action, event)
            if action == ritnlib.defines.teleporter.gui_actions.teleporter.open then 
                RitnGuiTeleporter(event):action_open()
            elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.close then 
                RitnGuiTeleporter(event):action_close()
            elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.teleport then 
                RitnGuiTeleporter(event):action_teleport()
            elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.valid then 
                RitnGuiTeleporter(event):action_valid()
            elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.edit then 
                RitnGuiTeleporter(event):action_edit()
            elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.up then 
                RitnGuiTeleporter(event):action_up()
            elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.down then 
                RitnGuiTeleporter(event):action_down()
            end
        end,
        --disable modules
        ["disable.module.player"] = function()
            global.teleporter.modules.player = false
        end,
        ["disable.module.teleporter"] = function()
            global.teleporter.modules.teleporter = false
        end,
    }
    remote.add_interface("RitnTeleporter", teleporter_interface)
    -------------------------------------------------------------
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
-- on_init
script.on_init(on_init)
-------------------------------------------
return events