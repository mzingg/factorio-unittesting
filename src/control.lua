require("scripts.base")
require("scripts.mock-loader")
require("scripts.monitor")

script.on_event(defines.events.on_built_entity, function(eventArguments)
    UnitTesting.Monitor:register(eventArguments.created_entity)
end)

script.on_event(defines.events.on_entity_died, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_player_mined_entity, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_robot_mined_entity, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_tick, function()
    UnitTesting.Monitor:update(game.tick);
end)