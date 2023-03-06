  --ritn_teleporter

  data:extend({

    {
        type = "car",
        name = ritnlib.defines.teleporter.names.entity.teleporter,
        icon = ritnlib.defines.teleporter.graphics.icon.teleporter,
        icon_size = 64,
        flags = {
            "placeable-neutral", 
            "placeable-player", 
            "player-creation", 
            "not-blueprintable", 
            "not-deconstructable", 
            "not-flammable", 
            "not-rotatable"
        },
        minable = {hardness = 0.2, mining_time = 0.5},
        max_health = 10000,
        inventory_size = 0,
        collision_box = {{-1.5, -1.5}, {1.5, 1.5}}, 
        collision_mask = {"item-layer", "object-layer", "water-tile", "not-colliding-with-itself"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        opening_sound = { filename = ritnlib.defines.teleporter.sound.none, volume = 0.5 },
        mining_sound = { filename = ritnlib.defines.teleporter.sound.none, volume = 0.5 },
        build_sound = { filename = ritnlib.defines.teleporter.sound.open, volume = 0.5 },
        mined_sound = { filename = ritnlib.defines.teleporter.sound.close, volume = 0.5 },
        braking_force= 0.001,
        energy_per_hit_point = 0.001,
        friction = 0.0000001,
        rotation_speed = 0,
        weight = 1700000,
        effectivity = 0.01,
        consumption = "1kW",
        energy_source = {type = "void"},
        allow_passengers = true,
        minimap_representation = nil,
        selected_minimap_representation = nil,
        animation = {
            layers = {
                {
                    priority = "high",
                    width = 110,
                    height = 110,
                    frame_count = 1,
                    direction_count = 1,
                    animation_speed = 1,
                    max_advance = 0.2,
                    stripes = {
                        {
                            filename = ritnlib.defines.teleporter.graphics.entity.teleporter,
                            width_in_frames = 110,
                            height_in_frames = 110,
                        }
                    },
                },
            }
        },
    },

    {
        --item
        type = "item",
        name = ritnlib.defines.teleporter.names.entity.teleporter,
        icon = ritnlib.defines.teleporter.graphics.icon.teleporter,
        icon_size = 64,
        stack_size = 1,
        subgroup = ritnlib.defines.teleporter.names.item_subgroups.teleport,
        order = "aaa[items]-ab[".. ritnlib.defines.teleporter.names.entity.teleporter .."]",
        enabled = false,
    },
})