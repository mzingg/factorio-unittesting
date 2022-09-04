local assertThatItem = {
    type = "item",
    name = "tdf-assert-that",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64,
    flags = {},
    subgroup = "circuit-network",
    order = "a[light]-a[assert-that]",
    place_result = "tdf-assert-that",
    stack_size = 5
}

local assertThatRecipe = {
    type = "recipe",
    name = "tdf-assert-that",
    enabled = true,
    ingredients = {
        { "electronic-circuit", 1 },
        { "iron-stick", 3 },
        { "iron-plate", 1 }
    },
    result = "tdf-assert-that"
}

local assertThatEntity = {
    type = "lamp",
    name = "tdf-assert-that",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "small-lamp" },
    max_health = 100,
    corpse = "lamp-remnants",
    dying_explosion = "lamp-explosion",
    collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    energy_source = {
        type = "electric",
        usage_priority = "lamp"
    },
    energy_usage_per_tick = "5KW",
    darkness_for_all_lamps_on = 0.5,
    darkness_for_all_lamps_off = 0.3,
    light = { intensity = 0.9, size = 40, color = { r = 1.0, g = 1.0, b = 0.75 } },
    light_when_colored = { intensity = 0, size = 6, color = { r = 1.0, g = 1.0, b = 0.75 } },
    glow_size = 6,
    glow_color_intensity = 1,
    glow_render_mode = "multiplicative",
    picture_off = {
        layers = {
            {
                filename = "__base__/graphics/entity/small-lamp/lamp.png",
                priority = "high",
                width = 42,
                height = 36,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(0, 3),
                hr_version = {
                    filename = "__base__/graphics/entity/small-lamp/hr-lamp.png",
                    priority = "high",
                    width = 83,
                    height = 70,
                    frame_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(0.25, 3),
                    scale = 0.5
                }
            },
            {
                filename = "__base__/graphics/entity/small-lamp/lamp-shadow.png",
                priority = "high",
                width = 38,
                height = 24,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(4, 5),
                draw_as_shadow = true,
                hr_version = {
                    filename = "__base__/graphics/entity/small-lamp/hr-lamp-shadow.png",
                    priority = "high",
                    width = 76,
                    height = 47,
                    frame_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(4, 4.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    },
    picture_on = {
        filename = "__base__/graphics/entity/small-lamp/lamp-light.png",
        priority = "high",
        width = 46,
        height = 40,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, -7),
        hr_version = {
            filename = "__base__/graphics/entity/small-lamp/hr-lamp-light.png",
            priority = "high",
            width = 90,
            height = 78,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, -7),
            scale = 0.5
        }
    },
    signal_to_color_mapping = {
        { type = "virtual", name = "signal-red", color = { r = 1, g = 0, b = 0 } },
        { type = "virtual", name = "signal-green", color = { r = 0, g = 1, b = 0 } },
        { type = "virtual", name = "signal-blue", color = { r = 0, g = 0, b = 1 } },
        { type = "virtual", name = "signal-yellow", color = { r = 1, g = 1, b = 0 } },
        { type = "virtual", name = "signal-pink", color = { r = 1, g = 0, b = 1 } },
        { type = "virtual", name = "signal-cyan", color = { r = 0, g = 1, b = 1 } },
        { type = "virtual", name = "signal-white", color = { r = 1, g = 1, b = 1 } }
    },

    circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
    circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
}

data:extend({
    assertThatItem,
    assertThatRecipe,
    assertThatEntity
})