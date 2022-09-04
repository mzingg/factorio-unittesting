local mockLoaderItem = {
    type = "item",
    name = "tdf-mock-loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 64,
    flags = { },
    subgroup = "belt",
    place_result="tdf-mock-loader",
    order = "d[loader]-d[mock-loader]",
    stack_size= 50
}

local mockLoaderRecipe = {
    type = "recipe",
    name = "tdf-mock-loader",
    category = "basic-crafting",
    normal = {
        enabled = true,
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 5}
        },
        result = "tdf-mock-loader"
    },
    expensive = {
        enabled = true,
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 5}
        },
        result = "tdf-mock-loader"
    }
}

local mockLoaderEntity = {
    type = "loader",
    name = "tdf-mock-loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "tdf-mock-loader"},
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
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.75 / 8,
    structure_render_layer = "lower-object",
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
    }
}

data:extend({
    mockLoaderItem,
    mockLoaderRecipe,
    mockLoaderEntity
})