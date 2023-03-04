data:extend({

  {
    --ritn-teleporter-capsule
      type = "technology",
      name = ritnlib.defines.teleporter.names.technology.capsule,
      icon = ritnlib.defines.teleporter.graphics.techno.capsule,
      icon_size = 64,
      hidden = true,
      enabled = false,
      effects = {
        {type = "unlock-recipe", recipe = ritnlib.defines.teleporter.names.recipe.capsule },
      },
      prerequisites = {"circuit-network", "steel-processing"},
      unit = {
        count = 200,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        },
        time = 30
      },
      order="a-d-e"
}



--[[   {
      --ritn-teleporter
        type = "technology",
        name = ritnlib.defines.teleporter.names.technology.teleport,
        icon = ritnlib.defines.teleporter.graphics.techno.teleport,
        icon_size = 64,
        hidden = true,
        enabled = false,
        effects = {
          {type = "unlock-recipe", recipe = ritnlib.defines.teleporter.names.recipe.remote },
        },
        prerequisites = {"circuit-network"},
        unit = {
          count = 200,
          ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        order="a-d-e"
  } ]]
})
