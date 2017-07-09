local unitTestItem = {
    type = "item",
    name = "unit-test",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"goes-to-quickbar"},
    subgroup = "circuit-network",
    order = "a[light]-a[unit-test]",
    place_result = "unit-test",
    stack_size = 50
}

local unitTestRecipe = {
    type = "recipe",
    name = "unit-test",
    enabled = true,
    ingredients =
    {
        {"electronic-circuit", 1},
        {"iron-stick", 3},
        {"iron-plate", 1}
    },
    result = "unit-test"
}

local unitTestEntity =   {
    type = "lamp",
    name = "unit-test",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "unit-test"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "5KW",
    light = {intensity = 0.9, size = 40, color = {r=1.0, g=1.0, b=1.0}},
    light_when_colored = {intensity = 1, size = 6, color = {r=1.0, g=1.0, b=1.0}},
    glow_size = 6,
    glow_color_intensity = 0.135,
    picture_off =
    {
        filename = "__base__/graphics/entity/small-lamp/light-off.png",
        priority = "high",
        width = 67,
        height = 58,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-0.015625, 0.15625},
    },
    picture_on =
    {
        filename = "__base__/graphics/entity/small-lamp/light-on-patch.png",
        priority = "high",
        width = 62,
        height = 62,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-0.03125, -0.03125},
    },
    signal_to_color_mapping =
    {
        {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
        {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
        {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
        {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
        {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
        {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}},
    },

    circuit_wire_connection_point =
    {
        shadow =
        {
            red = {0.734375, 0.578125},
            green = {0.609375, 0.640625},
        },
        wire =
        {
            red = {0.40625, 0.34375},
            green = {0.40625, 0.5},
        }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.28125}, {0.1875, 0.28125}, 18),
    circuit_wire_max_distance = 1000
}

data:extend({
    unitTestItem,
    unitTestRecipe,
    unitTestEntity
})