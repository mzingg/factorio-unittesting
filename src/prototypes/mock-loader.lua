local mockLoaderItem = {
    type = "item",
    name = "mock-loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = { "goes-to-quickbar" },
    subgroup = "belt",
    place_result="mock-loader",
    order = "d[loader]-d[mock-loader]",
    stack_size= 50
}

local mockLoaderRecipe = {
    type = "recipe",
    name = "mock-loader",
    category = "crafting",
    normal = {
        enabled = true,
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 5}
        },
        result = "mock-loader"
    },
    expensive = {
        enabled = true,
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 5}
        },
        result = "mock-loader"
    }
}

local mockLoaderEntity = {
    type = "loader",
    name = "mock-loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "mock-loader"},
    max_health = 170,
    filter_count = 2,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    belt_horizontal = express_belt_horizontal,
    belt_vertical = express_belt_vertical,
    ending_top = express_belt_ending_top,
    ending_bottom = express_belt_ending_bottom,
    ending_side = express_belt_ending_side,
    starting_top = express_belt_starting_top,
    starting_bottom = express_belt_starting_bottom,
    starting_side = express_belt_starting_side,
    fast_replaceable_group = "loader",
    speed = 0.09375,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    ending_patch = ending_patch_prototype
}

data:extend({
    mockLoaderItem,
    mockLoaderRecipe,
    mockLoaderEntity
})