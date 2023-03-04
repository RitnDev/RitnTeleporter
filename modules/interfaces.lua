local RitnGuiTeleporter = require(ritnlib.defines.teleporter.class.guiTeleporter)
------------------------------------------------------------------------------


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
    ["disable.module.commands"] = function()
        global.teleporter.modules.commands = false
    end,
}


if not remote.interfaces["RitnTeleporter"] then
    remote.add_interface("RitnTeleporter", teleporter_interface)
end


return {}