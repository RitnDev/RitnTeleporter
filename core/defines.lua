-----------------------------------------
--               DEFINES               --
-----------------------------------------
if not ritnlib then ritnlib = { defines={} } end
local name = "RitnTeleporter"
local dir = "__".. name .."__"
local directory = dir .. "."


local defines = {}

-- Mod ID.
defines.name = name
-- Path to the mod's directory.
defines.directory = dir

-- classes
defines.class = {
    surface = dir .. ".classes.RitnSurface",
    teleporter = dir .. ".classes.RitnTeleporter",
    ----
    guiTeleporter = dir .. ".classes.RitnGuiTeleporter",
}


-- Modules
defines.modules = {
    core = dir .. ".core.modules",
    globals = dir .. ".modules.globals",
    events = dir .. ".modules.events",
    ----
    player = dir .. ".modules.player",
    teleporter = dir .. ".modules.teleporter",
    ----
}


-- graphics
local graphics = dir .. "/graphics/"
local gui = graphics .. "gui/"
defines.graphics = {
    gui = {
        button_edit = gui .. "edit.png",
        button_up = gui .. "up.png",
        button_down = gui .. "down.png",
        button_valid = gui .. "valid.png",
    },
    entity = {
        teleporter = graphics .. "entity/ritn-teleporter/ritn-teleporter.png",
    },
    techno = {
        teleport = graphics .. "technology/teleporter-64.png",
        capsule = graphics .. "icons/teleporter-capsule.png",
    },
    icon = {
        teleporter = graphics .. "icons/teleporter-64.png",
        remote = graphics .. "icons/teleporter-remote.png",
        capsule = graphics .. "icons/teleporter-capsule.png",
    },
    empty = "__core__/graphics/empty.png",
}

-- sounds
local sounds = dir .. "/sounds/"
defines.sound = {
    none = sounds .. "none.ogg",
    open = sounds .. "portal_open.ogg",
    close = sounds .. "portal_close.ogg",
}


-- prototypes
local dir_proto = directory .. "prototypes."
defines.prototypes = {
    category = dir_proto .. "category",
    entity = dir_proto .. "entity.ritn-teleporter",
    item = dir_proto .. "items",
    technology = dir_proto .. "technology",
    styles = dir_proto .. "styles",
    inputs = dir_proto .. "custom-inputs",
}


-- Prefix
defines.prefix = {
    name = "ritnmods-",
    mod = "teleporter-",
}


-- gui
defines.gui = {}
local dir_gui = directory .. "gui."
---------------------------
defines.gui.teleporter = dir_gui .. "teleporter"
---------------------------


defines.gui_actions = {
    teleporter = {
        open = "open",
        close = "close",
        teleport = "button-teleport",
        edit = "button-edit",
        valid = "button-valid",
        up = "button-up",
        down = "button-down",
    },
}



--settings 
local settings_prefix = defines.prefix.name .. defines.prefix.mod
defines.settings = {
    teleporter_enable = {
        name = settings_prefix .. "teleporter-enable",
        value = true, 
    }
}


-- Name and value
defines.names = {

    item_group = {
        teleport = "logistics",
    },
    item_subgroups = {
        teleport = "ritn-teleportation",
    },
    entity = {
        teleporter = "ritn-teleporter", 
    },
    item = {
        remote = "ritn-teleporter-remote", 
        capsule = "ritn-teleporter-capsule", 
    },
    recipe = {
        remote = "ritn-teleporter-remote", 
        capsule = "ritn-teleporter-capsule", 
    },
    technology = {
        teleport = "tech-ritn-teleportation",
        capsule = "tech-ritn-teleportation",
    },


    --GUI STYLES
    styles = {
        spriteButton = "style_sprite_button_ritn",
        ritnFrameButton = "ritn_frame_button"
    },
    sprite = {
        button_edit = "sprite_button_edit",
        button_up = "sprite_button_up",
        button_down = "sprite_button_down",
        button_valid = "sprite_button_valid",
    },
    customInput = {
        frame_close1 = defines.prefix.name .. "close-frame-teleporter1",
        frame_close2 = defines.prefix.name .. "close-frame-teleporter2",
    }
    
}


-- GUI element captions.
defines.names.caption = {

    msg = {       
        cursor = {"msg.cursor"},
    },

    frame_teleporter = {
        titre = {"entity-name.ritn-teleporter"},
        label_enter = {"frame-teleporter.label-enter"},
        label_passenger = {"frame-teleporter.label-passenger"},
        button_teleport = {"frame-teleporter.teleport-button"},
        button_empty = {"frrame-teleporter.button-empty"},
    }

}

----------------
ritnlib.defines.teleporter = defines
log('declare : ritnlib.defines.teleporter | '.. ritnlib.defines.teleporter.name ..' -> finish !')