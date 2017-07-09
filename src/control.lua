UnitTesting = {}

require("entity.mock-loader")
require("entity.unit-test")
require("scripts.monitor")

script.on_event(defines.events.on_built_entity, function(eventArguments)
    UnitTesting.Monitor:register(eventArguments.created_entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(eventArguments)
    UnitTesting.Monitor:register(eventArguments.created_entity)
end)

script.on_event(defines.events.on_entity_died, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_robot_mined_entity, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_tick, function()
    UnitTesting.Monitor:update(game.tick);
end)