---------------------------------------------------------------------------------------------
-- GLOBALS
---------------------------------------------------------------------------------------------
if global.teleporter == nil then
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
---------------------------------------------------------------------------------------------
-- REMOTE FUNCTIONS INTERFACE
---------------------------------------------------------------------------------------------
local teleporter_interface = {
    ["gui_action_teleporter"] = function(action, event)
        if action == ritnlib.defines.teleporter.gui_actions.teleporter.open then 
            RitnGuiTeleporter(event):action_open()
        elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.close then 
            RitnGuiTeleporter(event):action_close()
        elseif action == ritnlib.defines.teleporter.gui_actions.teleporter.button_close then 
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
---------------------------------------------------------------------------------------------
return {}